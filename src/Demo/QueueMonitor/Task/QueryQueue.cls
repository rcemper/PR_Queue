Class Demo.QueueMonitor.Task.QueryQueue Extends %SYS.Task.Definition
{

Method OnTask() As %Status
{
	Set QueueTime=$e($ZDT($H,3),"1","15")_"0:00"
	try{
		Set sqlStr="call Ens.Queue_Enumerate()"
		Set statement = ##class(%SQL.Statement).%New()
		Set qStatus = statement.%Prepare(sqlStr)
		Set tSC=##class(Ens.Director).GetProductionStatus(.tProdName,.tState)
		#dim rset As %SQL.StatementResult = statement.%Execute()
		while rset.%Next(){
			w rset.%Get("Name"),"	",rset.%Get("Count"),!
			Set ComponentName=rset.%Get("Name")
			Set QueuesNumber=rset.%Get("Count")
            if QueuesNumber>0{
				&sql(insert into Demo_QueueMonitor_Table.HistoryQueues(QueueTime,ComponentName,QueuesNumber) Values (:QueueTime,:ComponentName,:QueuesNumber))		
            }
		} 
	}catch(ex){
		w ex.DisplayString(),!
	}
	Quit $$$OK
}

ClassMethod test()
{
	Set QueueTime=$e($ZDT($H,3),"1","15")_"0:00"
	try{
		Set sqlStr="call Ens.Queue_Enumerate()"
		Set statement = ##class(%SQL.Statement).%New()
		Set qStatus = statement.%Prepare(sqlStr)
		Set tSC=##class(Ens.Director).GetProductionStatus(.tProdName,.tState)
		#dim rset As %SQL.StatementResult = statement.%Execute()
		while rset.%Next(){
			w rset.%Get("Name"),"	",rset.%Get("Count"),!
			Set ComponentName=rset.%Get("Name")
			Set QueuesNumber=rset.%Get("Count")
            if QueuesNumber>0{
				&sql(insert into Demo_QueueMonitor_Table.HistoryQueues(QueueTime,ComponentName,QueuesNumber) Values (:QueueTime,:ComponentName,:QueuesNumber))		
            }
		} 
	}catch(ex){
		w ex.DisplayString(),!
	}
	Quit $$$OK
}

}

