/// 
Class IRISHealth.cubes.Patient Extends %DeepSee.CubeDefinition [ DependsOn = AAA.Patient, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="Patient" displayName="Patient" disabled="false" abstract="false" sourceClass="AAA.Patient" namedFactNums="true" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
  <dimension name="FirstName" disabled="false" hasAll="false" allCaption="All FirstName" allDisplayName="FirstName" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="FirstName" disabled="false" sourceProperty="FirstName" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="2">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="BirthPlaceCity" disabled="false" hasAll="false" allCaption="All BirthPlaceCity" allDisplayName="BirthPlaceCity" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="BirthPlaceCity" disabled="false" sourceProperty="BirthPlaceCity" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="3">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="BirthPlaceCountry" disabled="false" hasAll="false" allCaption="All BirthPlaceCountry" allDisplayName="BirthPlaceCountry" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="BirthPlaceCountry" disabled="false" sourceProperty="BirthPlaceCountry" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="4">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="BirthPlaceState" disabled="false" hasAll="false" allCaption="All BirthPlaceState" allDisplayName="BirthPlaceState" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="BirthPlaceState" disabled="false" sourceProperty="BirthPlaceState" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="5">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="AddressState" disabled="false" hasAll="false" allCaption="All AddressState" allDisplayName="AddressState" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="AddressState" disabled="false" sourceProperty="AddressState" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="6">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="AddressPostalCode" disabled="false" hasAll="false" allCaption="All AddressPostalCode" allDisplayName="AddressPostalCode" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="AddressPostalCode" disabled="false" sourceProperty="AddressPostalCode" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="7">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="AddressCity" disabled="false" hasAll="false" allCaption="All AddressCity" allDisplayName="AddressCity" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="AddressCity" disabled="false" sourceProperty="AddressCity" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="8">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="Gender" disabled="false" hasAll="false" allCaption="All Gender" allDisplayName="Gender" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Gender" disabled="false" sourceProperty="Gender" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="9">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="LastName" disabled="false" hasAll="false" allCaption="All LastName" allDisplayName="LastName" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="LastName" disabled="false" sourceProperty="LastName" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="10">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="LastUpdated" disabled="false" hasAll="false" allCaption="All LastUpdated" allDisplayName="LastUpdated" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="LastUpdated" disabled="false" sourceProperty="LastUpdated" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="11">
      </level>
    </hierarchy>
  </dimension>
  <listing name="listing" disabled="false" listingType="table" fieldList="%ID,Key,LastName,FirstName,Gender,IdentifierCode,IdentifierType,IdentifierValue,LastUpdated,AddressLine,AddressPostalCode,AddressCity,AddressState,AddressCountry,BirthPlaceCity,BirthPlaceCountry,BirthPlaceState">
  </listing>
</cube>
}

Parameter DOMAIN;

}
