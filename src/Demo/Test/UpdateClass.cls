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
	if $g(^QueueData)=1{
	    set str="<kpi xmlns=""http://www.intersystems.com/deepsee/kpi"""_$c(13,10)_"name=""Demo/QueueMonitoringKPI"""_$c(13,10)_"sourceType=""manual"""_$c(13,10)_"caption=""队列趋势"""_$c(13,10)_">"_$c(13,10)_"<property name=""Num""/>"_$c(13,10)_"<property name=""QUEUETESTBO001""/>"_$c(13,10)_"<property name=""QUEUETESTBO002""/>"_$c(13,10)_"<property name=""QUEUETESTBO003""/>"_$c(13,10)_"</kpi>"
	}
	set newData=##class(%Stream.TmpCharacter).%New()
	DO newData.Write(str)
	set xdata.Data=newData
	set tsc= xdata.%Save()
	//w tsc,!
	d $system.OBJ.Compile("Demo.QueueMonitoringKPI","ck/displaylog=0")
}

}

