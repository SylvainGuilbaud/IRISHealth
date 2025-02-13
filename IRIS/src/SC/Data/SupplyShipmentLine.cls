/*
Copyright (c) 2022 by InterSystems Corporation.
Cambridge, Massachusetts, U.S.A.  All rights reserved.
Confidential property of InterSystems Corporation.
*/

/// This object is used to capture line details of a supply shipment. It also provide the 
/// link to the corresponding purchase order line if order information is available. Although 
/// product info can be specified directly in this object (which is important when order
/// information is not available), it is preferred to get product info from the corresponding
/// purchase order lines.
Class SC.Data.SupplyShipmentLine Extends SC.Core.Data.SupplyShipmentLine
{

Storage Default
{
<Data name="SupplyShipmentLineDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>lineNumber</Value>
</Value>
<Value name="3">
<Value>lastUpdatedTime</Value>
</Value>
<Value name="4">
<Value>purchaseOrderId</Value>
</Value>
<Value name="5">
<Value>purchaseOrderLineNumber</Value>
</Value>
<Value name="6">
<Value>purchaseOrderLineId</Value>
</Value>
<Value name="7">
<Value>productId</Value>
</Value>
<Value name="8">
<Value>supplyShipmentId</Value>
</Value>
<Value name="9">
<Value>quantityShipped</Value>
</Value>
<Value name="10">
<Value>recordCreatedTime</Value>
</Value>
<Value name="11">
<Value>uid</Value>
</Value>
<Value name="12">
<Value>unitOfMeasure</Value>
</Value>
<Value name="13">
<Value>value</Value>
</Value>
<Value name="14">
<Value>valueCurrency</Value>
</Value>
</Data>
<DataLocation>^SC.Data.SupplyShipmentLineD</DataLocation>
<DefaultData>SupplyShipmentLineDefaultData</DefaultData>
<ExtentSize>1733</ExtentSize>
<IdLocation>^SC.Data.SupplyShipmentLineD</IdLocation>
<IndexLocation>^SC.Data.SupplyShipmentLineI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3.85</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(1,116,232,348,464,580,696,812,928,1043,1158,1273,1388,1503,1618,1733),$lb(1,0,0,0,0,0,0,0,0,1,1,1,1,1,1),$lb(822083584,0,825622528,825308672,842215936,842215936,859060224,859060224,875967488,875967488,892874752,892874752,909719040,909719040,942748160,942748160,959592448,959592448,825242675,808727296,825571328,825571328,842478336,842478336,859322368,859322368,892351232,892351232,909195264,909195264,926102272,825701171))</Histogram>
<Selectivity>1</Selectivity>
</Property>
<Property name="lastUpdatedTime">
<AverageFieldSize>25</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb("2023-05-04 14:06:45.181","2023-05-04 14:06:45.201","2023-05-04 14:06:45.207","2023-05-04 14:06:45.213","2023-05-04 14:06:45.220","2023-05-04 14:06:45.226","2023-05-04 14:06:45.233","2023-05-04 14:06:45.239","2023-05-04 14:06:45.245","2023-05-04 14:06:45.252","2023-05-04 14:06:45.258","2023-05-04 14:06:45.265","2023-05-04 14:06:45.271","2023-05-04 14:06:45.278","2023-05-04 14:06:45.284","2023-05-04 14:06:45.291"),$lb(20,22,21,21,22,21,22,21,21,22,21,21,22,21,21),$lb(842019379,825766144,842019072,822083584,922746880,808910848,825425920,825425920,842006528,805306368,905969664,842399744,858980352,855638016,956301312,859373568,875888640,875888640,892469248,838860800,939524096,892862464,909443072,909443072,925958144,822083584,939524096,926416896,942931968,942931968,959512576,842019379))</Histogram>
<Selectivity>1.0101%</Selectivity>
</Property>
<Property name="lineNumber">
<AverageFieldSize>4</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 10"," 10"," 10"," 10"," 10"," 10"," 10"," 10"," 10"," 10"," 20"," 20"," 20"," 20"," 30"," 30"),$lb(4,4,4,4,4,4,4,4,4,1,4,4,4,1,4),$lb(540094464,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,825229312,842006528,0,0,0,0,0,0,842006528,858783744,0,0,540225536))</Histogram>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="productId">
<AverageFieldSize>9.68</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" PART001"," PART001"," PART002"," PART002"," PART003"," PART003"," PART003-1"," PART003-2"," PART003-2"," PART003-3"," PART003-3"," PART004"," PART005"," PART005"," PART006"," PART006"),$lb(9,7,9,7,9,8,9,11,9,11,7,7,9,7,9),$lb(542130514,0,0,822083584,838860800,0,0,838860800,855638016,0,0,0,758185984,822083584,838860800,0,0,838860800,855638016,0,0,858600192,872415232,872415232,889192448,0,0,889192448,905969664,0,0,542130514))</Histogram>
<Selectivity>11.1111%</Selectivity>
</Property>
<Property name="purchaseOrderId">
<AverageFieldSize>38</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 00CDF4AF-AC5A-43CC-A595-8CDA356DF3DC"," 12B0EF99-84BD-4E48-A573-EA62DEA0BF7A"," 2727E9C9-F746-490E-89E3-61C391FE4634"," 394B0F29-487F-4568-B6E2-0211D5D8BF52"," 48E4B47F-375F-452C-B22E-0525BB80020D"," 585A2F91-A2AB-40F1-B602-F151485F5574"," 6C91C712-C9C8-41C8-BAB0-2F37160A0F90"," 7F1C6C90-AFF2-4303-BC67-C4CBB99D00B9"," 9164121B-8BD4-4071-9688-D3DA5746217A"," A2BFDBEF-B34A-41F2-AADF-DF74E5FA8F9C"," B6937E97-F773-4F6F-B4DF-C04CAF40253B"," C6EA2FDC-E3B6-4E21-8D01-1EC05DFBA166"," D4013CD6-ACB1-406F-B1B8-CA89B3303147"," E31EE8D2-2A2D-453A-80A2-5B11FB251620"," F237159E-D649-40F8-A24B-CBC5BDD214E4"," FFC8FF56-B0AF-4A9C-A5F3-46EFFA1BEAF2"),$lb(1,1,1,1,1,1,1,1,1,1,1,1,1,1,2),$lb(540028995,808469316,825377328,825377328,842478135,842478135,859386946,859386946,876102964,876102964,892876097,892876097,910375217,910375217,927347011,927347011,959526452,959526452,1093812806,1093812806,1110849843,1110849843,1127630145,1127630145,1144270897,1144270897,1160982853,1160982853,1177695031,842217265,1178810438,541476419))</Histogram>
<Selectivity>0.1221%</Selectivity>
</Property>
<Property name="purchaseOrderLineId">
<AverageFieldSize>41</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 00CDF4AF-AC5A-43CC-A595-8CDA356DF3DC-10"," 12B0EF99-84BD-4E48-A573-EA62DEA0BF7A-20"," 2727E9C9-F746-490E-89E3-61C391FE4634-20"," 394B0F29-487F-4568-B6E2-0211D5D8BF52-10"," 48E4B47F-375F-452C-B22E-0525BB80020D-30"," 585A2F91-A2AB-40F1-B602-F151485F5574-30"," 6C91C712-C9C8-41C8-BAB0-2F37160A0F90-20"," 7F1C6C90-AFF2-4303-BC67-C4CBB99D00B9-20"," 9164121B-8BD4-4071-9688-D3DA5746217A-10"," A2BFDBEF-B34A-41F2-AADF-DF74E5FA8F9C-30"," B6937E97-F773-4F6F-B4DF-C04CAF40253B-10"," C6EA2FDC-E3B6-4E21-8D01-1EC05DFBA166-10"," D4013CD6-ACB1-406F-B1B8-CA89B3303147-10"," E31EE8D2-2A2D-453A-80A2-5B11FB251620-10"," F237159E-D649-40F8-A24B-CBC5BDD214E4-30"," FFC8FF56-B0AF-4A9C-A5F3-46EFFA1BEAF2-20"),$lb(1,1,1,1,1,1,1,1,1,1,1,1,1,1,2),$lb(540028995,808469316,825377328,825377328,842478135,842478135,859386946,859386946,876102964,876102964,892876097,892876097,910375217,910375217,927347011,927347011,959526452,959526452,1093812806,1093812806,1110849843,1110849843,1127630145,1127630145,1144270897,1144270897,1160982853,1160982853,1177695031,842217265,1178810438,541476419))</Histogram>
<Selectivity>0.0602%</Selectivity>
</Property>
<Property name="purchaseOrderLineNumber">
<AverageFieldSize>4</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 10"," 10"," 10"," 10"," 10"," 10"," 10"," 10"," 20"," 20"," 20"," 20"," 20"," 30"," 30"," 30"),$lb(4,4,4,4,4,4,4,1,4,4,4,4,1,4,4),$lb(540094464,0,0,0,0,0,0,0,0,0,0,0,0,0,0,825229312,842006528,0,0,0,0,0,0,0,0,842006528,858783744,0,0,0,0,540225536))</Histogram>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="quantityShipped">
<AverageFieldSize>3.5</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(12,70,90,120,150,180,210,240,270,300,340,370,410,440,470,500),$lb(0,0,0,1,1,0,1,1,0,1,1,0,1,1,0),$lb(825360384,825360384,925892608,925892608,959447040,959447040,825372672,842006528,892338176,892338176,942669824,825765888,842084352,825229312,875560960,875560960,925892608,842477568,858796032,808452096,875560960,875560960,925892608,859254784,875638784,825229312,875560960,875560960,925892608,876032000,892350464,892350464))</Histogram>
<Selectivity>0.6757%</Selectivity>
</Property>
<Property name="recordCreatedTime">
<AverageFieldSize>25</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb("2023-05-04 14:06:45.181","2023-05-04 14:06:45.201","2023-05-04 14:06:45.207","2023-05-04 14:06:45.213","2023-05-04 14:06:45.220","2023-05-04 14:06:45.226","2023-05-04 14:06:45.233","2023-05-04 14:06:45.239","2023-05-04 14:06:45.245","2023-05-04 14:06:45.252","2023-05-04 14:06:45.258","2023-05-04 14:06:45.265","2023-05-04 14:06:45.271","2023-05-04 14:06:45.278","2023-05-04 14:06:45.284","2023-05-04 14:06:45.291"),$lb(20,22,21,21,22,21,22,21,21,22,21,21,22,21,21),$lb(842019379,825766144,842019072,822083584,922746880,808910848,825425920,825425920,842006528,805306368,905969664,842399744,858980352,855638016,956301312,859373568,875888640,875888640,892469248,838860800,939524096,892862464,909443072,909443072,925958144,822083584,939524096,926416896,942931968,942931968,959512576,842019379))</Histogram>
<Selectivity>1.0101%</Selectivity>
</Property>
<Property name="supplyShipmentId">
<AverageFieldSize>38</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 006C5817-7F71-4F69-B4AF-15CCBCA53D37"," 1063E445-1B88-4B4D-AC3D-48040DCAE1B9"," 21D44901-B174-4B60-8FAB-3FC06EE37CF9"," 3933764B-8265-46F0-B145-5359C080B131"," 4BD2CCE2-43E4-457A-AF5D-1673D662A3B6"," 5ABE2040-E5E0-4A90-8FDF-3D3F73E7B568"," 6D5052D5-CACF-4FB5-BC80-1BE6307B11AD"," 80AF8F10-C3BE-4E43-BA8F-9F69AF1C41E9"," 924B9909-2B68-4B1A-83F1-F84D710EDBD3"," A4A28042-09FC-4535-A1D3-7AE1EFE68171"," B1172FD5-B0D4-4C77-9D9F-3A37EC1FA71F"," C37CC7E6-6D7F-4C11-BC18-413DEDFFC0B4"," D41AFC08-884A-42CE-BB0E-C2B59C62671D"," DF66466C-EA2D-433B-9EAF-567EF8707EE3"," EDE49B3A-3928-4902-B156-B4A49F163615"," FF565249-8242-4343-B1F2-7C9F9EA92A63"),$lb(1,1,1,1,1,1,1,1,1,1,1,1,2,1,1),$lb(540028982,808465987,825243187,825243187,842089524,842089524,859386675,859386675,876758066,876758066,893469253,893469253,910439728,910439728,942686534,942686534,959591490,959591490,1093943602,1093943602,1110520119,1110520119,1127429955,1127429955,1144271169,875643206,1177957940,1145452086,1162102068,1162102068,1179006262,541476405))</Histogram>
<Selectivity>0.0929%</Selectivity>
</Property>
<Property name="uid">
<AverageFieldSize>41</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="unitOfMeasure">
<AverageFieldSize>6</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" EACH"," EACH"," EACH"," EACH"," EACH"," EACH"," EACH"," EACH"," EACH"," EACH"," EACH"," EACH"," EACH"," EACH"," EACH"," EACH"),$lb(6,6,6,6,6,6,6,6,6,6,6,6,6,6,6),$lb(541409603,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541409603))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="value">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,16,$lb(-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="valueCurrency">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-240</BlockCount>
</SQLMap>
<SQLMap name="productIdIndex">
<BlockCount>-12</BlockCount>
</SQLMap>
<SQLMap name="purchaseOrderLineIdIndex">
<BlockCount>-40</BlockCount>
</SQLMap>
<SQLMap name="supplyShipmentIdIndex">
<BlockCount>-36</BlockCount>
</SQLMap>
<SQLMap name="uidIndex">
<BlockCount>-48</BlockCount>
</SQLMap>
<StreamLocation>^SC.Data.SupplyShipmentLineS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
