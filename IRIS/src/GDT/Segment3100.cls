/// RECORDMAP: Modified during compilation of RecordMap 'GDT.Segment3100'
/// on 2025-05-30 at 14:42:29.902 [2025-05-30 13:42:29.902 UTC]
/// by user SuperUser
Class GDT.Segment3100 Extends EnsLib.RecordMap.RecordMap
{

Parameter OBJECTNAME = "GDT.Segment3100.Record";

/// THIS IS GENERATED CODE. DO NOT EDIT.<br/>
/// Method to retrieve a record from a stream or device. This method will be generated based on the
/// structure of the RecordMap. For testing purposes, a file name may be passed in the pStream argument.
ClassMethod GetObject(pStream As %IO.DeviceStream, Output pObject As %RegisteredObject, pTimeout As %Numeric = -1, ByRef pLookAhead As %String = "", pLabelFound As %Boolean = 0) As %Status
{
	Try {
		Set tStatus = $$$OK
		Set pObject = $$$NULLOREF
		If '$IsObject(pStream) {
			Set tFilename = pStream
			Set pStream = ##class(%IO.FileStream).%New()
			Do pStream.Open(tFilename,,pTimeout,"UTF-8", .tStatus)
			If $$$ISERR(tStatus) Quit
		}
		Set tObjectName = $parameter($this,"OBJECTNAME")
		Set tObject = $classmethod(tObjectName,"%New")
		If '$IsObject(tObject) {
			Set tStatus = $$$ERROR($$$CannotCreateObject,tObjectName)
			Quit
		}
		Set tObject.%Source = pStream.Name
		Set tGetTopFields = $parameter(tObject,"INCLUDETOPFIELDS")
		If pStream.AtEnd && (""=pLookAhead) {
			Set tStatus = $$$ERROR($$$EnsRecordMapErrStreamAtEnd, pStream.Name)
			Quit
		}
		Set pStream.CharEncoding = "UTF-8"

		#; Parse incoming stream
		Set tStatus = ..GetRecord(pStream, tObject, tGetTopFields, pTimeout, .pLookAhead, pLabelFound)
		If $$$ISERR(tStatus) Quit
	}
	Catch ex {
		Set tStatus = ex.AsStatus()
	}
	If $$$ISERR(tStatus) { Set pObject = $$$NULLOREF }
	Else { Set pObject = tObject }
	Quit tStatus
}

/// THIS IS GENERATED CODE. DO NOT EDIT.<br/>
/// Method to write a record to a stream or device. This method will be generated based on the
/// structure of the RecordMap. For testing purposes, a file name may be passed in the pStream argument.
ClassMethod PutObject(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pFlush As %Boolean = 1, ByRef pPadArray As %String) As %Status
{
	Try {
		Set tStatus = $$$OK
		If '$IsObject(pStream) {
			Set tFilename = pStream
			Set pStream = ##class(%IO.FileStream).%New()
			Do pStream.Open(tFilename,"WAE",,"UTF-8", .tStatus)
			If $$$ISERR(tStatus) Quit
		}
		Set tHasTopFields = $parameter(pObject,"INCLUDETOPFIELDS")
		Set pStream.CharEncoding = "UTF-8"

		Set tStatus = ..PutRecord(pStream, pObject, tHasTopFields, .pPadArray)
		If $$$ISERR(tStatus) Quit
		If pFlush Do pStream.Flush(.tStatus)
		If $$$ISERR(tStatus) Quit
	}
	Catch ex {
		Set tStatus = ex.AsStatus()
	}
	Quit tStatus
}

/// THIS IS GENERATED CODE. DO NOT EDIT.<br/>
/// Internal helper method to perform parse of incoming data
ClassMethod GetRecord(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pGetTopFields As %Boolean, pTimeout As %Numeric, ByRef pLookAhead As %String = "", pLabelFound As %Boolean = 0) As %Status [ Internal, Private ]
{
	Set tStatus = $$$OK
	If pLabelFound { Set tRecLabel = "" } 
	Else { Set tRecLabel = "3100|" } 
	Set tStatus = ..chunkRecord(pStream, .tRecordData, .tCharCount, "", pTimeout, $char(10), tRecLabel, .pLookAhead, $char(34), 0)
	If $$$ISERR(tStatus) Quit tStatus
	Set tMaxLocal = $$$MaxLocalLength
	Set tRecordData("charcount") = +$get(tCharCount)
	Set tCurrChunk = 1
	Set tTopPiece = 1
	Set tCurrSep = 1
	Set tStrings = 1
	Set tCurrString = ""
	Set tSeps = $listbuild($char(124))
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Else {
		Set tCurrString = tRecordData(tCurrChunk)
		Set tCurrPiece = 1
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Nom = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Prenom = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.DateNaissance =  pObject.DateNaissanceDisplayToLogical(tCurrString)
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Sexe = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Adresse = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.CodePostal = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Ville = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Pays = tCurrString
	}
	Quit tStatus
}

/// THIS IS GENERATED CODE. DO NOT EDIT.<br/>
/// Internal helper method to output object to a stream
ClassMethod PutRecord(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pHasTopFields As %Boolean, ByRef pPadArray As %String) As %Status [ Internal, Private ]
{
	Set tStatus = $$$OK
	Set tmpStream=##class(%Stream.TmpBinary).%New()
	Set tStatus = tmpStream.Write("3100|")
	If $$$ISERR(tStatus) Quit tStatus
	Do tmpStream.Write($select(pHasTopFields: ..Escape(pObject.Nom, $lb($char(124)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(124) _ $select(pHasTopFields: ..Escape(pObject.Prenom, $lb($char(124)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(124) _ $select(pHasTopFields: ..Escape(pObject.DateNaissanceLogicalToDisplay(pObject.DateNaissance), $lb($char(124)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(124) _ $select(pHasTopFields: ..Escape(pObject.Sexe, $lb($char(124)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(124) _ $select(pHasTopFields: ..Escape(pObject.Adresse, $lb($char(124)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(124) _ $select(pHasTopFields: ..Escape(pObject.CodePostal, $lb($char(124)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(124) _ $select(pHasTopFields: ..Escape(pObject.Ville, $lb($char(124)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(124) _ $select(pHasTopFields: ..Escape(pObject.Pays, $lb($char(124)),"quote",$char(34)),1: ""))
	Set tStatus = tmpStream.Write($char(10))
	If $$$ISERR(tStatus) Quit tStatus
	Do pStream.CopyFrom(tmpStream,,0,.tStatus)
	Quit tStatus
}

ClassMethod GetGeneratedClasses(Output pClasses As %String) As %Status
{
	Kill pClasses
	Set pClasses("GDT.Segment3100.Record")=""
	Set pClasses($classname())=""
	Quit $$$OK
}

ClassMethod getIdentifier() As %String [ CodeMode = expression ]
{
"3100|"
}

ClassMethod getType() As EnsLib.RecordMap.Model.DataType.RecordType [ CodeMode = expression ]
{
"delimited"
}

XData RecordMap [ XMLNamespace = "http://www.intersystems.com/Ensemble/RecordMap" ]
{
<Record xmlns="http://www.intersystems.com/Ensemble/RecordMap" name="GDT.Segment3100" type="delimited" char_encoding="UTF-8" targetClassname="GDT.Segment3100.Record" complexBatchManaged="0" label="3100|" padFromLeft="0" recordTerminator="\x0a" escaping="quote" escapeSequence="&quot;" allowEmbeddedRecordTerminator="0" allowEarlyTerminator="0">
  <Separators>
    <Separator>|</Separator>
  </Separators>
  <Field name="Nom" required="0" ignored="0" datatype="%String" params="MAXLEN=100" sqlColumn="3" repeating="0">
  </Field>
  <Field name="Prenom" required="0" ignored="0" datatype="%String" params="MAXLEN=100" sqlColumn="4" repeating="0">
  </Field>
  <Field name="DateNaissance" required="0" ignored="0" datatype="%Date" params="FORMAT=8" sqlColumn="5" repeating="0">
  </Field>
  <Field name="Sexe" required="0" ignored="0" datatype="%String" params="MAXLEN=1" sqlColumn="6" repeating="0">
  </Field>
  <Field name="Adresse" required="0" ignored="0" datatype="%String" params="MAXLEN=250" sqlColumn="7" repeating="0">
  </Field>
  <Field name="CodePostal" required="0" ignored="0" datatype="%String" params="MAXLEN=5" sqlColumn="8" repeating="0">
  </Field>
  <Field name="Ville" required="0" ignored="0" datatype="%String" params="MAXLEN=100" sqlColumn="9" repeating="0">
  </Field>
  <Field name="Pays" required="0" ignored="0" datatype="%String" params="MAXLEN=100" sqlColumn="10" repeating="0">
  </Field>
</Record>
}

}
