Class Demo.QueueMonitor.Table.HistoryQueues Extends %Persistent
{

/// 时间
Property QueueTime As %String;

Index QueueTimeIdx On QueueTime;

/// 组件名称
Property ComponentName As %String;

Index ComponentNameIdx On ComponentName;

/// 队列数量
Property QueuesNumber As %Integer;

Storage Default
{
<Data name="HistoryQueuesDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>QueueTime</Value>
</Value>
<Value name="3">
<Value>ComponentName</Value>
</Value>
<Value name="4">
<Value>QueuesNumber</Value>
</Value>
</Data>
<DataLocation>^Demo.QueueMoCB76.HistoryQueuesD</DataLocation>
<DefaultData>HistoryQueuesDefaultData</DefaultData>
<ExtentSize>0</ExtentSize>
<IdLocation>^Demo.QueueMoCB76.HistoryQueuesD</IdLocation>
<IndexLocation>^Demo.QueueMoCB76.HistoryQueuesI</IndexLocation>
<StreamLocation>^Demo.QueueMoCB76.HistoryQueuesS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

