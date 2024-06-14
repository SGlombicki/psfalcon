function Get-FalconMigration {
<#
.SYNOPSIS
Search for Falcon host migration jobs
.DESCRIPTION
Requires 'Host Migration: Read'.
.PARAMETER Id
Falcon host migration job identifier
.PARAMETER Filter
Falcon Query Language expression to limit results
.PARAMETER Sort
Property and direction to sort results
.PARAMETER Limit
Maximum number of results per request
.PARAMETER Offset
Position to begin retrieving results
.PARAMETER Detailed
Retrieve detailed information
.PARAMETER All
Repeat requests until all available results are retrieved
.PARAMETER Total
Display total result count instead of results
.LINK
https://github.com/crowdstrike/psfalcon/wiki/Get-FalconMigration
#>
  [CmdletBinding(DefaultParameterSetName='/host-migration/queries/migrations/v1:get',SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='/host-migration/entities/migrations/v1:get',Mandatory,
      ValueFromPipelineByPropertyName,ValueFromPipeline)]
    [Alias('ids')]
    [string[]]$Id,
    [Parameter(ParameterSetName='/host-migration/queries/migrations/v1:get',Position=1)]
    [ValidateScript({ Test-FqlStatement $_ })]
    [string]$Filter,
    [Parameter(ParameterSetName='/host-migration/queries/migrations/v1:get',Position=2)]
    [ValidateSet('target_cid|asc','target_cid|desc','status|asc','status|desc','migration_status|asc',
      'migration_status|desc','created_by|asc','created_by|desc','created_time|asc','created_time|desc',
      'name|asc','name|desc','id|asc','id|desc','migration_id|asc','migration_id|desc',IgnoreCase=$false)]
    [string]$Sort,
    [Parameter(ParameterSetName='/host-migration/queries/migrations/v1:get',Position=3)]
    [ValidateRange(1,10000)]
    [int32]$Limit,
    [Parameter(ParameterSetName='/host-migration/queries/migrations/v1:get')]
    [int32]$Offset,
    [Parameter(ParameterSetName='/host-migration/queries/migrations/v1:get')]
    [switch]$Detailed,
    [Parameter(ParameterSetName='/host-migration/queries/migrations/v1:get')]
    [switch]$All,
    [Parameter(ParameterSetName='/host-migration/queries/migrations/v1:get')]
    [switch]$Total
  )
  begin {
    $Param = @{ Command = $MyInvocation.MyCommand.Name; Endpoint = $PSCmdlet.ParameterSetName }
    [System.Collections.Generic.List[string]]$List = @()
  }
  process {
    if ($Id) { @($Id).foreach{ $List.Add($_) }} else { Invoke-Falcon @Param -UserInput $PSBoundParameters }}
  end {
    if ($List) {
      $PSBoundParameters['Id'] = @($List)
      Invoke-Falcon @Param -UserInput $PSBoundParameters
    }
  }
}