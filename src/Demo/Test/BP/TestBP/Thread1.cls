/// This class is generated by the Demo.Test.BP.TestBP BPL class.
/// This class should not be edited or modified in any way.
/// Do not make direct use of this class in your application.
Class Demo.Test.BP.TestBP.Thread1 Extends Ens.BP.Thread [ ClassType = persistent, CompileAfter = Demo.Test.BP.TestBP, GeneratedBy = Ens.BPL.Compiler.CLS, ProcedureBlock ]
{

Method S1(process As Ens.BusinessProcess, context As Ens.BP.Context, synctimedout As %Boolean, syncresponses As %ArrayOfObjects(ELEMENTTYPE="%Library.Persistent"), request As %Library.Persistent, response As %Library.Persistent) As %Status [ Language = objectscript, PublicList = (process, context) ]
{
 Set $ZT="Trap",status=$$$OK do {
 If (request.StringValue>1) {
 Set ..%NextState="S3"
 } else {
 Set ..%NextState="S2"
 }
 } while (0)
Exit Quit ..ManageState(status)
Trap Set $ZT="",status=..ManageStatus(status,"S1") Goto Exit
}

Method S2(process As Ens.BusinessProcess, context As Ens.BP.Context, synctimedout As %Boolean, syncresponses As %ArrayOfObjects(ELEMENTTYPE="%Library.Persistent"), request As %Library.Persistent, response As %Library.Persistent) As %Status [ Language = objectscript, PublicList = (process, context) ]
{
 Set $ZT="Trap",status=$$$OK do {
 If (request.StringValue>4) {
 Set ..%NextState="S5"
 } else {
 Set ..%NextState="S4"
 }
 } while (0)
Exit Quit ..ManageState(status)
Trap Set $ZT="",status=..ManageStatus(status,"S2") Goto Exit
}

Method S3(process As Ens.BusinessProcess, context As Ens.BP.Context, synctimedout As %Boolean, syncresponses As %ArrayOfObjects(ELEMENTTYPE="%Library.Persistent"), request As %Library.Persistent, response As %Library.Persistent) As %Status [ Language = objectscript, PublicList = (process, context) ]
{
 Set $ZT="Trap",status=$$$OK do {
 #; --- Begin Call BO1 ---
 #; --- Begin Request ---
 Set callrequest=##class(Ens.Request).%New()
 If '$IsObject(callrequest) Set status=%objlasterror Quit
 Set status=$$$OK,callrequest=request
 If $$$ISERR(status) Quit
 Set status=..MakeAsyncCall("OnResponse1","QueueTestBO001",callrequest,"BO1",1,0,"BO1",0)
 If $$$ISERR(status) Quit
 Kill callrequest
 #; --- End Request ---
 #; --- End Call BO1 ---
 Set ..%NextState="S2"
 } while (0)
Exit Quit ..ManageState(status)
Trap Set $ZT="",status=..ManageStatus(status,"S3") Goto Exit
}

Method S4(process As Ens.BusinessProcess, context As Ens.BP.Context, synctimedout As %Boolean, syncresponses As %ArrayOfObjects(ELEMENTTYPE="%Library.Persistent"), request As %Library.Persistent, response As %Library.Persistent) As %Status [ Language = objectscript, PublicList = (process, context) ]
{
 Set $ZT="Trap",status=$$$OK do {
 If (request.StringValue>7) {
 Set ..%NextState="S7"
 } else {
 Set ..%NextState="S6"
 }
 } while (0)
Exit Quit ..ManageState(status)
Trap Set $ZT="",status=..ManageStatus(status,"S4") Goto Exit
}

Method S5(process As Ens.BusinessProcess, context As Ens.BP.Context, synctimedout As %Boolean, syncresponses As %ArrayOfObjects(ELEMENTTYPE="%Library.Persistent"), request As %Library.Persistent, response As %Library.Persistent) As %Status [ Language = objectscript, PublicList = (process, context) ]
{
 Set $ZT="Trap",status=$$$OK do {
 #; --- Begin Call BO2 ---
 #; --- Begin Request ---
 Set callrequest=##class(Ens.Request).%New()
 If '$IsObject(callrequest) Set status=%objlasterror Quit
 Set status=$$$OK,callrequest=request
 If $$$ISERR(status) Quit
 Set status=..MakeAsyncCall("OnResponse2","QueueTestBO002",callrequest,"BO2",1,0,"BO2",0)
 If $$$ISERR(status) Quit
 Kill callrequest
 #; --- End Request ---
 #; --- End Call BO2 ---
 Set ..%NextState="S4"
 } while (0)
Exit Quit ..ManageState(status)
Trap Set $ZT="",status=..ManageStatus(status,"S5") Goto Exit
}

Method S6(process As Ens.BusinessProcess, context As Ens.BP.Context, synctimedout As %Boolean, syncresponses As %ArrayOfObjects(ELEMENTTYPE="%Library.Persistent"), request As %Library.Persistent, response As %Library.Persistent) As %Status [ Language = objectscript, PublicList = (process, context) ]
{
 Set $ZT="Trap",status=$$$OK do {
 Do process.ClearAllPendingResponses()
 Set ..%NextState="Stop"
 } while (0)
Exit Quit ..ManageState(status)
Trap Set $ZT="",status=..ManageStatus(status,"S6") Goto Exit
}

Method S7(process As Ens.BusinessProcess, context As Ens.BP.Context, synctimedout As %Boolean, syncresponses As %ArrayOfObjects(ELEMENTTYPE="%Library.Persistent"), request As %Library.Persistent, response As %Library.Persistent) As %Status [ Language = objectscript, PublicList = (process, context) ]
{
 Set $ZT="Trap",status=$$$OK do {
 #; --- Begin Call BO3 ---
 #; --- Begin Request ---
 Set callrequest=##class(Ens.Request).%New()
 If '$IsObject(callrequest) Set status=%objlasterror Quit
 Set status=$$$OK,callrequest=request
 If $$$ISERR(status) Quit
 Set status=..MakeAsyncCall("OnResponse3","QueueTestBO003",callrequest,"BO3",1,0,"BO3",0)
 If $$$ISERR(status) Quit
 Kill callrequest
 #; --- End Request ---
 #; --- End Call BO3 ---
 Set ..%NextState="S6"
 } while (0)
Exit Quit ..ManageState(status)
Trap Set $ZT="",status=..ManageStatus(status,"S7") Goto Exit
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
