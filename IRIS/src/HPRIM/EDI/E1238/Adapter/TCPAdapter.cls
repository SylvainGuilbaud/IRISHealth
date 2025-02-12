Include HPRIME1238

/// As specialized ASTM 2-way Adapter based on TCPInboundAdapter
Class HPRIM.EDI.E1238.Adapter.TCPAdapter Extends EnsLib.TCP.InboundAdapter [ ClassType = "", ProcedureBlock, System = 4 ]
{

/// Number of seconds to wait for a response to begin arriving back from the remote system after sending a request. Setting the timeout to -1 means wait forever.
Property ResponseTimeout As %Numeric(MINVAL = -1) [ InitialExpression = 15 ];

/// Separator characters to use when sending outbound ASTM documents.<p>
/// 'Flex' means copy the separators from inbound messages, or use the native separators of the outbound message if outbound goes first.
Property OutSeparators As %String(MAXLEN = 5, MINLEN = 5) [ InitialExpression = "Flex" ];

Parameter SETTINGS = "ResponseTimeout,OutSeparators";

/// Remember separators from last input document
Property %InSeparators As %String(MAXLEN = 5, MINLEN = 5);

/* Override InitialExpression */
/// TCP Port to connect to. To listen instead of intiating a connection, configure AllowedIPAddresses=!IPaddr.
Property Port As Ens.DataType.TCPAgentPort [ InitialExpression = 10001, Required ];

/* Override InitialExpression */
Property Terminators As %String [ InitialExpression = {$C(10)} ];

/// Flag to not send outbound until EOT is received, if in EOTOPTIONAL mode
Property %EOT As %Boolean [ InitialExpression = 1, Internal ];

/// Flag to remember ENQ was sent but more data was received
Property %ENQ As %Boolean [ Internal ];

/// Flag to hold current frame number in case it crosses message boundaries, if in EOTOPTIONAL mode
Property %FrameNum As %Integer [ InitialExpression = 1, Internal ];

/// List of events for $system.Socket.Select()
Property %EventList As %List [ Internal ];

/// Flag for outbound messages that require a synchronous reply
Property %SyncReplyHeader As Ens.MessageHeader [ Internal ];

Property OutQueueName As %String [ ReadOnly ];

/// If FrameNum begins at 0
Property ZeroFrameNum As %Boolean [ InitialExpression = 0 ];

/// Output Queue name is ConfigName:RemoteIPAddr. This allows JobPerConnection jobs to receive targeted output messages and to resume after a shutdown
Method getOutQueueName() [ CodeMode = expression, Internal ]
{
..BusinessHost.%ConfigName_":"_$P($S("!"=$E(..IOAddr):$E(..IOAddr,2,*), 1:$P(..IOAddr,"<-",2)),$S(..IOAddr["|":"|",1:":"))
}

Method OnConnected() As %Status
{
	Set tSC=$$$OK, (tENQ,tACK)="", $ZT="Trap"
	Do {
		Set tSC=..initEventList(.tAlsoConfig)  Quit:$$$ISERR(tSC)

		Read tENQ#1:0  Set tTimedOut='$Test
		If (tTimedOut&&..%EOT || ($$$ACK=tENQ && ..%ENQ)) && '$IsObject(..%SyncReplyHeader) {
			$$$catTRACE("connwait","No ENQ pending, looking for outbound messages to send")
			#; Check for non-empty queue; no need to lock because it's just us listening
			While $G($$$EnsQueue(..OutQueueName,0,"count")) || (tAlsoConfig&&$G($$$EnsQueue(..BusinessHost.%ConfigName,0,"count"))) {
				#; We think there's an ASTM doc waiting in our queue; try to acquire the line for sending
				If $$$ACK=tENQ {
					Set tENQ=$$$ENQ, tACK=$$$ACK, ..%ENQ=""
				} Else {
					Write $$$ENQ,*-3
					$$$catTRACE("protocol","Wrote <ENQ> request to send outbound message")
					While 1 {
						If -1=..ResponseTimeout {
							Read tACK#1
						} Else {
							Read tACK#1:..ResponseTimeout  Set tTimedOut='$Test
							If tTimedOut Set tSC=$$$ERROR($$$EnsErrTCPReadTimeoutExpired,..ResponseTimeout,"ASTM ENQ ACK","binary")  Quit
						}
						Quit:$$$ACK=tACK
						Continue:$C(13,10)[tACK
						If $$$ENQ=tACK {
							#; Assume we are the LIS and the remote is the device; therefore always yield (per ASTM 1381-95)
							Set tENQ=tACK
							$$$sysTRACE("Received ENQ in response to our ENQ; yielding and ACK'ing their ENQ")
						} ElseIf $$$STX=tACK {
							#; they are sending a fresh message without ENQ first; process it but remember we sent the ENQ for when they eventually ACK it.
							Set tENQ=tACK
							Set ..%ENQ=$$$ENQ
							$$$catTRACE("protocol","Got <STX> in response to our ENQ, continuing to read next message")
						} Else {
							Set tSC=$$$ERROR($$$EnsErrGeneral,"Received unexpected ASTM ENQ ACK character: Ascii "_$$$MapCtlChar(tACK))
						}
						Quit
					} Quit:$$$ISERR(tSC)||$Case(tACK, $$$ENQ:1, $$$STX:1, :0)
				}
				$$$catTRACE("protocol","Got <ACK> for our ENQ, dequeuing message to send")
				Set tSC = ##class(Ens.Queue).DeQueue(..OutQueueName,.tOutHdr,0)  Quit:$$$ISERR(tSC)
				If '$IsObject(tOutHdr) && tAlsoConfig {
					#; also check for message (from Operation) on shared queue if JobPerConnection=0 or N/A
					Set tSC = ##class(Ens.Queue).DeQueue(..BusinessHost.%ConfigName,.tOutHdr,0)  Quit:$$$ISERR(tSC)
					Quit:'$IsObject(tOutHdr)
				}
				Do tOutHdr.SetStatus($$$eMessageStatusDelivered)
				If tOutHdr.MessageBodyClassName'="" {
					Set tOutDoc = $classmethod(tOutHdr.MessageBodyClassName,"%OpenId",tOutHdr.MessageBodyId)
					If '$IsObject(tOutDoc)||'tOutDoc.%Extends("HPRIM.EDI.E1238.Document") Set tOutDoc=$$$NULLOREF  $$$LOGERROR("ASTM message body does not exist for Msg Header #"_tOutHdr.%Id()_" with body class "_tOutHdr.MessageBodyClassName)
				} Else {
					Set tOutDoc=$$$NULLOREF  $$$LOGERROR("No MessageBody classname for MessageHeader #"_tOutHdr.%Id())
				}
				If '$IsObject(tOutDoc) {
					Do tOutHdr.SetStatus($$$eMessageStatusError)
					Quit
				}
				#; Now we have an outbound ASTM document; send it
				Set tSeparators=$Case(..OutSeparators, "":tOutDoc.Separators, "Flex":$S(""'=..%InSeparators:..%InSeparators, 1:tOutDoc.Separators), :..OutSeparators)
				$$$sysTRACE("Sending ASTM doc "_tOutHdr.MessageBodyId_" on "_..IOAddr)
				Set tSC=tOutDoc.OutputToIOStream(..Socket,tSeparators,..SetFrameNum(),..ResponseTimeout)
				Set ..BusinessHost.%LastHandledTime=$ZH
				If $$$ISERR(tSC) {
					If ..IsWriteError(tSC)||..IsReadError(tSC) {
						Set tSC=$$$ERROR($$$EnsErrInConnectionLost,"ASTM Write", ..Device, $$$StatusDisplayString(tSC))
						Do ..Disconnect()
					}
					Do tOutHdr.SetStatus($$$eMessageStatusError)
					$$$LOGSTATUS(tSC)
					$$$ASAVEIOLOGENTRY(tSC,"after TCP WriteASTM error on "_..IOAddr,tOutDoc)
					Quit ; if error sending, try to receive instead
				} Else {
					Do tOutHdr.SetStatus($$$eMessageStatusCompleted)
					$$$ASAVEIOLOGENTRY(tSC,"after TCP WriteASTM on "_..IOAddr,tOutDoc)
					Kill $$$EnsActiveMessage($$$SystemName_":"_$Job)
					Set ..%SyncReplyHeader=tOutHdr
					Kill tOutHdr
				}
			} ; end queue While loop
			If $$$ISERR(tSC) {
				If $$$IsdefObject(tOutHdr)&&(""'=tOutHdr.ReturnQueueName) {
					Set tSC = tOutHdr.NewErrorResponse(.tResponseHeader,tSC)  Quit:$$$ISERR(tSC)
					Set tSC = ##class(Ens.Queue).EnQueue(tResponseHeader)  Quit:$$$ISERR(tSC)
				} Else { Quit }
			}
			If $Case(tACK, $$$ENQ:0, $$$STX:0, :1) {
				$$$catTRACE("connwait","Beginning read for ENQ with timeout "_..CallInterval_" on "_..IOAddr)
				Set tReadyList=$System.Socket.Select(..%EventList,..CallInterval)
				If $LL(tReadyList) {
					$$$catTRACE("protocol","Woke due to event(s) "_$LG(tReadyList,1)_"("_$Case($LF(..%EventList,$LG(tReadyList,1)),1:"TCP "_..IOAddr,2:"queue "_..OutQueueName,3:"queue "_..BusinessHost.%ConfigName,:"")_"), "_$LG(tReadyList,2)_"("_$Case($LF(..%EventList,$LG(tReadyList,2)),1:"TCP "_..IOAddr,2:"queue "_..OutQueueName,3:"queue "_..BusinessHost.%ConfigName,:"")_"), "_$LG(tReadyList,3)_"("_$Case($LF(..%EventList,$LG(tReadyList,3)),1:"TCP "_..IOAddr,2:"queue "_..OutQueueName,3:"queue "_..BusinessHost.%ConfigName,:"")_").")
					#; Clean out any bytes previously written to the queue event device(s)
					Set tDev=$LG(..%EventList,2)  If ""'=tDev && $LF(tReadyList,tDev) { Use tDev  try { For { Read tC#1:0  Quit:'$Test } } catch {}  Use ..Device }
					Set tDev2=$LG(..%EventList,3)  If ""'=tDev2 && (tDev2'=tDev) && $LF(tReadyList,tDev2) { Use tDev2  try { For { Read tC#1:0  Quit:'$Test } } catch {}  Use ..Device }
					If $LG(tReadyList)=..Device {
						Read tENQ#1:0  Set tTimedOut='$Test
						Quit:tTimedOut||""=tENQ
					}
				}
			}
			// Handshake in other cases
			set tSChandshake=..SendHandShake(.tENQ,.tACK)
			if (tSChandshake) Quit
		} ElseIf tTimedOut&&'..%EOT {
			$$$catTRACE("connwait","Not checking for outbound messages because in EOTOPTIONAL mode and no EOT received")
		}
		$$$ANEWINIOLOGENTRY($$$OK,"TCP ReadASTM on :"_..IOAddr,"HPRIM.EDI.E1238.Document")

		If $$$ENQ=tENQ {
			Set ..%FrameNum=1, ..%ENQ="" ; got an ENQ - reset frame sequence counter
		} ElseIf $$$STX=tENQ {
			If ..BusinessHost.%GetParameter("EOTOPTIONAL") { Set ..%EOT=0 } ; prevent ENQ send until EOT is received
			Else { Set ..%FrameNum=1 } ; when we get multiple messages with EOT but no ENQ between, reset the frame num for each message
			$$$catTRACE("protocol","Got <STX>, waiting to receive EOT")
		} Else {
			If $$$EOT=tENQ && ..BusinessHost.%GetParameter("EOTOPTIONAL") {
				Set ..%EOT=1, ..%FrameNum=1
				$$$catTRACE("protocol","Got <EOT>, ready to output messages")
			} ElseIf ""'=tENQ {
				Read tLine#32000:0
				$$$LOGWARNING("Expected <ENQ>; got: "_$$$MapCtlChars(tENQ_tLine))
				$$$ACLOSEIOLOGENTRY(tSC,"Expected <ENQ> on "_..IOAddr,tENQ_tLine)
			}
			Quit
		}
		#; Got an ENQ (or STX); ACK the ENQ and read message
		If tENQ=$$$ENQ { Write $$$ACK,*-3  $$$catTRACE("protocol","Got <ENQ>, sent <ACK>") }
		Else { $$$catTRACE("protocol","Got "_$$$MapCtlChars(tENQ)_", not sending <ACK>") }
		Set tSC=..BusinessHost.ProcessInput("",.tDoc)
		If $$$ISERR(tSC) {
			If ..IsWriteError(tSC)||..IsReadError(tSC) {
				Set tSC=$$$ERROR($$$EnsErrInConnectionLost,"ASTM Write",..IOAddr,$$$StatusDisplayString(tSC))
				Do ..Disconnect()
			}
			#; Returning error status will cause this listener job to terminate
			$$$ACLOSEIOLOGENTRY(tSC,"after TCP ProcessInput error on :"_..IOAddr,$$$NULLOREF)

			#; resolve Ensemble-to-Ensemble race conditions after ENQ-ENQ collision where we both yielded: hang a moment if we were not the initiator
			If tACK=tENQ && $$$StatusEquals(tSC,$$$EnsErrTCPReadTimeoutExpired) {
				Hang:""=..%outIPAddr 0.5 ; listen-for-connection mode
				Set tSC=$$$OK
			}
			Quit
		}
		If $$$IsdefObject(tDoc) Set ..%InSeparators=tDoc.Separators
		If $IsObject(..BusinessHost.IOLogEntry) && ..BusinessHost.IOLogEntry.IsEmpty() { Set ..BusinessHost.IOLogEntry=$$$NULLOREF } ; don't log empty IO if no error
		Else { $$$ACLOSEIOLOGENTRY(tSC,"after TCP ProcessInput on :"_..IOAddr,$$$NULLOREF) }
	} While 0
Exit
	#; Returning error status would cause this listener job to terminate
	If $$$ISERR(tSC) {
		#; Never quit the listener, but drop the connection on unrecognized error
		If ..Connected&&..StayConnected { $$$LOGERROR("Disconnecting due to "_$$$StatusDisplayString(tSC)) Set tSC=$$$OK  Do ..Disconnect() }
		If $$$ISERR(tSC) $$$LOGSTATUS(tSC)
	}
	Quit $$$OK
Trap
	Set $ZT="", tZE=$ZE
	If $G(tZE)["<READ>" || ($G(tZE)["<WRITE>") {
		Set tSC=$$$ERROR($$$EnsErrInConnectionLost,"ASTM Read",..IOAddr,tZE)
		If ""=tENQ Set tTxt=$$$StatusText(tSC), tSC=$$$OK  If ..StayConnected<0 { $$$LOGWARNING(tTxt) } ElseIf ..%logConnections { $$$LOGINFO(tTxt) } Else { $$$sysTRACE(tTxt) } ; change error to info if lost connection with no data
		Do ..Disconnect()
	} Else {
		Set tSC=$$$SystemError
	}
	Goto Exit
}

Method Disconnect()
{
	If ..Connected Do ..BusinessHost.%Parser.Reset()
	Do ##super()
	try {
		Set tDev=$LG(..%EventList,2)  If ""'=tDev { Do ##class(Ens.Queue).ClearEventDevice(..OutQueueName,tDev)  Close tDev }
		Set tDev2=$LG(..%EventList,3)  If ""'=tDev2 { Do ##class(Ens.Queue).ClearEventDevice(..BusinessHost.%ConfigName,tDev2)  Close tDev2 }
	} catch {
		Set tSC1=$$$SystemError
	}
	Set i%OutQueueName="", ..%EventList=""
}

Method initEventList(Output pAlsoConfig As %Boolean) As %Status [ Internal ]
{
	#; Re-initialize %EventList if needed
	Set tOutQueue=..getOutQueueName()
	Set pAlsoConfig=(("!"=$E(..AllowedIPAddresses)||'..JobPerConnection))
	If tOutQueue'=..OutQueueName {
		Set tOldDev=$LG(..%EventList,2)
		If ""'=tOldDev { Do ##class(Ens.Queue).ClearEventDevice(..OutQueueName,tOldDev)  Close tOldDev }
		Set i%OutQueueName=tOutQueue
	}
	Set tSC=..OpenEventDevice(.tDev)  Quit:$$$ISERR(tSC) tSC
	Set tSC=##class(Ens.Queue).SetEventDevice(tOutQueue,tDev)  Quit:$$$ISERR(tSC) tSC
	Set tOldDev2=$LG(..%EventList,3)
	If pAlsoConfig {
		If ..%EventList'=$LB(..Device,tOutQueue,..BusinessHost.%ConfigName) {
			If ""=tOldDev2 {
				Set tSC=..OpenEventDevice(.tDev2)  Quit:$$$ISERR(tSC) tSC
				Set tSC=##class(Ens.Queue).SetEventDevice(..BusinessHost.%ConfigName,tDev2)  Quit:$$$ISERR(tSC) tSC
			} Else {
				Set tDev2=tOldDev2 ; always our config name; no need to reopen or reset queue
			}
			Set ..%EventList=$LB(..Device,tDev,tDev2)
		}
	} Else {
		If ..%EventList'=$LB(..Device,tOutQueue) {
			If ""'=tOldDev2 { Do ##class(Ens.Queue).ClearEventDevice(..BusinessHost.%ConfigName,tOldDev2)  Close tOldDev2 }
			Set ..%EventList=$LB(..Device,tDev)
		}
	}
	Quit $$$OK
}

Method OpenEventDevice(Output pDevice As %Integer) As %Status [ Internal ]
{
	Set tSC=$$$OK, pDevice=""
	try {
		For tPort=20001:1:30000 {
			Set tEventDevice="|TCP|"_tPort
			Open tEventDevice:(:tPort:"SA-D"):0
			If $Test Set pDevice=tEventDevice Quit
		}
		Set:""=pDevice tSC=$$$ERROR($$$EnsErrGeneral,"Could not find a free port between 20001 and 30000 for $System.Socket.Select()") 
	} catch {
		Set tSC=$$$SystemError
	}
	Quit tSC
}

/// Code to send initial ENQ and read ACK and send EOT
Method SendHandShake(ByRef tENQ As %String, ByRef tACK As %String) As %Status
{
	// Maintaining dialog
	use ..Device
	Write $$$ENQ,*-3
	Set tSC=$$$OK
	$$$catTRACE("protocol","Wrote <ENQ> request to send outbound message")
	While 1 {
		If -1=..ResponseTimeout {
			Read tACK#1
		} Else {
			Read tACK#1:..ResponseTimeout  Set tTimedOut='$Test
			If tTimedOut Set tSC=$$$ERROR($$$EnsErrTCPReadTimeoutExpired,..ResponseTimeout,"A2.2 ENQ ACK","binary")  Quit
		}
		Quit:$$$ACK=tACK
	}
	Write $$$EOT,*-3
	s ..%SyncReplyHeader = $$$NULLOREF
	quit tSC
}

Method SetFrameNum() As %Integer
{
	if (..ZeroFrameNum)
	{
		q -1
	}
	else
	{
		q -2
	}
}

}
