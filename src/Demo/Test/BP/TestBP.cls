/// 
Class Demo.Test.BP.TestBP Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.Request' response='Ens.Response' height='2000' width='2000' >
<sequence xend='200' yend='1300' >
<if name='1' condition='request.StringValue&gt;1' xpos='200' ypos='250' xend='200' yend='500' >
<true>
<call name='BO1' target='QueueTestBO001' async='1' xpos='335' ypos='400' >
<request type='Ens.Request' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='Ens.Response' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</true>
</if>
<if name='4' condition='request.StringValue&gt;4' xpos='200' ypos='600' xend='200' yend='850' >
<true>
<call name='BO2' target='QueueTestBO002' async='1' xpos='335' ypos='750' >
<request type='Ens.Request' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='Ens.Response' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</true>
</if>
<if name='7' condition='request.StringValue&gt;7' xpos='200' ypos='950' xend='200' yend='1200' >
<true>
<call name='BO3' target='QueueTestBO003' async='1' xpos='335' ypos='1100' >
<request type='Ens.Request' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='Ens.Response' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</true>
</if>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}

