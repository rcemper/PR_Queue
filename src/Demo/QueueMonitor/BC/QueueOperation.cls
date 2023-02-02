Class Demo.QueueMonitor.BC.QueueOperation
{

ClassMethod QueueTrend(Output pOut As %String) As %Status
{


	Set dynamicObject = ##class(%DynamicObject).%New()
	Set dynamicArray = ##class(%DynamicArray).%New()
	Set resultStr=""
	Try{	
		
		
		set StartTime=$p($zdt($h,3)," ",1)_" 00:00:00"
		Set EndTime=$e($zdt($h,3),"1","15")_"0:00"
		Set times=$SYSTEM.SQL.DATEDIFF("mi",StartTime,EndTime)/10

		Set sqlStr="SELECT DISTINCT(ComponentName) from Demo_QueueMonitor_Table.HistoryQueues"
	    Set statement = ##class(%SQL.Statement).%New()
	    Set qStatus = statement.%Prepare(sqlStr)
	    if qStatus'=1 {w "ERROR"}
	    #dim rset As %SQL.StatementResult = statement.%Execute()
	    Set datetimeArray = ##class(%DynamicArray).%New()
	    
	    
	    set datetime=StartTime
		for i=0:1:times{
			Set QueueTime=$SYSTEM.SQL.DATEADD("mi",i*10,datetime)
			Do datetimeArray.%Push(QueueTime)
		}
	    
	    
	    while rset.%Next(){
		    Set dynamicObj = ##class(%DynamicObject).%New()
		    Do dynamicObj.%Set("ComponentName",rset.%Get("ComponentName"))
		    Set dynamicArr = ##class(%DynamicArray).%New()
		    set datetime=StartTime
		    Set ComponentFlag=0
		    for i=0:1:times{
			    
				Set QueueTime=$SYSTEM.SQL.DATEADD("mi",i*10,datetime)
				Set QueuesNumber=0
				Set ComponentName=rset.%Get("ComponentName")
				&sql(select QueuesNumber into:QueuesNumber from Demo_QueueMonitor_Table.HistoryQueues where ComponentName=:ComponentName and QueueTime=:QueueTime)
				if QueuesNumber>0{
					Set ComponentFlag=1
				}
				Do dynamicArr.%Push(QueuesNumber)
				;Do datetimeArray.%Push(QueueTime)
			}
			if ComponentFlag=1{
				Do dynamicObj.%Set("Trend",dynamicArr)
				Do dynamicArray.%Push(dynamicObj)
			}
	    }
	    Do dynamicObject.%Set("DateTime",datetimeArray)
	    Do dynamicObject.%Set("data",dynamicArray)
		set str= dynamicObject.%ToJSON()
		w str,!
	    set pOut=str
	
		
	}catch(ex){

		w ex.DisplayString(),!
	}
	Quit $$$OK
}

}

