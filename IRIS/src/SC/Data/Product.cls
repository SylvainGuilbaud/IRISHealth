/*
Copyright (c) 2022 by InterSystems Corporation.
Cambridge, Massachusetts, U.S.A.  All rights reserved.
Confidential property of InterSystems Corporation.
*/

/// This object is used to capture master data of a product. A product can be the final product
/// made and sold by a company, it can also be a part used to make the final product. One can use product
/// type attributes to differential different type of products (such as final products vs parts/items).
Class SC.Data.Product Extends SC.Core.Data.Product
{

Storage Default
{
<Data name="ProductDefaultData">
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
<Value>dataSource</Value>
</Value>
<Value name="5">
<Value>sourceProductId</Value>
</Value>
<Value name="6">
<Value>productClass</Value>
</Value>
<Value name="7">
<Value>productCategory</Value>
</Value>
<Value name="8">
<Value>productBrand</Value>
</Value>
<Value name="9">
<Value>productFamily</Value>
</Value>
<Value name="10">
<Value>productSegment</Value>
</Value>
<Value name="11">
<Value>productNumber</Value>
</Value>
<Value name="12">
<Value>name</Value>
</Value>
<Value name="13">
<Value>description</Value>
</Value>
<Value name="14">
<Value>type</Value>
</Value>
<Value name="15">
<Value>status</Value>
</Value>
<Value name="16">
<Value>gtin</Value>
</Value>
<Value name="17">
<Value>defaultUom</Value>
</Value>
<Value name="18">
<Value>shelfLife</Value>
</Value>
<Value name="19">
<Value>agingThreshold</Value>
</Value>
<Value name="20">
<Value>uid</Value>
</Value>
</Data>
<DataLocation>^SC.Data.ProductD</DataLocation>
<DefaultData>ProductDefaultData</DefaultData>
<ExtentSize>18</ExtentSize>
<IdLocation>^SC.Data.ProductD</IdLocation>
<IndexLocation>^SC.Data.ProductI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(1,2,4,6,7,8,9,10,11,12,13,14,15,16,17,18),$lb(0,0,0,0,0,0,0,1,1,1,1,1,1,1,1),$lb(822083584,822083584,838860800,838860800,872415232,872415232,905969664,905969664,922746880,922746880,939524096,939524096,956301312,956301312,825229312,805306368,822083584,822083584,838860800,838860800,855638016,855638016,872415232,872415232,889192448,889192448,905969664,905969664,922746880,922746880,939524096,825753600))</Histogram>
<Selectivity>1</Selectivity>
</Property>
<Property name="agingThreshold">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,16,$lb(-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="dataSource">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="defaultUom">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="description">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="gtin">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="lastUpdatedTime">
<AverageFieldSize>25</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb("2023-05-04 13:37:30.319","2023-05-04 13:37:30.319","2023-05-04 13:37:30.319","2023-05-04 13:37:30.319","2023-05-04 13:37:30.319","2023-05-04 13:37:30.319","2023-05-04 13:37:30.319","2023-05-04 13:37:30.319","2023-05-04 13:37:30.319","2023-05-04 13:37:30.319","2023-05-04 13:37:30.319","2023-05-04 13:37:30.319","2023-05-04 13:37:30.319","2023-05-04 13:37:30.320","2023-05-04 13:37:30.320","2023-05-04 13:37:30.320"),$lb(24,24,24,24,24,24,24,24,24,24,24,24,21,24,24),$lb(842019379,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,825819136,842006528,0,0,0,0,842019379))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="name">
<AverageFieldSize>17.44</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 5.4 INCH TOUCH SCREEN"," 6.1 INCH TOUCH SCREEN"," APPLE A9 CPU"," APPLE WATCH SERIES 3"," APPLE WATCH SERIES 6"," IPAD"," IPAD MINI"," IPAD PRO"," IPHONE 13"," IPHONE 13 BATTERY"," IPHONE 13 PRO"," IPHONE 13 PRO MAX"," IPHONE MEMORY 128G"," IPHONE MEMORY 256G"," IPHONE MEMORY 512G"," IPHONE MEMORY CHIP"),$lb(1,1,7,20,1,5,6,3,10,11,14,8,15,15,15),$lb(540356148,892220448,908996896,908996896,1095782476,1094262851,1463899203,855638016,905969664,1095782476,1229996356,0,541935950,1296649801,1347571456,1094983760,1213156933,0,541213012,1111577684,1347571456,0,541933912,825434192,1296387407,825374791,842348103,842348103,892416583,892416583,1128810832,541675592))</Histogram>
<Selectivity>5.5556%</Selectivity>
</Property>
<Property name="productBrand">
<AverageFieldSize>4.5</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," APPLE"," APPLE"," APPLE"," APPLE"," APPLE"," APPLE"," APPLE"," APPLE"," APPLE"),$lb(2,2,2,2,2,2,1,7,7,7,7,7,7,7,7),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,1095782476,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541151312))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="productCategory">
<AverageFieldSize>17</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" BATTERY"," CONSUMER ELECTRONICS"," CONSUMER ELECTRONICS"," CONSUMER ELECTRONICS"," CONSUMER ELECTRONICS"," CONSUMER ELECTRONICS"," CONSUMER ELECTRONICS"," CONSUMER ELECTRONICS"," CPU"," MEMORY CHIP"," MEMORY CHIP"," MEMORY CHIP"," MEMORY CHIP"," TOUCH SCREEN"," TOUCH SCREEN"," TOUCH SCREEN"),$lb(1,22,22,22,22,22,22,2,1,13,13,13,1,14,14),$lb(541213012,1111577684,1129270867,0,0,0,0,0,0,0,0,0,0,0,0,1330533205,1347747840,1129338112,1296387407,0,0,0,0,0,0,1296387407,1414485315,0,0,0,0,542396245))</Histogram>
<Selectivity>20.0000%</Selectivity>
</Property>
<Property name="productClass">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="productFamily">
<AverageFieldSize>5.89</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," APPLE WATCH"," APPLE WATCH"," APPLE WATCH"," APPLE WATCH"," IPAD"," IPAD"," IPHONE"," IPHONE"," IPHONE"),$lb(2,2,2,2,2,2,1,13,13,13,1,6,3,8,8),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,1095782476,0,0,0,0,0,0,1095782476,1229996356,0,0,1094975488,1213156933,0,0,0,0,541675592))</Histogram>
<Selectivity>25.0000%</Selectivity>
</Property>
<Property name="productNumber">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="productSegment">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="recordCreatedTime">
<AverageFieldSize>25</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb("2023-05-04 13:37:30.319","2023-05-04 13:37:30.319","2023-05-04 13:37:30.319","2023-05-04 13:37:30.319","2023-05-04 13:37:30.319","2023-05-04 13:37:30.319","2023-05-04 13:37:30.319","2023-05-04 13:37:30.319","2023-05-04 13:37:30.319","2023-05-04 13:37:30.319","2023-05-04 13:37:30.319","2023-05-04 13:37:30.319","2023-05-04 13:37:30.319","2023-05-04 13:37:30.320","2023-05-04 13:37:30.320","2023-05-04 13:37:30.320"),$lb(24,24,24,24,24,24,24,24,24,24,24,24,21,24,24),$lb(842019379,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,825819136,842006528,0,0,0,0,842019379))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="shelfLife">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,16,$lb(-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="sourceProductId">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="status">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="type">
<AverageFieldSize>7.5</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" PART"," PART"," PART"," PART"," PART"," PART"," PART"," PRODUCT"," PRODUCT"," PRODUCT"," PRODUCT"," PRODUCT"," PRODUCT"," PRODUCT"," PRODUCT"," PRODUCT"),$lb(6,6,6,6,6,6,2,9,9,9,9,9,9,9,9),$lb(542130514,0,0,0,0,0,0,0,0,0,0,0,0,1095914496,1380926549,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,542134863))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="uid">
<AverageFieldSize>9.33</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="uidIndex">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^SC.Data.ProductS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
