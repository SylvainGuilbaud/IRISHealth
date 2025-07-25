/// 
Class IRISHealth.cubes.Patient Extends %DeepSee.CubeDefinition [ DependsOn = AAA.Patient, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="patient" displayName="patient" disabled="false" abstract="false" sourceClass="AAA.Patient" namedFactNums="true" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
  <dimension name="PatientGender" disabled="false" hasAll="false" allCaption="All PatientGender" allDisplayName="PatientGender" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="PatientGender" disabled="false" sourceProperty="PatientGender" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="2">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="PatientBirthDate" disabled="false" hasAll="false" allCaption="All PatientBirthDate" allDisplayName="PatientBirthDate" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="PatientBirthDate" disabled="false" sourceExpression="$extract(%source.PatientBirthDate,1,4)" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="3">
      </level>
    </hierarchy>
  </dimension>
  <listing name="New_listing1" disabled="false" listingType="table" fieldList="%ID,Key,Prenom,PatientNameFamily,PatientBirthDate,PatientGender,RowNum" selectMode="2">
  </listing>
</cube>
}

Parameter DOMAIN;

}
