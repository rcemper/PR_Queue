Class Demo.Test.ImitateMessage
{

ClassMethod Send(pInput As %Integer = 3)
{
	
	try{
		for i=1:1:pInput{
			Set SubscribeBS =##class(Demo.Test.BS.TestBS).%New("QueueTestBS001")
			Set Request=##class(Ens.StringRequest).%New()
	    	Set tSC=##class(Ens.Director).CreateBusinessService("QueueTestBS001",.SubscribeBS)
			Set Request.StringValue=$R(10)
	   		Set tSC=SubscribeBS.SendToBP("QueueTestBP",Request)
		}
	}catch(ex){
		W ex.DisplayString(),!
	}

    Quit $$$OK
}

}

