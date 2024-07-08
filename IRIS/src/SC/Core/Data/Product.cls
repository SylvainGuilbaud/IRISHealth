/*
Copyright (c) 2022 by InterSystems Corporation.
Cambridge, Massachusetts, U.S.A.  All rights reserved.
Confidential property of InterSystems Corporation.
*/

Class SC.Core.Data.Product Extends SC.Core.Data.TimeStampedData [ Abstract, NoExtent ]
{

/// unique ID
Property uid As %String(MAXLEN = 256);

Index uidIndex On uid [ PrimaryKey ];

/// data source
Property dataSource As %String(MAXLEN = 128);

/// source system product ID
Property sourceProductId As %String(MAXLEN = 256);

/// product class
Property productClass As %String(MAXLEN = 128);

/// product category
Property productCategory As %String(MAXLEN = 128);

/// product brand
Property productBrand As %String(MAXLEN = 128);

/// product family
Property productFamily As %String(MAXLEN = 128);

/// product segment
Property productSegment As %String(MAXLEN = 128);

/// product number
Property productNumber As %String(MAXLEN = 128);

/// name of the product
Property name As %String(MAXLEN = 256);

/// product description
Property description As %String(MAXLEN = 512);

/// type of the product
Property type As %String(MAXLEN = 128);

/// product status
Property status As %String(MAXLEN = 128);

/// GS1 GTIN value of the product
Property gtin As %String(MAXLEN = 128);

/// default unit of measure
Property defaultUom As %String(MAXLEN = 128);

/// shelf life
Property shelfLife As %Numeric;

/// aging threshold
Property agingThreshold As %Numeric;

}
