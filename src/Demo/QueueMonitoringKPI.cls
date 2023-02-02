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
	    set json="{""DateTime"":[""2023-02-02 00:00:00"",""2023-02-02 00:10:00"",""2023-02-02 00:20:00"",""2023-02-02 00:30:00"",""2023-02-02 00:40:00"",""2023-02-02 00:50:00"",""2023-02-02 01:00:00"",""2023-02-02 01:10:00"",""2023-02-02 01:20:00"",""2023-02-02 01:30:00"",""2023-02-02 01:40:00"",""2023-02-02 01:50:00"",""2023-02-02 02:00:00"",""2023-02-02 02:10:00"",""2023-02-02 02:20:00"",""2023-02-02 02:30:00"",""2023-02-02 02:40:00"",""2023-02-02 02:50:00"",""2023-02-02 03:00:00"",""2023-02-02 03:10:00"",""2023-02-02 03:20:00"",""2023-02-02 03:30:00"",""2023-02-02 03:40:00"",""2023-02-02 03:50:00"",""2023-02-02 04:00:00"",""2023-02-02 04:10:00"",""2023-02-02 04:20:00"",""2023-02-02 04:30:00"",""2023-02-02 04:40:00"",""2023-02-02 04:50:00"",""2023-02-02 05:00:00"",""2023-02-02 05:10:00"",""2023-02-02 05:20:00"",""2023-02-02 05:30:00"",""2023-02-02 05:40:00"",""2023-02-02 05:50:00"",""2023-02-02 06:00:00"",""2023-02-02 06:10:00"",""2023-02-02 06:20:00"",""2023-02-02 06:30:00"",""2023-02-02 06:40:00"",""2023-02-02 06:50:00"",""2023-02-02 07:00:00"",""2023-02-02 07:10:00"",""2023-02-02 07:20:00"",""2023-02-02 07:30:00"",""2023-02-02 07:40:00"",""2023-02-02 07:50:00"",""2023-02-02 08:00:00"",""2023-02-02 08:10:00"",""2023-02-02 08:20:00"",""2023-02-02 08:30:00"",""2023-02-02 08:40:00"",""2023-02-02 08:50:00"",""2023-02-02 09:00:00"",""2023-02-02 09:10:00"",""2023-02-02 09:20:00"",""2023-02-02 09:30:00"",""2023-02-02 09:40:00"",""2023-02-02 09:50:00"",""2023-02-02 10:00:00"",""2023-02-02 10:10:00"",""2023-02-02 10:20:00"",""2023-02-02 10:30:00"",""2023-02-02 10:40:00"",""2023-02-02 10:50:00"",""2023-02-02 11:00:00"",""2023-02-02 11:10:00"",""2023-02-02 11:20:00"",""2023-02-02 11:30:00"",""2023-02-02 11:40:00"",""2023-02-02 11:50:00"",""2023-02-02 12:00:00"",""2023-02-02 12:10:00"",""2023-02-02 12:20:00"",""2023-02-02 12:30:00"",""2023-02-02 12:40:00""],""data"":[{""ComponentName"":""QUEUETESTBO001"",""Trend"":[0,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,17,17,17,17,17,17,17,17]},{""ComponentName"":""QUEUETESTBO002"",""Trend"":[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,20,20,21,21,21,21,21,21,21,21,21,21,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,29,29,29,29,29,29,29,29]},{""ComponentName"":""QUEUETESTBO003"",""Trend"":[0,1,1,1,1,4,4,4,4,6,6,6,6,6,6,6,7,7,7,7,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,18,18,18,18,18,18,18,18]}]}"
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

