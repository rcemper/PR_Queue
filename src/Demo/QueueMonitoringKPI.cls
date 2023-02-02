/* Copyright (c) 2020 by InterSystems Corporation.
   Cambridge, Massachusetts, U.S.A.  All rights reserved.
   Confidential property of InterSystems Corporation. */

Include Ensemble

/// For dashboard Ens.DeepSee.ActivityVolumeAndDuration.
Class Demo.QueueMonitoringKPI Extends %DeepSee.KPI [ System = 4 ]
{

Parameter DOMAIN = "Ensemble";

Parameter RESOURCE = "%Ens_Dashboard";

XData KPI [ XMLNamespace = "http://www.intersystems.com/deepsee/kpi" ]
{
<kpi xmlns="http://www.intersystems.com/deepsee/kpi"
 name="Demo/QueueMonitoringKPI"
 sourceType="manual"
 caption="队列趋势"
>
<property name="Num"/>
<property name="QUEUETESTBO001"/>
<property name="QUEUETESTBO002"/>
<property name="QUEUETESTBO003"/>

</kpi>
}

Method %OnLoadKPI() As %Status
{
	Try {
	    set tsc=##class(Demo.QueueMonitor.BC.QueueOperation).QueueTrend(.json)
	    if $g(^QueueData)=1{
	    	set json="{""DateTime"":[""2023-02-02 00:00:00"",""2023-02-02 00:10:00"",""2023-02-02 00:20:00"",""2023-02-02 00:30:00"",""2023-02-02 00:40:00"",""2023-02-02 00:50:00"",""2023-02-02 01:00:00"",""2023-02-02 01:10:00"",""2023-02-02 01:20:00"",""2023-02-02 01:30:00"",""2023-02-02 01:40:00"",""2023-02-02 01:50:00"",""2023-02-02 02:00:00"",""2023-02-02 02:10:00"",""2023-02-02 02:20:00"",""2023-02-02 02:30:00"",""2023-02-02 02:40:00"",""2023-02-02 02:50:00"",""2023-02-02 03:00:00"",""2023-02-02 03:10:00"",""2023-02-02 03:20:00"",""2023-02-02 03:30:00"",""2023-02-02 03:40:00"",""2023-02-02 03:50:00"",""2023-02-02 04:00:00"",""2023-02-02 04:10:00"",""2023-02-02 04:20:00"",""2023-02-02 04:30:00"",""2023-02-02 04:40:00"",""2023-02-02 04:50:00"",""2023-02-02 05:00:00"",""2023-02-02 05:10:00"",""2023-02-02 05:20:00"",""2023-02-02 05:30:00"",""2023-02-02 05:40:00"",""2023-02-02 05:50:00"",""2023-02-02 06:00:00"",""2023-02-02 06:10:00"",""2023-02-02 06:20:00"",""2023-02-02 06:30:00"",""2023-02-02 06:40:00"",""2023-02-02 06:50:00"",""2023-02-02 07:00:00"",""2023-02-02 07:10:00"",""2023-02-02 07:20:00"",""2023-02-02 07:30:00"",""2023-02-02 07:40:00"",""2023-02-02 07:50:00"",""2023-02-02 08:00:00"",""2023-02-02 08:10:00"",""2023-02-02 08:20:00"",""2023-02-02 08:30:00"",""2023-02-02 08:40:00"",""2023-02-02 08:50:00"",""2023-02-02 09:00:00"",""2023-02-02 09:10:00"",""2023-02-02 09:20:00"",""2023-02-02 09:30:00"",""2023-02-02 09:40:00"",""2023-02-02 09:50:00"",""2023-02-02 10:00:00"",""2023-02-02 10:10:00"",""2023-02-02 10:20:00"",""2023-02-02 10:30:00"",""2023-02-02 10:40:00"",""2023-02-02 10:50:00"",""2023-02-02 11:00:00"",""2023-02-02 11:10:00"",""2023-02-02 11:20:00"",""2023-02-02 11:30:00"",""2023-02-02 11:40:00"",""2023-02-02 11:50:00"",""2023-02-02 12:00:00"",""2023-02-02 12:10:00"",""2023-02-02 12:20:00"",""2023-02-02 12:30:00"",""2023-02-02 12:40:00""],""data"":[{""ComponentName"":""QUEUETESTBO001"",""Trend"":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]},{""ComponentName"":""QUEUETESTBO002"",""Trend"":[0,0,0,0,0,1,2,3,4,5,6,7,8,5,5,5,5,5,9,12,16,29,28,27,25,24,23,16,16,16,16,16,16,16,16,16,16,16,16,16,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,10,10,10,10,10,10,10,10,10,10,12,13,14,15,16,17,18,18,6,4,0]},{""ComponentName"":""QUEUETESTBO003"",""Trend"":[1,4,7,10,14,15,16,17,18,19,20,21,20,19,18,17,16,15,14,13,14,13,15,11,14,13,16,13,14,12,13,10,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0,3,3,5,7,9,11,13,15,17,19,21,23,25,27,25,26,27,24,27,26,25,24,23,22,21,20,19,18,17,16]}]}"
	    }
		set ob={}.%FromJSON(json)
		
		Set row = 1
		set length=ob.DateTime.%Size()
		for row=1:1:length
		{
		   Set txt = ob.DateTime.%Get(row-1)
		   Set ..%seriesNames(row) = txt  //横坐标名
		   //Set ..%data(row,"Num") = "QUEUETESTBO001"
		   set data=ob.data
		   set datalength=data.%Size()
		   set j=0
		   for j=1:1:datalength
		   {
			Set ..%data(row,data.%Get(j-1).ComponentName) = data.%Get(j-1).Trend.%Get(row-1)
		    }
		   Set ..%seriesCount = row		
		}
		
		
	
	}
	
	
	Catch e {
	}


	
    Quit $$$OK
}

/// Gets Period based on scale in UTC
ClassMethod GetPeriod(scale As %String = "", Output low As %String, Output high As %String, Output base As %String) [ Internal ]
{
	Set high = $ZTS
	Set time = ($P(high,",",2)\$$$EnsCounterInterval)*$$$EnsCounterInterval
	Set high = $zdt((+high)_","_time,3)
	Set base = $system.SQL.DATEADD("s",-$$$EnsCounterInterval,high)
	If scale="Minute" {
		Set low = $system.SQL.DATEADD("mi",-1,base)
	}
	ElseIf scale="Hour" {
		Set low = $system.SQL.DATEADD("hh",-1,base)
	}
	ElseIf scale="Day" {
		Set low = $system.SQL.DATEADD("d",-1,base)
	}
	ElseIf scale="Week" {
		Set low = $system.SQL.DATEADD("d",-7,base)
	}
	ElseIf scale="Month" {
		Set low = $system.SQL.DATEADD("mm",-1,base)
	}
	ElseIf scale="Year" {
		Set low = $system.SQL.DATEADD("yy",-1,base)
	}
	Else {
		// "All"
		Set low = "2001-01-01 00:00:00"
	}
}

/// This callback is invoked from a dashboard when an action defined by this dashboard is invoked.
ClassMethod %OnDashboardAction(pAction As %String, pContext As %ZEN.proxyObject) As %Status
{
	// pAction is the name of the action (as defined in the XML list).
	// pContext contains information from the client
	// and can be used to return information.
	Quit $$$OK
}

}

