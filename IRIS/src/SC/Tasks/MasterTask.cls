/*
Copyright (c) 2022-2023 by InterSystems Corporation.
Cambridge, Massachusetts, U.S.A.  All rights reserved.
Confidential property of InterSystems Corporation.
*/

Class SC.Tasks.MasterTask Extends %SYS.Task.Definition
{

Parameter TaskName = "SCMaster";

Method OnTask() As %Status
{
    set st = ##class(SC.Core.Tasks.SynchCube).%New().OnTask()
    if $$$ISERR(st) Quit st
    // TODO: This is for mechane learning. Not needed now.
    // set st = ##class(SC.Core.Tasks.PredictSupplyShipmentLateArrival).%New().OnTask()
    // if $$$ISERR(st) Quit st
    set st = ##class(SC.Core.Tasks.UpdateKPIIssue).%New().OnTask()
    if $$$ISERR(st) Quit st
    set st = ##class(SC.Core.Tasks.SynchIssueCube).%New().OnTask()
    if $$$ISERR(st) Quit st
    set st = ##class(SC.Core.Tasks.AnalyzeAllNewIssues).%New().OnTask()
    if $$$ISERR(st) Quit st
    set st = ##class(SC.Core.Tasks.PredictInventory).%New().OnTask()
    if $$$ISERR(st) Quit st
    set st = ##class(SC.Core.Tasks.ConsolidatedInventoryTask).%New().OnTask()
    if $$$ISERR(st) Quit st
    
    return $$$OK
}

}
