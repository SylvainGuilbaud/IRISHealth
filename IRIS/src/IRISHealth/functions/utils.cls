Class IRISHealth.functions.utils Extends Ens.Rule.FunctionSet
{

ClassMethod HL7Base64StreamToPDF(base64 As %Stream.TmpBinary) As %Stream.TmpBinary
{
    Try {
    
    set ^sgTRACE($INCREMENT(^sgTRACE))=$lb(1.1,$zdt($h,3))
  
	set stream = ##class(%Stream.TmpBinary).%New()
	Do base64.Rewind()
    Try {
        set ^sgTRACE($INCREMENT(^sgTRACE))=$lb(2.1,$zdt($h,3),"size:" _ base64.SizeGet())
        set ^sgTRACE($INCREMENT(^sgTRACE))=$lb(2.2,$zdt($h,3))

    }
    Catch ex {
        Set tSC=ex.AsStatus()
        set ^sgTRACE($INCREMENT(^sgTRACE))=$lb(2.3,$zdt($h,3),"error:"_$system.Status.GetErrorText(tSC))
        set ^sgTRACE($INCREMENT(^sgTRACE))=$lb(2.4,$zdt($h,3))
    }
    
	
	While 'base64.AtEnd {
	    set ln=base64.ReadLine()
	    set lnDecoded=$system.Encryption.Base64Decode(ln)
		do stream.Write(lnDecoded)
	}
	do stream.Rewind()

    Try {
        set ^sgTRACE($INCREMENT(^sgTRACE))=$lb(3.1,$zdt($h,3),"size stream:"_stream.SizeGet())
        set ^sgTRACE($INCREMENT(^sgTRACE))=$lb(3.2,$zdt($h,3),"size stream:"_stream.Read())
        set ^sgTRACE($INCREMENT(^sgTRACE))=$lb(3.3,$zdt($h,3))
    }
    Catch ex {
        Set tSC=ex.AsStatus()
        set ^sgTRACE($INCREMENT(^sgTRACE))=$lb(3.4,$zdt($h,3),"error:"_$system.Status.GetErrorText(tSC))
        set ^sgTRACE($INCREMENT(^sgTRACE))=$lb(3.5,$zdt($h,3))
    }

    }
    Catch ex {
        Set tSC=ex.AsStatus()
        set ^sgTRACE($INCREMENT(^sgTRACE))=$lb(1.2,$zdt($h,3),"error:"_$system.Status.GetErrorText(tSC))
        set ^sgTRACE($INCREMENT(^sgTRACE))=$lb(1.3,$zdt($h,3))
    }
    
	
	return stream
}

}
