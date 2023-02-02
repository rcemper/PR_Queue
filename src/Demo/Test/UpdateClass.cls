Class Demo.Test.UpdateClass
{

ClassMethod update()
{
	set xdata=##class(%Dictionary.XDataDefinition).%OpenId("Demo.QueueMonitoringKPI||KPI")
	//zw xdata
	set str=xdata.Data.Read()
	set str=$p(str,">")_">"_$C(13,10)_"WILL BE REPLACED"_$C(13,10)_"</kpi>"
	set newProperty="<property name=""Num""/>"_$C(13,10)
	Set sqlStr="SELECT DISTINCT(ComponentName) from Demo_QueueMonitor_Table.HistoryQueues"
	Set statement = ##class(%SQL.Statement).%New()
	Set qStatus = statement.%Prepare(sqlStr)
	if qStatus'=1 {w "ERROR"}
	#dim rset As %SQL.StatementResult = statement.%Execute() 
	while rset.%Next(){
		set newProperty=newProperty_"<property name="""_rset.%Get("ComponentName")_"""/>"_$C(13,10)
	}
	set str=$replace(str,"WILL BE REPLACED",newProperty)
	//W str,!
	set newData=##class(%Stream.TmpCharacter).%New()
	DO newData.Write(str)
	set xdata.Data=newData
	set tsc= xdata.%Save()
	//w tsc,!
	d $system.OBJ.Compile("Demo.QueueMonitoringKPI","ck/displaylog=0")
}

}

