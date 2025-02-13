/// 
Class dc.data.health.HeartDisease Extends %Persistent [ ClassType = persistent, DdlAllowed, Final, Owner = {irisowner}, ProcedureBlock, SqlRowIdPrivate, SqlTableName = HeartDisease ]
{

Property age As %Library.Integer(MAXVAL = 2147483647, MINVAL = -2147483648) [ SqlColumnNumber = 2 ];

Property sex As %Library.Integer(MAXVAL = 2147483647, MINVAL = -2147483648) [ SqlColumnNumber = 3 ];

Property chestPainType As %Library.Integer(MAXVAL = 2147483647, MINVAL = -2147483648) [ SqlColumnNumber = 4 ];

Property bp As %Library.Integer(MAXVAL = 2147483647, MINVAL = -2147483648) [ SqlColumnNumber = 5 ];

Property cholesterol As %Library.Integer(MAXVAL = 2147483647, MINVAL = -2147483648) [ SqlColumnNumber = 6 ];

Property fbsOver120 As %Library.Integer(MAXVAL = 2147483647, MINVAL = -2147483648) [ SqlColumnNumber = 7 ];

Property ekgResults As %Library.Integer(MAXVAL = 2147483647, MINVAL = -2147483648) [ SqlColumnNumber = 8 ];

Property maxHr As %Library.Integer(MAXVAL = 2147483647, MINVAL = -2147483648) [ SqlColumnNumber = 9 ];

Property exerciseAngina As %Library.Integer(MAXVAL = 2147483647, MINVAL = -2147483648) [ SqlColumnNumber = 10 ];

Property stDepression As %Library.Currency [ SqlColumnNumber = 11 ];

Property slopeOfSt As %Library.Integer(MAXVAL = 2147483647, MINVAL = -2147483648) [ SqlColumnNumber = 12 ];

Property numberOfVesselsFluro As %Library.Integer(MAXVAL = 2147483647, MINVAL = -2147483648) [ SqlColumnNumber = 13 ];

Property thallium As %Library.Integer(MAXVAL = 2147483647, MINVAL = -2147483648) [ SqlColumnNumber = 14 ];

Property heartDisease As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 15 ];

Parameter USEEXTENTSET = 1;

/// Bitmap Extent Index auto-generated by DDL CREATE TABLE statement.  Do not edit the SqlName of this index.
Index DDLBEIndex [ Extent, SqlName = "%%DDLBEIndex", Type = bitmap ];

Storage Default
{
<Data name="HeartDiseaseDefaultData">
<Value name="1">
<Value>age</Value>
</Value>
<Value name="2">
<Value>sex</Value>
</Value>
<Value name="3">
<Value>chestPainType</Value>
</Value>
<Value name="4">
<Value>bp</Value>
</Value>
<Value name="5">
<Value>cholesterol</Value>
</Value>
<Value name="6">
<Value>fbsOver120</Value>
</Value>
<Value name="7">
<Value>ekgResults</Value>
</Value>
<Value name="8">
<Value>maxHr</Value>
</Value>
<Value name="9">
<Value>exerciseAngina</Value>
</Value>
<Value name="10">
<Value>stDepression</Value>
</Value>
<Value name="11">
<Value>slopeOfSt</Value>
</Value>
<Value name="12">
<Value>numberOfVesselsFluro</Value>
</Value>
<Value name="13">
<Value>thallium</Value>
</Value>
<Value name="14">
<Value>heartDisease</Value>
</Value>
</Data>
<DataLocation>^CVu6.EZXW.1</DataLocation>
<DefaultData>HeartDiseaseDefaultData</DefaultData>
<ExtentLocation>^CVu6.EZXW</ExtentLocation>
<ExtentSize>270</ExtentSize>
<IdFunction>sequence</IdFunction>
<IdLocation>^CVu6.EZXW.1</IdLocation>
<Index name="DDLBEIndex">
<Location>^CVu6.EZXW.2</Location>
</Index>
<Index name="IDKEY">
<Location>^CVu6.EZXW.1</Location>
</Index>
<IndexLocation>^CVu6.EZXW.I</IndexLocation>
<Property name="%%ID">
<AverageFieldSize>3.06</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(1,18,36,54,72,90,108,126,144,162,180,198,216,234,252,270),$lb(1,0,0,0,0,0,1,1,1,1,1,0,1,1,1),$lb(822083584,0,939524096,825753600,859176960,859176960,892600320,892600320,926023680,926023680,959447040,959447040,825243648,808976384,842399744,842399744,875823104,875823104,909246464,909246464,942669824,942669824,959971328,825833472,842085888,825622528,859045888,859045888,892469248,892469248,925892608,842477568))</Histogram>
<Selectivity>1</Selectivity>
</Property>
<Property name="age">
<AverageFieldSize>3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(29,41,43,45,48,51,52,54,56,58,59,60,62,65,67,77),$lb(0,1,1,1,0,1,1,1,1,1,0,1,1,1,0),$lb(842596352,842596352,875626496,822083584,855638016,855638016,889192448,889192448,939524096,876085248,892403712,822083584,838860800,838860800,872415232,872415232,905969664,905969664,939524096,939524096,956301312,892928000,909115392,805306368,838860800,838860800,889192448,889192448,922746880,909574144,926351360,926351360))</Histogram>
<Selectivity>2.4390%</Selectivity>
</Property>
<Property name="bp">
<AverageFieldSize>3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(94,108,110,118,120,120,125,130,130,134,138,140,144,150,160,200),$lb(0,1,2,1,3,2,1,3,2,2,1,2,1,1,0),$lb(959709184,959709184,825243648,808976384,825229312,805306368,939524096,825753600,842006528,0,0,805306368,889192448,842334208,858783744,0,0,805306368,872415232,872415232,939524096,859308032,875560960,805306368,872415232,875823104,892338176,892338176,909115392,825634816,842018816,842018816))</Histogram>
<OutlierSelectivity>.125926:120</OutlierSelectivity>
<Selectivity>1.9002%</Selectivity>
</Property>
<Property name="chestPainType">
<AverageFieldSize>3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(1,1,2,2,3,3,3,3,4,4,4,4,4,4,4,4),$lb(1,0,1,0,1,1,1,0,1,1,1,1,1,1,1),$lb(822083584,0,0,822083584,838860800,0,0,838860800,855638016,0,0,0,0,0,0,855638016,872415232,0,0,0,0,0,0,0,0,0,0,0,0,0,0,872415232))</Histogram>
<Selectivity>25.0000%</Selectivity>
</Property>
<Property name="cholesterol">
<AverageFieldSize>3.41</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(126,180,198,207,215,226,233,240,249,257,267,275,288,303,321,564),$lb(1,1,0,1,1,1,1,2,1,1,1,1,0,1,0),$lb(825374208,842399744,942669824,942669824,959971328,825833472,842020608,808910848,825556992,825556992,842399744,842399744,858980352,858980352,875560960,805306368,956301312,876150784,892796928,892796928,909574144,909574144,926220288,926220288,943194112,842545152,858796800,808648704,842072064,858927360,892744704,892744704))</Histogram>
<Selectivity>0.6944%</Selectivity>
</Property>
<Property name="ekgResults">
<AverageFieldSize>2.51</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(0,0,0,0,0,0,0,0,2,2,2,2,2,2,2,2),$lb(1,1,1,1,1,1,1,0,1,1,1,1,1,1,1),$lb(805306368,0,0,0,0,0,0,0,0,0,0,0,0,0,0,805306368,838860800,0,0,0,0,0,0,0,0,0,0,0,0,0,0,838860800))</Histogram>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="exerciseAngina">
<AverageFieldSize>2.33</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1),$lb(1,1,1,1,1,1,1,1,1,1,0,1,1,1,1),$lb(805306368,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,805306368,822083584,0,0,0,0,0,0,0,0,822083584))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="fbsOver120">
<AverageFieldSize>2.15</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1),$lb(1,1,1,1,1,1,1,1,1,1,1,1,0,1,1),$lb(805306368,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,805306368,822083584,0,0,0,0,822083584))</Histogram>
<OutlierSelectivity>.851852:0</OutlierSelectivity>
<Selectivity>14.8148%</Selectivity>
</Property>
<Property name="heartDisease">
<AverageFieldSize>9.44</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" ABSENCE"," ABSENCE"," ABSENCE"," ABSENCE"," ABSENCE"," ABSENCE"," ABSENCE"," ABSENCE"," ABSENCE"," PRESENCE"," PRESENCE"," PRESENCE"," PRESENCE"," PRESENCE"," PRESENCE"," PRESENCE"),$lb(9,9,9,9,9,9,9,9,1,10,10,10,10,10,10),$lb(541147731,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1094865733,1347568979,0,0,0,0,0,0,0,0,0,0,0,0,542134853))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="maxHr">
<AverageFieldSize>3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(71,111,122,128,137,142,147,151,156,159,162,165,170,173,180,202),$lb(0,1,2,1,1,2,1,2,2,1,2,1,2,1,0),$lb(925958144,925958144,825307392,825294848,842137600,838860800,939524096,842530816,859242496,859242496,875692032,838860800,922746880,876019712,892403712,822083584,905969664,905969664,956301312,892928000,909246464,838860800,889192448,909443072,925892608,805306368,855638016,926089216,942669824,825765888,842019328,842019328))</Histogram>
<Selectivity>1.1111%</Selectivity>
</Property>
<Property name="numberOfVesselsFluro">
<AverageFieldSize>2.41</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(0,0,0,0,0,0,0,0,0,1,1,1,1,2,3,3),$lb(1,1,1,1,1,1,1,1,0,1,1,1,0,0,1),$lb(805306368,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,805306368,822083584,0,0,0,0,0,0,822083584,838860800,838860800,855638016,0,0,855638016))</Histogram>
<Selectivity>25.0000%</Selectivity>
</Property>
<Property name="sex">
<AverageFieldSize>2.68</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1),$lb(1,1,1,1,0,1,1,1,1,1,1,1,1,1,1),$lb(805306368,0,0,0,0,0,0,0,0,805306368,822083584,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,822083584))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="slopeOfSt">
<AverageFieldSize>3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,3),$lb(1,1,1,1,1,1,1,0,1,1,1,1,1,1,0),$lb(822083584,0,0,0,0,0,0,0,0,0,0,0,0,0,0,822083584,838860800,0,0,0,0,0,0,0,0,0,0,0,0,838860800,855638016,855638016))</Histogram>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="stDepression">
<AverageFieldSize>4.37</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(0,0,0,0,0,.1,.4,.6,.9,1.2,1.4,1.6,1.9,2.4,3,6.2),$lb(1,1,1,1,0,1,1,1,0,2,2,2,0,0,0),$lb(805306368,0,0,0,0,0,0,0,0,805306368,774963200,822083584,872415232,872415232,905969664,905969664,956301312,775487488,825111040,838860800,872415232,872415232,905969664,905969664,956301312,825112832,841888768,841888768,855638016,855638016,908997120,908997120))</Histogram>
<OutlierSelectivity>.314815:0</OutlierSelectivity>
<Selectivity>1.8031%</Selectivity>
</Property>
<Property name="thallium">
<AverageFieldSize>3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(3,3,3,3,3,3,3,3,3,6,7,7,7,7,7,7),$lb(1,1,1,1,1,1,1,1,0,0,1,1,1,1,1),$lb(855638016,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,855638016,905969664,905969664,922746880,0,0,0,0,0,0,0,0,0,0,922746880))</Histogram>
<Selectivity>33.3333%</Selectivity>
</Property>
<SQLMap name="%%DDLBEIndex">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="IDKEY">
<BlockCount>-8</BlockCount>
</SQLMap>
<StreamLocation>^CVu6.EZXW.S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
