/*
Copyright (c) 2022 by InterSystems Corporation.
Cambridge, Massachusetts, U.S.A.  All rights reserved.
Confidential property of InterSystems Corporation.
*/

/// This object is used to capture information of a shipment from a supplier, typically related
/// to one or multiple purchase orders. This object is used together with SupplyShipmentLine object, 
/// which captures the line details of the shipment.
Class SC.Data.SupplyShipment Extends SC.Core.Data.SupplyShipment
{

Storage Default
{
<Data name="SupplyShipmentDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>recordCreatedTime</Value>
</Value>
<Value name="3">
<Value>committedTimeOfArrival</Value>
</Value>
<Value name="4">
<Value>actualShipDate</Value>
</Value>
<Value name="5">
<Value>estimatedTimeOfArrival</Value>
</Value>
<Value name="6">
<Value>updatedEta</Value>
</Value>
<Value name="7">
<Value>carrierId</Value>
</Value>
<Value name="8">
<Value>actualTimeOfArrival</Value>
</Value>
<Value name="9">
<Value>deliveredDateTime</Value>
</Value>
<Value name="10">
<Value>originLocationId</Value>
</Value>
<Value name="11">
<Value>recipientName</Value>
</Value>
<Value name="12">
<Value>purchaseOrder</Value>
</Value>
<Value name="13">
<Value>destinationLocationId</Value>
</Value>
<Value name="14">
<Value>cancelledDateTime</Value>
</Value>
<Value name="15">
<Value>latestCoordinate</Value>
</Value>
<Value name="16">
<Value>latestCoordinateTime</Value>
</Value>
<Value name="17">
<Value>inTransitLocation</Value>
</Value>
<Value name="18">
<Value>shipperAccountNumber</Value>
</Value>
<Value name="19">
<Value>shipperName</Value>
</Value>
<Value name="20">
<Value>shippingCost</Value>
</Value>
<Value name="21">
<Value>shippingCostCurrency</Value>
</Value>
<Value name="22">
<Value>transportMode</Value>
</Value>
<Value name="23">
<Value>status</Value>
</Value>
<Value name="24">
<Value>substatus</Value>
</Value>
<Value name="25">
<Value>type</Value>
</Value>
<Value name="26">
<Value>weight</Value>
</Value>
<Value name="27">
<Value>weightUom</Value>
</Value>
<Value name="28">
<Value>hoursDelayed</Value>
</Value>
<Value name="29">
<Value>trackStartDateTime</Value>
</Value>
<Value name="30">
<Value>currentStatusCityName</Value>
</Value>
<Value name="31">
<Value>notifyCarrier</Value>
</Value>
<Value name="32">
<Value>freightForwarder</Value>
</Value>
<Value name="33">
<Value>carrierContainer</Value>
</Value>
<Value name="34">
<Value>houseAirwayBill</Value>
</Value>
<Value name="35">
<Value>parcelTrackingNumber</Value>
</Value>
<Value name="36">
<Value>billOfLadingNumber</Value>
</Value>
<Value name="37">
<Value>shipmentCategory</Value>
</Value>
<Value name="38">
<Value>carrierBookingNumber</Value>
</Value>
<Value name="39">
<Value>masterAirWaybillNumber</Value>
</Value>
<Value name="40">
<Value>externalShipmentID</Value>
</Value>
<Value name="41">
<Value>lastUpdatedTime</Value>
</Value>
<Value name="42">
<Value>orderCreatedSource</Value>
</Value>
<Value name="43">
<Value>parentShipmentId</Value>
</Value>
<Value name="44">
<Value>predictedTimeOfArrival</Value>
</Value>
<Value name="45">
<Value>requestedTimeOfArrival</Value>
</Value>
<Value name="46">
<Value>shipmentCreatedDateTime</Value>
</Value>
<Value name="47">
<Value>supplierId</Value>
</Value>
<Value name="48">
<Value>uid</Value>
</Value>
</Data>
<DataLocation>^SC.Data.SupplyShipmentD</DataLocation>
<DefaultData>SupplyShipmentDefaultData</DefaultData>
<ExtentSize>1077</ExtentSize>
<IdLocation>^SC.Data.SupplyShipmentD</IdLocation>
<IndexLocation>^SC.Data.SupplyShipmentI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3.76</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(1,72,144,216,288,360,432,504,576,648,720,792,864,935,1006,1077),$lb(0,0,0,1,0,0,0,1,0,0,1,0,0,0,2),$lb(822083584,822083584,926023680,926023680,825504768,825504768,842085888,825622528,943194112,842545152,859189248,859189248,875770368,875770368,892351488,808714240,926285824,892810752,909391872,909391872,926035968,842006528,959578112,926495232,943076352,943076352,959657216,959657216,825241654,808845312,926351360,825243447))</Histogram>
<Selectivity>1</Selectivity>
</Property>
<Property name="actualShipDate">
<AverageFieldSize>21</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb("2022-10-25 21:49:04","2022-11-08 21:49:04","2022-11-21 21:49:04","2022-12-04 21:49:04","2022-12-16 21:49:04","2022-12-28 21:49:04","2023-01-09 21:49:04","2023-01-23 21:49:04","2023-02-06 21:49:04","2023-02-17 21:49:04","2023-03-01 21:49:04","2023-03-13 21:49:04","2023-03-26 21:49:04","2023-04-09 21:49:04","2023-04-19 21:49:04","2023-05-03 21:49:04"),$lb(6,8,6,8,8,3,8,6,8,6,8,8,6,8,6),$lb(842019378,808268341,825045048,808984626,842080306,825045553,841822260,808722482,825630770,825630770,842539058,841822514,858599473,809050162,842211378,825045555,841822262,808853554,825696306,841822519,858599473,808525874,825434162,825434162,842407986,858599990,875376697,809050162,825827378,875376953,892153907,842019379))</Histogram>
<Selectivity>0.5263%</Selectivity>
</Property>
<Property name="actualTimeOfArrival">
<AverageFieldSize>20.22</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,1,$lb("-10000000000000000000","2022-11-06 21:49:04","2022-11-21 21:49:04","2022-12-02 21:49:04","2022-12-14 21:49:04","2022-12-27 21:49:04","2023-01-09 21:49:04","2023-01-20 21:49:04","2023-02-03 21:49:04","2023-02-16 21:49:04","2023-02-27 21:49:04","2023-03-11 21:49:04","2023-03-24 21:49:04","2023-04-08 21:49:04","2023-04-19 21:49:04","2023-05-03 21:49:04"),$lb(0,8,6,8,8,3,8,6,8,8,6,8,6,8,6),$lb(758198320,758198320,842019378,808853554,842080306,825045553,841822258,808591410,825499698,825499698,842473522,841822514,858599473,809050162,842014770,825045552,841822259,808656946,825630770,825630770,842473522,841822775,858599729,825303090,842276914,858599988,875376696,808984626,825827378,875376953,892153907,842019379))</Histogram>
<OutlierSelectivity>.040854:</OutlierSelectivity>
<Selectivity>0.5241%</Selectivity>
</Property>
<Property name="billOfLadingNumber">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="cancelledDateTime">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="carrierBookingNumber">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="carrierContainer">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="carrierId">
<AverageFieldSize>8</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" CAR001"," CAR001"," CAR001"," CAR001"," CAR001"," CAR002"," CAR002"," CAR002"," CAR002"," CAR002"," CAR003"," CAR003"," CAR003"," CAR003"," CAR003"," CAR003"),$lb(8,8,8,8,6,8,8,8,8,6,8,8,8,8,8),$lb(541278546,0,0,0,0,0,0,0,0,822083584,838860800,0,0,0,0,0,0,0,0,838860800,855638016,0,0,0,0,0,0,0,0,0,0,541278546))</Histogram>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="committedTimeOfArrival">
<AverageFieldSize>21</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb("2022-10-29 21:49:04","2022-11-13 21:49:04","2022-11-27 21:49:04","2022-12-11 21:49:04","2022-12-20 21:49:04","2023-01-03 21:49:04","2023-01-14 21:49:04","2023-01-29 21:49:04","2023-02-11 21:49:04","2023-02-23 21:49:04","2023-03-06 21:49:04","2023-03-19 21:49:04","2023-04-01 21:49:04","2023-04-15 21:49:04","2023-04-25 21:49:04","2023-05-14 21:49:04"),$lb(6,8,6,8,3,8,8,6,8,6,8,6,8,8,6),$lb(842019378,808268345,825045299,825434162,842473522,825045559,841822513,825303090,842014770,841822514,858599473,808656946,825499698,825499698,842604594,825045561,841822513,825303090,842211378,841822771,858599478,808853554,825827378,858599737,875376689,808525874,825565234,825565234,842342450,875377205,892154164,842019379))</Histogram>
<Selectivity>0.5128%</Selectivity>
</Property>
<Property name="currentStatusCityName">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="deliveredDateTime">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="destinationLocationId">
<AverageFieldSize>15</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" LOC-PLANT-001"," LOC-PLANT-001"," LOC-PLANT-001"," LOC-PLANT-001"," LOC-PLANT-001"," LOC-PLANT-001"," LOC-PLANT-001"," LOC-PLANT-001"," LOC-PLANT-002"," LOC-PLANT-002"," LOC-PLANT-002"," LOC-PLANT-002"," LOC-PLANT-002"," LOC-PLANT-002"," LOC-PLANT-002"," LOC-PLANT-002"),$lb(15,15,15,15,15,15,15,13,15,15,15,15,15,15,15),$lb(541871939,0,0,0,0,0,0,0,0,0,0,0,0,0,0,822083584,838860800,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541871939))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="estimatedTimeOfArrival">
<AverageFieldSize>21</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb("2022-10-29 21:49:04","2022-11-12 21:49:04","2022-11-27 21:49:04","2022-12-10 21:49:04","2022-12-21 21:49:04","2023-01-03 21:49:04","2023-01-14 21:49:04","2023-01-29 21:49:04","2023-02-11 21:49:04","2023-02-23 21:49:04","2023-03-06 21:49:04","2023-03-18 21:49:04","2023-04-01 21:49:04","2023-04-14 21:49:04","2023-04-24 21:49:04","2023-05-14 21:49:04"),$lb(6,8,6,8,3,8,8,6,8,6,8,6,8,8,6),$lb(842019378,808268345,825045298,825368626,842473522,825045559,841822512,825237554,842080306,841822514,858599473,808656946,825499698,825499698,842604594,825045561,841822513,825303090,842211378,841822771,858599478,808853554,825761842,858599736,875376689,808525874,825499698,825499698,842276914,875377204,892154164,842019379))</Histogram>
<Selectivity>0.5128%</Selectivity>
</Property>
<Property name="externalShipmentID">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="freightForwarder">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="hoursDelayed">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,16,$lb(-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="houseAirwayBill">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="inTransitLocation">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="lastUpdatedTime">
<AverageFieldSize>25</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb("2023-05-04 14:05:49.674","2023-05-04 14:05:49.680","2023-05-04 14:05:49.686","2023-05-04 14:05:49.692","2023-05-04 14:05:49.698","2023-05-04 14:05:49.704","2023-05-04 14:05:49.710","2023-05-04 14:05:49.716","2023-05-04 14:05:49.722","2023-05-04 14:05:49.729","2023-05-04 14:05:49.735","2023-05-04 14:05:49.741","2023-05-04 14:05:49.747","2023-05-04 14:05:49.753","2023-05-04 14:05:49.760","2023-05-04 14:05:49.766"),$lb(21,22,21,22,20,21,22,21,22,21,21,22,21,21,22),$lb(842019379,926154752,942669824,805306368,905969664,943063040,959578112,838860800,939524096,909719552,925905920,808714240,825229312,805306368,905969664,825622528,842137600,838860800,956301312,842596352,859111424,859111424,875626496,822083584,922746880,876019712,892534784,892534784,909115392,805306368,905969664,842019379))</Histogram>
<Selectivity>1.0753%</Selectivity>
</Property>
<Property name="latestCoordinate">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="latestCoordinateTime">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="masterAirWaybillNumber">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="notifyCarrier">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,16,$lb(-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="orderCreatedSource">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="originLocationId">
<AverageFieldSize>12.09</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" LOC-SUPL-1"," LOC-SUPL-1"," LOC-SUPL-10"," LOC-SUPL-2"," LOC-SUPL-2"," LOC-SUPL-3"," LOC-SUPL-4"," LOC-SUPL-4"," LOC-SUPL-5"," LOC-SUPL-5"," LOC-SUPL-6"," LOC-SUPL-7"," LOC-SUPL-8"," LOC-SUPL-8"," LOC-SUPL-9"," LOC-SUPL-9"),$lb(12,11,10,12,10,10,12,10,12,10,10,10,12,10,12),$lb(541871939,0,0,0,805306368,825229312,838860800,0,0,838860800,855638016,855638016,872415232,0,0,872415232,889192448,0,0,889192448,905969664,905969664,922746880,922746880,939524096,0,0,939524096,956301312,0,0,541871939))</Histogram>
<Selectivity>10.0000%</Selectivity>
</Property>
<Property name="parcelTrackingNumber">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="parentShipmentId">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="predictedTimeOfArrival">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="purchaseOrder">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="recipientName">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="recordCreatedTime">
<AverageFieldSize>25</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb("2023-05-04 14:05:49.674","2023-05-04 14:05:49.680","2023-05-04 14:05:49.686","2023-05-04 14:05:49.692","2023-05-04 14:05:49.698","2023-05-04 14:05:49.704","2023-05-04 14:05:49.710","2023-05-04 14:05:49.716","2023-05-04 14:05:49.722","2023-05-04 14:05:49.729","2023-05-04 14:05:49.735","2023-05-04 14:05:49.741","2023-05-04 14:05:49.747","2023-05-04 14:05:49.753","2023-05-04 14:05:49.760","2023-05-04 14:05:49.766"),$lb(21,22,21,22,20,21,22,21,22,21,21,22,21,21,22),$lb(842019379,926154752,942669824,805306368,905969664,943063040,959578112,838860800,939524096,909719552,925905920,808714240,825229312,805306368,905969664,825622528,842137600,838860800,956301312,842596352,859111424,859111424,875626496,822083584,922746880,876019712,892534784,892534784,909115392,805306368,905969664,842019379))</Histogram>
<Selectivity>1.0753%</Selectivity>
</Property>
<Property name="requestedTimeOfArrival">
<AverageFieldSize>21</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb("2022-10-31 21:49:04","2022-11-14 21:49:04","2022-11-27 21:49:04","2022-12-10 21:49:04","2022-12-22 21:49:04","2023-01-05 21:49:04","2023-01-16 21:49:04","2023-01-30 21:49:04","2023-02-13 21:49:04","2023-02-24 21:49:04","2023-03-07 21:49:04","2023-03-20 21:49:04","2023-04-03 21:49:04","2023-04-16 21:49:04","2023-04-25 21:49:04","2023-05-11 21:49:04"),$lb(6,8,6,8,3,8,8,6,8,6,8,6,8,8,6),$lb(842019378,808268593,825045300,825499698,842473522,825045559,841822512,825237554,842145842,841822514,858599473,808788018,825630770,825630770,858791986,825045808,841822515,825434162,842276914,841822772,858599479,808919090,842014770,858599984,875376691,808656946,825630770,825630770,842342450,875377205,892154161,842019379))</Histogram>
<Selectivity>0.5319%</Selectivity>
</Property>
<Property name="shipmentCategory">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="shipmentCreatedDateTime">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="shipperAccountNumber">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="shipperName">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="shippingCost">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,16,$lb(-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="shippingCostCurrency">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="status">
<AverageFieldSize>10.92</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" DELIVERED"," DELIVERED"," DELIVERED"," DELIVERED"," DELIVERED"," DELIVERED"," DELIVERED"," DELIVERED"," DELIVERED"," DELIVERED"," DELIVERED"," DELIVERED"," DELIVERED"," DELIVERED"," DELIVERED"," SHIPPED"),$lb(11,11,11,11,11,11,11,11,11,11,11,11,11,11,1),$lb(541345100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1145392201,1397246288,542328905))</Histogram>
<OutlierSelectivity>.959146:"Delivered"</OutlierSelectivity>
<Selectivity>4.0854%</Selectivity>
</Property>
<Property name="substatus">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="supplierId">
<AverageFieldSize>10</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" SUP-0001"," SUP-0001"," SUP-0002"," SUP-0003"," SUP-0003"," SUP-0004"," SUP-0004"," SUP-0005"," SUP-0006"," SUP-0007"," SUP-0007"," SUP-0008"," SUP-0009"," SUP-0009"," SUP-0010"," SUP-0010"),$lb(10,8,8,10,8,10,8,8,8,10,8,8,10,7,10),$lb(542332240,0,0,822083584,838860800,838860800,855638016,0,0,855638016,872415232,0,0,872415232,889192448,889192448,905969664,905969664,922746880,0,0,922746880,939524096,939524096,956301312,0,0,809041920,825229312,0,0,542332240))</Histogram>
<Selectivity>10.0000%</Selectivity>
</Property>
<Property name="trackStartDateTime">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="transportMode">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="type">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="uid">
<AverageFieldSize>38</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="updatedEta">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="weight">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,16,$lb(-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="weightUom">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-172</BlockCount>
</SQLMap>
<SQLMap name="carrierIdIndex">
<BlockCount>-8</BlockCount>
</SQLMap>
<SQLMap name="destinationLocationIdIndex">
<BlockCount>-8</BlockCount>
</SQLMap>
<SQLMap name="originLocationIdIndex">
<BlockCount>-8</BlockCount>
</SQLMap>
<SQLMap name="parentShipmentIdIndex">
<BlockCount>-12</BlockCount>
</SQLMap>
<SQLMap name="supplierIdIndex">
<BlockCount>-8</BlockCount>
</SQLMap>
<SQLMap name="uidIndex">
<BlockCount>-40</BlockCount>
</SQLMap>
<StreamLocation>^SC.Data.SupplyShipmentS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
