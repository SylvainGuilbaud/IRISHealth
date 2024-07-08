/*
Copyright (c) 2022 by InterSystems Corporation.
Cambridge, Massachusetts, U.S.A.  All rights reserved.
Confidential property of InterSystems Corporation.
*/

/// This object is used to capture shipment carrier information. 
Class SC.Data.Carrier Extends SC.Core.Data.Carrier
{

Storage Default
{
<Data name="CarrierDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>recordCreatedTime</Value>
</Value>
<Value name="3">
<Value>lastUpdatedTime</Value>
</Value>
<Value name="4">
<Value>name</Value>
</Value>
<Value name="5">
<Value>type</Value>
</Value>
<Value name="6">
<Value>trackingUrl</Value>
</Value>
<Value name="7">
<Value>status</Value>
</Value>
<Value name="8">
<Value>primaryContact</Value>
</Value>
<Value name="9">
<Value>primaryPhone</Value>
</Value>
<Value name="10">
<Value>url</Value>
</Value>
<Value name="11">
<Value>scac</Value>
</Value>
<Value name="12">
<Value>uid</Value>
</Value>
</Data>
<DataLocation>^SC.Data.CarrierD</DataLocation>
<DefaultData>CarrierDefaultData</DefaultData>
<ExtentSize>3</ExtentSize>
<IdLocation>^SC.Data.CarrierD</IdLocation>
<IndexLocation>^SC.Data.CarrierI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="lastUpdatedTime">
<AverageFieldSize>25</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="name">
<AverageFieldSize>5.67</AverageFieldSize>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="primaryContact">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="primaryPhone">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="recordCreatedTime">
<AverageFieldSize>25</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="scac">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="status">
<AverageFieldSize>8</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="trackingUrl">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="type">
<AverageFieldSize>8</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="uid">
<AverageFieldSize>8</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="url">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="uidIndex">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^SC.Data.CarrierS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
