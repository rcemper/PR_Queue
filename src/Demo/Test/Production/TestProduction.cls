Class Demo.Test.Production.TestProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Demo.Test.Production.TestProduction" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>20</ActorPoolSize>
  <Item Name="QueueTestBS001" Category="" ClassName="Demo.Test.BS.TestBS" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="QueueTestBO001" Category="" ClassName="Demo.Test.BO.QueueTestBO" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="QueueTestBO002" Category="" ClassName="Demo.Test.BO.QueueTestBO" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="QueueTestBO003" Category="" ClassName="Demo.Test.BO.QueueTestBO" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="QueueTestBP" Category="" ClassName="Demo.Test.BP.TestBP" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}

