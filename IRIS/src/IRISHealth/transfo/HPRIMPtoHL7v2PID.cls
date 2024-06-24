Class IRISHealth.transfo.HPRIMPtoHL7v2PID Extends Ens.DataTransformDTL [ DependsOn = (HPRIM.EDI.E1238.Segment, EnsLib.HL7.Segment) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='HPRIM.EDI.E1238.Segment' targetClass='EnsLib.HL7.Segment' sourceDocType='HPRIM2.2Add:P' targetDocType='2.5.1:PID' create='new' language='objectscript' >
<assign value='source.{PatientIdNumber3}' property='target.{PatientID}' action='set' />
<assign value='source.{PatientName.LastName}' property='target.{PatientName(1).FamilyName}' action='set' />
<assign value='source.{PatientName.FirstName}' property='target.{PatientName(1).GivenName}' action='set' />
<assign value='source.{PatientName.Suffix}' property='target.{PatientName(1).Suffix}' action='set' />
<assign value='source.{PatientName.MiddleInitialOrName}' property='target.{PatientName(1).SecondandFurtherGivenNamesor}' action='set' />
<assign value='source.{MothersMaidenName}' property='target.{MothersMaidenName(1)}' action='set' />
<assign value='source.{DateOfBirth}' property='target.{DateTimeofBirth}' action='set' />
<assign value='source.{PatientSex}' property='target.{AdministrativeSex}' action='set' />
<assign value='source.{PatientRaceEthnicOrigin}' property='target.{Race(1)}' action='set' />
<assign value='source.{PatientAddress.StreetAddress}' property='target.{PatientAddress(1).StreetAddress}' action='set' />
<assign value='source.{PatientAddress.City}' property='target.{PatientAddress(1).City}' action='set' />
<assign value='source.{PatientAddress.StateOrProvince}' property='target.{PatientAddress(1).StateorProvince}' action='set' />
<assign value='source.{PatientAddress.ZipOrPostalCode}' property='target.{PatientAddress(1).ZiporPostalCode}' action='set' />
<assign value='source.{PatientAddress.Country}' property='target.{PatientAddress(1).Country}' action='set' />
<assign value='source.{PatientTelephoneNumber}' property='target.{PhoneNumberHome(1).TelephoneNumber}' action='set' />
<assign value='source.{PatientRaceEthnicOrigin}' property='target.{EthnicGroup(1)}' action='set' />
<assign value='source.{Religion}' property='target.{Religion}' action='set' />
<assign value='source.{PatientTelephoneNumber}' property='target.{PhoneNumberBusiness(1)}' action='set' />
<assign value='source.{Location}' property='target.{LastUpdateFacility}' action='set' />
</transform>
}

}
