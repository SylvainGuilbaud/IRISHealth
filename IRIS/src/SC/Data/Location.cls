/*
Copyright (c) 2022 by InterSystems Corporation.
Cambridge, Massachusetts, U.S.A.  All rights reserved.
Confidential property of InterSystems Corporation.
*/

/// Location object can be used to store any kind of addresses, such as those for
/// supplier, customers, ship-to, ship-from, manufacturing plant, warehouses, etc. 
/// It can also be used to save any geo location with coordinates without an address.
Class SC.Data.Location Extends SC.Core.Data.Location
{

Storage Default
{
<Data name="LocationDefaultData">
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
<Value>status</Value>
</Value>
<Value name="7">
<Value>street</Value>
</Value>
<Value name="8">
<Value>city</Value>
</Value>
<Value name="9">
<Value>stateProvince</Value>
</Value>
<Value name="10">
<Value>country</Value>
</Value>
<Value name="11">
<Value>postalCode</Value>
</Value>
<Value name="12">
<Value>coordinates</Value>
</Value>
<Value name="13">
<Value>latitude</Value>
</Value>
<Value name="14">
<Value>longitude</Value>
</Value>
<Value name="15">
<Value>gln</Value>
</Value>
<Value name="16">
<Value>uid</Value>
</Value>
<Value name="17">
<Value>stateProvinceIso2</Value>
</Value>
<Value name="18">
<Value>countryIso2</Value>
</Value>
<Value name="19">
<Value>countryIso3</Value>
</Value>
<Value name="20">
<Value>countryPhoneCode</Value>
</Value>
<Value name="21">
<Value>currencyIso3</Value>
</Value>
<Value name="22">
<Value>region</Value>
</Value>
<Value name="23">
<Value>subregion</Value>
</Value>
</Data>
<DataLocation>^SC.Data.LocationD</DataLocation>
<DefaultData>LocationDefaultData</DefaultData>
<ExtentSize>27</ExtentSize>
<IdLocation>^SC.Data.LocationD</IdLocation>
<IndexLocation>^SC.Data.LocationI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(1,2,4,6,8,10,12,14,16,18,20,22,24,25,26,27),$lb(0,0,0,0,0,1,1,1,1,0,1,1,1,1,1),$lb(822083584,822083584,838860800,838860800,872415232,872415232,905969664,905969664,939524096,939524096,825229312,805306368,838860800,838860800,872415232,872415232,905969664,905969664,939524096,825753600,842006528,805306368,838860800,838860800,872415232,872415232,889192448,889192448,905969664,905969664,922746880,842465280))</Histogram>
<Selectivity>1</Selectivity>
</Property>
<Property name="city">
<AverageFieldSize>8.15</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," BEIJING"," BONN"," DALLAS"," FRAMINGHAM"," MEXICO CITY"," NIIGATA"," RIO DE JANEIRO"," SEATTLE"," SHANGHAI"," SRIPERUMBUDUR"," ZHENGZHOU"),$lb(2,2,2,2,1,2,1,1,1,1,1,1,2,2,1),$lb(536870912,0,0,0,0,0,0,0,0,0,1111837002,1162431049,1330531840,1112493646,1145130060,1145130060,1179795789,1179795789,1296390217,1296390217,1313425735,1313425735,1380536096,1380536096,1397047636,1161909332,1212239431,1212239431,1380536389,1397901648,1514685774,542787653))</Histogram>
<OutlierSelectivity>.296296:</OutlierSelectivity>
<Selectivity>4.1394%</Selectivity>
</Property>
<Property name="coordinates">
<AverageFieldSize>22.78</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" -22.873585, -43.352607"," -26.138404, 27.938874"," 14.117562, 121.346875"," 23.052284, 113.972359"," 31.210832, 121.539203"," 32.808467, -96.730187"," 35.613431, 138.543052"," 36.58869, 127.921454"," 39.853204, 116.360350"," 39.853204, 116.360350"," 40.687778, -74.207676"," 42.314061, -71.435539"," 47.616646, -122.302932"," 5.414081, 100.311749"," 50.729641, 7.097385"," 52.874492, 6.589781"),$lb(3,1,1,1,2,2,2,2,23,1,2,2,1,2,2),$lb(539832882,841889847,908996915,758265390,825503281,825503281,842214960,842214960,858861106,825111089,841889840,841889840,892220977,892220977,908997944,908997944,959330357,0,0,859385400,875572790,808334904,841888561,841888561,925775409,876031542,892220465,775172404,808335154,808335154,841889847,540357166))</Histogram>
<Selectivity>4.0000%</Selectivity>
</Property>
<Property name="country">
<AverageFieldSize>5</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" BRA"," CHN"," CHN"," CHN"," DEU"," IND"," JPN"," MEX"," MYS"," PHL"," USA"," USA"," USA"," USA"," USA"," ZAF"),$lb(1,5,5,1,1,1,1,2,1,1,5,5,5,5,1),$lb(541217345,1112686848,1128812032,0,0,0,0,1128812032,1145394432,1145394432,1229865984,1229865984,1246776832,1246776832,1296390144,1163395072,1498611712,1297699584,1346915328,1346915328,1431519488,0,0,0,0,0,0,0,0,1431519488,1514227200,542785862))</Histogram>
<OutlierSelectivity>.296296:"USA"</OutlierSelectivity>
<Selectivity>5.8642%</Selectivity>
</Property>
<Property name="countryIso2">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="countryIso3">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="countryPhoneCode">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="currencyIso3">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="gln">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="lastUpdatedTime">
<AverageFieldSize>25</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb("2023-05-04 02:30:00.127","2023-05-04 02:30:00.128","2023-05-04 02:30:00.128","2023-05-04 02:30:00.128","2023-05-04 02:30:00.128","2023-05-04 02:30:00.128","2023-05-04 02:30:00.128","2023-05-04 02:30:00.128","2023-05-04 02:30:00.128","2023-05-04 02:30:00.128","2023-05-04 02:30:00.128","2023-05-04 02:30:00.128","2023-05-04 02:30:00.128","2023-05-04 02:30:00.128","2023-05-04 02:30:00.128","2023-05-04 02:30:00.128"),$lb(22,24,24,24,24,24,24,24,24,24,24,24,24,24,24),$lb(842019379,922746880,939524096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,842019379))</Histogram>
<OutlierSelectivity>.962963:"2023-05-04 02:30:00.128"</OutlierSelectivity>
<Selectivity>3.7037%</Selectivity>
</Property>
<Property name="latitude">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="longitude">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="name">
<AverageFieldSize>12.78</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" CHINA PLANT"," INDIA PLANT"," LOC-CUST-10"," LOC-CUST-12"," LOC-CUST-2"," LOC-CUST-4"," LOC-CUST-6"," LOC-CUST-8"," LOC-SUPL-1"," LOC-SUPL-2"," LOC-SUPL-4"," LOC-SUPL-6"," LOC-SUPL-8"," LOC-SUPL-9"," US WAREHOUSE EAST"," US WAREHOUSE WEST"),$lb(1,1,11,10,10,10,10,5,10,10,10,10,10,1,14),$lb(541280329,1128810830,1229866057,1229866057,1280262957,805306368,838860800,825360384,838860800,838860800,872415232,872415232,905969664,905969664,939524096,1129665364,1398100044,822083584,838860800,838860800,872415232,872415232,905969664,905969664,939524096,939524096,956301312,1280262957,1431511127,1161909076,1464161108,542462752))</Histogram>
<Selectivity>3.7037%</Selectivity>
</Property>
<Property name="postalCode">
<AverageFieldSize>4.04</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," 01702"," 20000-000"," 28050"," 55423"," 602105"," 75201"," 98109"),$lb(2,2,2,2,2,2,2,2,1,1,2,1,1,1,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,808531760,808531760,842018864,808464432,942683440,842543157,892679218,892679218,909128241,909128241,926233136,926233136,959983920,540620849))</Histogram>
<OutlierSelectivity>.62963:</OutlierSelectivity>
<Selectivity>3.7037%</Selectivity>
</Property>
<Property name="recordCreatedTime">
<AverageFieldSize>25</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb("2023-05-04 02:30:00.127","2023-05-04 02:30:00.128","2023-05-04 02:30:00.128","2023-05-04 02:30:00.128","2023-05-04 02:30:00.128","2023-05-04 02:30:00.128","2023-05-04 02:30:00.128","2023-05-04 02:30:00.128","2023-05-04 02:30:00.128","2023-05-04 02:30:00.128","2023-05-04 02:30:00.128","2023-05-04 02:30:00.128","2023-05-04 02:30:00.128","2023-05-04 02:30:00.128","2023-05-04 02:30:00.128","2023-05-04 02:30:00.128"),$lb(22,24,24,24,24,24,24,24,24,24,24,24,24,24,24),$lb(842019379,922746880,939524096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,842019379))</Histogram>
<OutlierSelectivity>.962963:"2023-05-04 02:30:00.128"</OutlierSelectivity>
<Selectivity>3.7037%</Selectivity>
</Property>
<Property name="region">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="stateProvince">
<AverageFieldSize>6.96</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," CA"," DRENTHE"," GUANGDONG"," LAGUNA"," MA"," NY"," RIO DE JANEIRO"," TAMIL NADU"," TX"," TX"," WA"," YAMANASHI"),$lb(2,2,2,1,1,1,1,1,1,1,1,2,4,1,1),$lb(536870912,0,0,0,0,0,0,0,1128333312,1128333312,1146242382,1146242382,1196769614,1196769614,1279346517,1279346517,1296105472,1296105472,1314455552,1314455552,1380536096,1380536096,1413565769,1095584076,1476395008,0,0,1415053312,1463877632,1463877632,1497451841,542720333))</Histogram>
<OutlierSelectivity>.222222:</OutlierSelectivity>
<Selectivity>4.0936%</Selectivity>
</Property>
<Property name="stateProvinceIso2">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="status">
<AverageFieldSize>8</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"),$lb(8,8,8,8,8,8,8,8,8,8,8,8,8,8,8),$lb(541147988,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541147988))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="street">
<AverageFieldSize>12.93</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," 208 S AKARD ST"," 216 14TH AVENUE"," 410 TERRY AVE N"," 7601 PENN AVE S."," PLOT NO: A-1, SIPCOT INDUSTRIAL PARK"," RONDA DE LA COMUNICACIÃ³N, S/N"," RUA HUMBERTO DE CAMPOS 425"," ZHENGGANG 4TH ST"),$lb(2,2,2,2,2,2,2,1,2,1,1,1,1,2,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,842020896,808984659,825630769,842085920,875638816,875638816,926298161,926298161,1347178324,1347178324,1380929092,1330529345,1430331464,1381318944,1514685774,542787653))</Histogram>
<OutlierSelectivity>.518519:</OutlierSelectivity>
<Selectivity>3.7037%</Selectivity>
</Property>
<Property name="subregion">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="type">
<AverageFieldSize>9.85</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" CUSTOMER"," CUSTOMER"," CUSTOMER"," CUSTOMER"," CUSTOMER"," CUSTOMER"," CUSTOMER"," PLANT"," SUPPLIER"," SUPPLIER"," SUPPLIER"," SUPPLIER"," SUPPLIER"," SUPPLIER"," WAREHOUSE"," WAREHOUSE"),$lb(10,10,10,10,10,10,1,1,10,10,10,10,10,1,11),$lb(541283667,0,0,0,0,0,0,0,0,0,0,0,0,1129665364,1347174734,1347174734,1398100048,0,0,0,0,0,0,0,0,0,0,1398100048,1463898693,0,0,542589266))</Histogram>
<Selectivity>25.0000%</Selectivity>
</Property>
<Property name="uid">
<AverageFieldSize>12.56</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="uidIndex">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^SC.Data.LocationS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
