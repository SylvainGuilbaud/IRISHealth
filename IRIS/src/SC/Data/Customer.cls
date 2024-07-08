/*
Copyright (c) 2022 by InterSystems Corporation.
Cambridge, Massachusetts, U.S.A.  All rights reserved.
Confidential property of InterSystems Corporation.
*/

/// This object is used to capture master data of a customer. 
Class SC.Data.Customer Extends SC.Core.Data.Customer
{

Storage Default
{
<Data name="CustomerDefaultData">
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
<Value>dataSource</Value>
</Value>
<Value name="6">
<Value>sourceId</Value>
</Value>
<Value name="7">
<Value>primaryLocationId</Value>
</Value>
<Value name="8">
<Value>shipToLocationId</Value>
</Value>
<Value name="9">
<Value>type</Value>
</Value>
<Value name="10">
<Value>status</Value>
</Value>
<Value name="11">
<Value>primaryPhone</Value>
</Value>
<Value name="12">
<Value>primaryContact</Value>
</Value>
<Value name="13">
<Value>url</Value>
</Value>
<Value name="14">
<Value>uid</Value>
</Value>
</Data>
<DataLocation>^SC.Data.CustomerD</DataLocation>
<DefaultData>CustomerDefaultData</DefaultData>
<ExtentSize>13</ExtentSize>
<IdLocation>^SC.Data.CustomerD</IdLocation>
<IndexLocation>^SC.Data.CustomerI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="dataSource">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="lastUpdatedTime">
<AverageFieldSize>25</AverageFieldSize>
<OutlierSelectivity>.846154:"2023-05-04 13:36:08.046"</OutlierSelectivity>
<Selectivity>15.3846%</Selectivity>
</Property>
<Property name="name">
<AverageFieldSize>14.15</AverageFieldSize>
<Selectivity>7.6923%</Selectivity>
</Property>
<Property name="primaryContact">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="primaryLocationId">
<AverageFieldSize>12.31</AverageFieldSize>
<Selectivity>7.6923%</Selectivity>
</Property>
<Property name="primaryPhone">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="recordCreatedTime">
<AverageFieldSize>25</AverageFieldSize>
<OutlierSelectivity>.846154:"2023-05-04 13:36:08.046"</OutlierSelectivity>
<Selectivity>15.3846%</Selectivity>
</Property>
<Property name="shipToLocationId">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="sourceId">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="status">
<AverageFieldSize>8</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="type">
<AverageFieldSize>9.31</AverageFieldSize>
<OutlierSelectivity>.769231:"telecom"</OutlierSelectivity>
<Selectivity>11.5385%</Selectivity>
</Property>
<Property name="uid">
<AverageFieldSize>9</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="url">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="primaryLocationIdIndex">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="shipToLocationIdIndex">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="uidIndex">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^SC.Data.CustomerS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
