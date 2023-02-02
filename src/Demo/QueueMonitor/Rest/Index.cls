Class Demo.QueueMonitor.Rest.Index Extends %CSP.REST
{

Parameter HandleCorsRequest = "true";

XData UrlMap [ XMLNamespace = "http://www.queuemonitor.com/urlmap" ]
{
<Routes>
	<!--  放行option请求 -->
	<Route Url="/*" Method="OPTIONS" Call="passOption"/>
	<!--  队列管理 -->
	<Route Url="/QueuesManage/:Method" Method="POST" Call="QueuesManage"/>
</Routes>
}

ClassMethod passOption() As %Status
{
    Quit $$$OK
}

}

