/// 
Class GDT.GDT Extends EnsLib.RecordMap.ComplexMap
{

Parameter BATCHCLASS = "GDT.GDT.Batch";

ClassMethod PutBatch(pIOStream As %IO.DeviceStream, pBatch As EnsLib.RecordMap.ComplexBatch) As %Status
{
	Set tStatus = $$$OK
	Try {
		If '$IsObject($get(pBatch)) Set tStatus = $$$ERROR($$$ObjectInstanceRequired) Quit
		If '$IsObject(pIOStream) {
			Set tFilename = pIOStream
			Set pIOStream = ##class(%IO.FileStream).%New()
			Do pIOStream.Open(tFilename,"WAE",,"UTF-8",.tStatus)
			If $$$ISERR(tStatus) Quit
		}
		If $IsObject(pBatch.S8000) {
			Set tStatus = ##class(GDT.Segment8000).PutObject(pIOStream,pBatch.S8000,0)
			If $$$ISERR(tStatus) Quit
		}
		If $IsObject(pBatch.S3100) {
			Set tStatus = ##class(GDT.Segment3100).PutObject(pIOStream,pBatch.S3100,0)
			If $$$ISERR(tStatus) Quit
		}
		If $IsObject(pBatch.S5100) {
			Set tStatus = ##class(GDT.Segment5100).PutObject(pIOStream,pBatch.S5100,0)
			If $$$ISERR(tStatus) Quit
		}
		If $IsObject(pBatch.S5200) {
			Set tStatus = ##class(GDT.Segment5200).PutObject(pIOStream,pBatch.S5200,0)
			If $$$ISERR(tStatus) Quit
		}
		Do pIOStream.Flush(.tStatus)
		If $$$ISERR(tStatus) Quit
	} Catch ex {
		Set tStatus = $$$SystemError
	}
	Quit tStatus
}

ClassMethod GetBatch(pIOStream As %IO.DeviceStream, pTimeout As %Numeric = -1, Output pBatch As EnsLib.RecordMap.ComplexBatch, ByRef pLookAhead As %String = "") As %Status
{
	Set tStatus = $$$OK
	Try {
		If '$IsObject(pIOStream) {
			Set tFilename = pIOStream
			Set pIOStream = ##class(%IO.FileStream).%New()
			Do pIOStream.Open(tFilename,,pTimeout,"UTF-8",.tStatus)
			If $$$ISERR(tStatus) Quit
		}
		Set pIOStream.CharEncoding = "UTF-8"
		Set pBatch = ##class(GDT.GDT.Batch).%New()
		Set pBatch.%Source = pIOStream.Name
		Set pLookAhead = $get(pLookAhead)
		Set tStatus = ##class(GDT.Segment8000).GetObject(pIOStream,.tObject,pTimeout,.pLookAhead)
		If $$$ISERR(tStatus) Set tStatus = $system.Status.AppendStatus($$$ERROR($$$EnsRecordMapErrComplexBasic,"S8000","GDT.Segment8000",$classname()),tStatus) Quit
		Set pBatch.S8000 = tObject
		Set tStatus = ##class(GDT.Segment3100).GetObject(pIOStream,.tObject,pTimeout,.pLookAhead)
		If $$$ISERR(tStatus) Set tStatus = $system.Status.AppendStatus($$$ERROR($$$EnsRecordMapErrComplexBasic,"S3100","GDT.Segment3100",$classname()),tStatus) Quit
		Set pBatch.S3100 = tObject
		Set tStatus = ##class(GDT.Segment5100).GetObject(pIOStream,.tObject,pTimeout,.pLookAhead)
		If $$$ISERR(tStatus) Set tStatus = $system.Status.AppendStatus($$$ERROR($$$EnsRecordMapErrComplexBasic,"S5100","GDT.Segment5100",$classname()),tStatus) Quit
		Set pBatch.S5100 = tObject
		If (5 > $length(pLookAhead)) {
			Set pLookAhead = pLookAhead _ pIOStream.Read(5-$length(pLookAhead),pTimeout,.tStatus)
			If $$$ISERR(tStatus) Quit
		}
		If ($extract(pLookAhead,1,5) = "5200|") {
			Set tStatus = ##class(GDT.Segment5200).GetObject(pIOStream,.tObject,pTimeout,.pLookAhead)
			If $$$ISERR(tStatus) Set tStatus = $system.Status.AppendStatus($$$ERROR($$$EnsRecordMapErrComplexBasic,"S5200","GDT.Segment5200",$classname()),tStatus) Quit
			Set pBatch.S5200 = tObject
		}
	} Catch {
		Set tStatus = $$$SystemError
	}
	Quit tStatus
}

Parameter RECORDMAPGENERATED = 1;

XData ComplexBatch [ XMLNamespace = "http://www.intersystems.com/Ensemble/RecordMap" ]
{
<ComplexBatch xmlns="http://www.intersystems.com/Ensemble/RecordMap" name="GDT.GDT" char_encoding="UTF-8" targetClassname="GDT.GDT.Batch">
  <RecordReference name="S8000" required="1" repeating="0" recordMap="GDT.Segment8000">
  </RecordReference>
  <RecordReference name="S3100" required="1" repeating="0" recordMap="GDT.Segment3100">
  </RecordReference>
  <RecordReference name="S5100" required="1" repeating="0" recordMap="GDT.Segment5100">
  </RecordReference>
  <RecordReference name="S5200" required="0" repeating="0" recordMap="GDT.Segment5200">
  </RecordReference>
</ComplexBatch>
}

}
