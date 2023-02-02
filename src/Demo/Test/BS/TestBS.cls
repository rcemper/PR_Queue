Class Demo.Test.BS.TestBS Extends Ens.BusinessService
{

Method SendToBP(BPName As %String, pInput As Ens.StringRequest, Output pOutput As Ens.StringResponse) As %Status
{
	Set pOutput=##Class(Ens.StringRequest).%New()
	set Tsc=..SendRequestAsync(BPName,pInput)
	Quit $$$OK
}

}

