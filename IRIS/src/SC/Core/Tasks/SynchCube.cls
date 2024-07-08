/*
Copyright (c) 2022-2023 by InterSystems Corporation.
Cambridge, Massachusetts, U.S.A.  All rights reserved.
Confidential property of InterSystems Corporation.
*/

Class SC.Core.Tasks.SynchCube Extends %SYS.Task.Definition
{

Parameter TaskName = "SynchOrderShipmentCube";

Method OnTask() As %Status
{
    set st = ##class(%DeepSee.Utils).%SynchronizeCube("SalesOrderCube",1,,,,,.tStats)
    if $$$ISERR(st) Quit st
    set st = ##class(%DeepSee.Utils).%SynchronizeCube("SalesOrderLineCube",1,,,,,.tStats)
    if $$$ISERR(st) Quit st
    set st = ##class(%DeepSee.Utils).%SynchronizeCube("SalesShipmentCube",1,,,,,.tStats)
    if $$$ISERR(st) Quit st
    set st = ##class(%DeepSee.Utils).%SynchronizeCube("SupplyShipmentCube",1,,,,,.tStats)
    return st
}

}
