Class SDC.Service.StateEventServiceBindingConfig Extends %SOAP.Configuration [ ProcedureBlock ]
{

/// Ignore any alternatives in Policy that are not understood.
Parameter REPORTANYERROR = 0;

XData service
{
<cfg:configuration xmlns:cfg="http://www.intersystems.com/configuration" name="service">
  <cfg:service classname="SDC.Service.StateEventServiceBinding">
    <wsp:Policy xmlns:wsp="http://www.w3.org/ns/ws-policy" cfg:wsdlElement="binding">
      <dpws:Profile xmlns:dpws="http://docs.oasis-open.org/ws-dd/ns/dpws/2009/01" wsp:Optional="true"/>
      <mdpws:Profile xmlns:mdpws="http://standards.ieee.org/downloads/11073/11073-20702-2016" wsp:Optional="true"/>
    </wsp:Policy>
    <cfg:method name="EpisodicAlertReport"/>
    <cfg:method name="EpisodicComponentReport"/>
    <cfg:method name="EpisodicMetricReport"/>
    <cfg:method name="EpisodicOperationalStateReport"/>
    <cfg:method name="PeriodicAlertReport"/>
    <cfg:method name="PeriodicComponentReport"/>
    <cfg:method name="PeriodicMetricReport"/>
    <cfg:method name="PeriodicOperationalStateReport"/>
    <cfg:method name="SystemErrorReport"/>
  </cfg:service>
</cfg:configuration>
}

}
