/*
Copyright (c) 2022 by InterSystems Corporation.
Cambridge, Massachusetts, U.S.A.  All rights reserved.
Confidential property of InterSystems Corporation.
*/

/// This object is used to capture information of a shipment to a customer, typically related
/// to one or multiple sales orders. This object is used together with SalesShipmentLine object, 
/// which captures the line details of the shipment.
Class SC.Data.SalesShipment Extends SC.Core.Data.SalesShipment
{

Storage Default
{
<Data name="SalesShipmentDefaultData">
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
<Value>customerId</Value>
</Value>
<Value name="42">
<Value>lastUpdatedTime</Value>
</Value>
<Value name="43">
<Value>orderCreatedSource</Value>
</Value>
<Value name="44">
<Value>parentShipmentId</Value>
</Value>
<Value name="45">
<Value>predictedTimeOfArrival</Value>
</Value>
<Value name="46">
<Value>requestedTimeOfArrival</Value>
</Value>
<Value name="47">
<Value>shipmentCreatedDateTime</Value>
</Value>
<Value name="48">
<Value>uid</Value>
</Value>
</Data>
<DataLocation>^SC.Data.SalesShipmentD</DataLocation>
<DefaultData>SalesShipmentDefaultData</DefaultData>
<ExtentSize>1875</ExtentSize>
<IdLocation>^SC.Data.SalesShipmentD</IdLocation>
<IndexLocation>^SC.Data.SalesShipmentI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3.86</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(1,125,250,375,500,625,750,875,1000,1125,1250,1375,1500,1625,1750,1875),$lb(1,0,0,0,0,0,0,0,1,1,1,1,1,1,1),$lb(822083584,0,842334208,825373952,842346496,842346496,859256064,859256064,892350464,892350464,909260032,909260032,926232576,926232576,943142144,943142144,825241648,808464384,825373952,825373952,842346496,842346496,859256064,859256064,892350464,892350464,909260032,909260032,926232576,926232576,943142144,825767733))</Histogram>
<Selectivity>1</Selectivity>
</Property>
<Property name="actualShipDate">
<AverageFieldSize>21</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb("2022-10-25 21:49:04","2022-11-06 21:49:04","2022-11-20 21:49:04","2022-12-01 21:49:04","2022-12-13 21:49:04","2022-12-25 21:49:04","2023-01-05 21:49:04","2023-01-19 21:49:04","2023-02-01 21:49:04","2023-02-15 21:49:04","2023-02-28 21:49:04","2023-03-14 21:49:04","2023-03-27 21:49:04","2023-04-08 21:49:04","2023-04-20 21:49:04","2023-05-03 21:49:04"),$lb(6,8,6,8,8,3,8,6,8,8,6,8,6,8,6),$lb(842019378,808268341,825045046,808853554,842014770,825045552,841822257,808525874,825434162,825434162,842342450,841822514,858599473,808788018,825827378,825045305,841822257,808525874,825565234,825565234,842539058,841822776,858599732,825499698,842473522,858599991,875376696,808984626,842014770,875377200,892153907,842019379))</Histogram>
<Selectivity>0.5236%</Selectivity>
</Property>
<Property name="actualTimeOfArrival">
<AverageFieldSize>20.24</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,1,$lb("-10000000000000000000","2022-11-07 21:49:04","2022-11-18 21:49:04","2022-12-01 21:49:04","2022-12-14 21:49:04","2022-12-24 21:49:04","2023-01-06 21:49:04","2023-01-18 21:49:04","2023-01-31 21:49:04","2023-02-13 21:49:04","2023-02-27 21:49:04","2023-03-12 21:49:04","2023-03-26 21:49:04","2023-04-08 21:49:04","2023-04-20 21:49:04","2023-05-03 21:49:04"),$lb(0,8,6,8,8,3,8,8,6,8,6,8,6,8,6),$lb(758198320,758198320,842019378,808919090,825761842,825045304,841822257,808525874,825499698,825499698,842276914,841822514,858599473,808853554,825761842,825761842,858857522,825045809,841822515,825434162,842473522,841822775,858599730,825368626,842407986,858599990,875376696,808984626,842014770,875377200,892153907,842019379))</Histogram>
<OutlierSelectivity>.04:</OutlierSelectivity>
<Selectivity>0.5161%</Selectivity>
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
<Histogram>$lb(.06666666666666666667,0,0,$lb(" CAR001"," CAR001"," CAR001"," CAR001"," CAR001"," CAR001"," CAR002"," CAR002"," CAR002"," CAR002"," CAR002"," CAR003"," CAR003"," CAR003"," CAR003"," CAR003"),$lb(8,8,8,8,8,6,8,8,8,8,6,8,8,8,8),$lb(541278546,0,0,0,0,0,0,0,0,0,0,822083584,838860800,0,0,0,0,0,0,0,0,838860800,855638016,0,0,0,0,0,0,0,0,541278546))</Histogram>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="committedTimeOfArrival">
<AverageFieldSize>21</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb("2022-10-31 21:49:04","2022-11-12 21:49:04","2022-11-26 21:49:04","2022-12-07 21:49:04","2022-12-19 21:49:04","2022-12-31 21:49:04","2023-01-11 21:49:04","2023-01-25 21:49:04","2023-02-08 21:49:04","2023-02-21 21:49:04","2023-03-06 21:49:04","2023-03-19 21:49:04","2023-04-02 21:49:04","2023-04-13 21:49:04","2023-04-26 21:49:04","2023-05-13 21:49:04"),$lb(6,8,6,8,8,3,8,6,8,6,8,6,8,8,6),$lb(842019378,808268593,825045298,825368626,842407986,825045558,841822263,808919090,825827378,825827378,858857522,841822514,858599473,825303090,842342450,825045557,841822264,808984626,842080306,841822769,858599478,808853554,825827378,858599737,875376690,808591410,825434162,825434162,842407986,875377206,892154163,842019379))</Histogram>
<Selectivity>0.5181%</Selectivity>
</Property>
<Property name="currentStatusCityName">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="customerId">
<AverageFieldSize>9</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" CUST002"," CUST004"," CUST004"," CUST005"," CUST006"," CUST007"," CUST008"," CUST008"," CUST009"," CUST010"," CUST011"," CUST012"," CUST013"," CUST014"," CUST015"," CUST015"),$lb(7,9,7,7,7,7,9,7,6,7,7,7,7,7,9),$lb(541283667,838860800,872415232,0,0,872415232,889192448,889192448,905969664,905969664,922746880,922746880,939524096,0,0,939524096,956301312,809041920,825229312,805306368,822083584,822083584,838860800,838860800,855638016,855638016,872415232,872415232,889192448,0,0,541283667))</Histogram>
<Selectivity>7.6923%</Selectivity>
</Property>
<Property name="deliveredDateTime">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="destinationLocationId">
<AverageFieldSize>12.31</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" LOC-CUST-1"," LOC-CUST-10"," LOC-CUST-10"," LOC-CUST-11"," LOC-CUST-12"," LOC-CUST-13"," LOC-CUST-2"," LOC-CUST-3"," LOC-CUST-4"," LOC-CUST-4"," LOC-CUST-5"," LOC-CUST-6"," LOC-CUST-7"," LOC-CUST-8"," LOC-CUST-9"," LOC-CUST-9"),$lb(11,13,11,11,11,10,10,10,12,10,10,10,10,10,12),$lb(541871939,0,805306368,0,0,805306368,822083584,822083584,838860800,838860800,855638016,825425920,838860800,838860800,855638016,855638016,872415232,0,0,872415232,889192448,889192448,905969664,905969664,922746880,922746880,939524096,939524096,956301312,0,0,541871939))</Histogram>
<Selectivity>7.6923%</Selectivity>
</Property>
<Property name="estimatedTimeOfArrival">
<AverageFieldSize>21</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb("2022-10-30 21:49:04","2022-11-12 21:49:04","2022-11-25 21:49:04","2022-12-08 21:49:04","2022-12-19 21:49:04","2022-12-31 21:49:04","2023-01-11 21:49:04","2023-01-25 21:49:04","2023-02-08 21:49:04","2023-02-21 21:49:04","2023-03-06 21:49:04","2023-03-19 21:49:04","2023-04-02 21:49:04","2023-04-14 21:49:04","2023-04-26 21:49:04","2023-05-13 21:49:04"),$lb(6,8,6,8,8,3,8,6,8,6,8,6,8,8,6),$lb(842019378,808268592,825045298,825368626,842342450,825045557,841822264,808984626,825827378,825827378,858857522,841822514,858599473,825303090,842342450,825045557,841822264,808984626,842080306,841822769,858599478,808853554,825827378,858599737,875376690,808591410,825499698,825499698,842407986,875377206,892154163,842019379))</Histogram>
<Selectivity>0.5102%</Selectivity>
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
<Histogram>$lb(.06666666666666666667,0,0,$lb("2023-05-04 13:57:23.546","2023-05-04 13:57:23.556","2023-05-04 13:57:23.567","2023-05-04 13:57:23.577","2023-05-04 13:57:23.588","2023-05-04 13:57:23.599","2023-05-04 13:57:23.610","2023-05-04 13:57:23.621","2023-05-04 13:57:23.631","2023-05-04 13:57:23.642","2023-05-04 13:57:23.653","2023-05-04 13:57:23.664","2023-05-04 13:57:23.674","2023-05-04 13:57:23.685","2023-05-04 13:57:23.696","2023-05-04 13:57:23.707"),$lb(21,21,21,21,21,20,21,21,21,21,21,21,21,21,20),$lb(842019379,875954176,892731392,892731392,909574144,909574144,926351360,926351360,943194112,943194112,960036864,892942592,909193216,825229312,842072064,842072064,858849280,858849280,875692032,875692032,892534784,892534784,909377536,909377536,926154752,926154752,942997504,942997504,959840256,909719040,925906688,842019379))</Histogram>
<Selectivity>0.6173%</Selectivity>
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
<AverageFieldSize>14</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" LOC-WARE-003"," LOC-WARE-003"," LOC-WARE-003"," LOC-WARE-003"," LOC-WARE-003"," LOC-WARE-003"," LOC-WARE-003"," LOC-WARE-003"," LOC-WARE-004"," LOC-WARE-004"," LOC-WARE-004"," LOC-WARE-004"," LOC-WARE-004"," LOC-WARE-004"," LOC-WARE-004"," LOC-WARE-004"),$lb(14,14,14,14,14,14,14,12,14,14,14,14,14,14,14),$lb(541871939,0,0,0,0,0,0,0,0,0,0,0,0,0,0,855638016,872415232,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541871939))</Histogram>
<Selectivity>50.0000%</Selectivity>
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
<Histogram>$lb(.06666666666666666667,0,0,$lb("2023-05-04 13:57:23.546","2023-05-04 13:57:23.556","2023-05-04 13:57:23.567","2023-05-04 13:57:23.577","2023-05-04 13:57:23.588","2023-05-04 13:57:23.599","2023-05-04 13:57:23.610","2023-05-04 13:57:23.621","2023-05-04 13:57:23.631","2023-05-04 13:57:23.642","2023-05-04 13:57:23.653","2023-05-04 13:57:23.664","2023-05-04 13:57:23.674","2023-05-04 13:57:23.685","2023-05-04 13:57:23.696","2023-05-04 13:57:23.707"),$lb(21,21,21,21,21,20,21,21,21,21,21,21,21,21,20),$lb(842019379,875954176,892731392,892731392,909574144,909574144,926351360,926351360,943194112,943194112,960036864,892942592,909193216,825229312,842072064,842072064,858849280,858849280,875692032,875692032,892534784,892534784,909377536,909377536,926154752,926154752,942997504,942997504,959840256,909719040,925906688,842019379))</Histogram>
<Selectivity>0.6173%</Selectivity>
</Property>
<Property name="requestedTimeOfArrival">
<AverageFieldSize>21</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb("2022-11-01 21:49:04","2022-11-14 21:49:04","2022-11-26 21:49:04","2022-12-09 21:49:04","2022-12-21 21:49:04","2023-01-01 21:49:04","2023-01-13 21:49:04","2023-01-27 21:49:04","2023-02-09 21:49:04","2023-02-23 21:49:04","2023-03-08 21:49:04","2023-03-22 21:49:04","2023-04-03 21:49:04","2023-04-15 21:49:04","2023-04-27 21:49:04","2023-05-12 21:49:04"),$lb(8,8,6,8,3,8,8,6,8,6,8,6,8,8,6),$lb(842019378,808525874,825499698,825499698,842407986,825045558,841822265,809050162,842080306,841822514,858599473,808525874,825434162,825434162,842473522,825045559,841822265,809050162,842211378,841822771,858599480,808984626,842145842,858599986,875376691,808656946,825565234,825565234,842473522,875377207,892154162,842019379))</Histogram>
<Selectivity>0.5236%</Selectivity>
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
<OutlierSelectivity>.96:"Delivered"</OutlierSelectivity>
<Selectivity>4.0000%</Selectivity>
</Property>
<Property name="substatus">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
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
<BlockCount>-300</BlockCount>
</SQLMap>
<SQLMap name="carrierIdIndex">
<BlockCount>-12</BlockCount>
</SQLMap>
<SQLMap name="customerIdIndex">
<BlockCount>-12</BlockCount>
</SQLMap>
<SQLMap name="destinationLocationIdIndex">
<BlockCount>-16</BlockCount>
</SQLMap>
<SQLMap name="originLocationIdIndex">
<BlockCount>-16</BlockCount>
</SQLMap>
<SQLMap name="parentShipmentIdIndex">
<BlockCount>-12</BlockCount>
</SQLMap>
<SQLMap name="uidIndex">
<BlockCount>-68</BlockCount>
</SQLMap>
<StreamLocation>^SC.Data.SalesShipmentS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
