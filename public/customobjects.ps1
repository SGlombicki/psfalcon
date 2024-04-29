function New-CommandName {
<#
.SYNOPSIS
List the object keys in the specified collection in alphabetical order
.DESCRIPTION
Requires 'Custom-Storage: Read'.
.PARAMETER CollectionName
The name of the collection
.PARAMETER End
The end key to end listing to
.PARAMETER Limit
Maximum number of results per request

The limit of results to return
.PARAMETER Start
The start key to start listing from
.LINK
https://github.com/crowdstrike/psfalcon/wiki/New-CommandName
#>
  [CmdletBinding(DefaultParameterSetName='/customobjects/v1/collections/{collection_name}/objects:get',SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='/customobjects/v1/collections/{collection_name}/objects:get',Mandatory,Position=0)]
    [ValidateRange(1,255)]
    [Alias('collection_name')]
    [string]$CollectionName,
    [Parameter(ParameterSetName='/customobjects/v1/collections/{collection_name}/objects:get',Position=0)]
    [ValidateRange(1,1000)]
    [string]$End,
    [Parameter(ParameterSetName='/customobjects/v1/collections/{collection_name}/objects:get',Position=0)]
    [int32]$Limit,
    [Parameter(ParameterSetName='/customobjects/v1/collections/{collection_name}/objects:get',Position=0)]
    [ValidateRange(1,1000)]
    [string]$Start
  )
  begin { $Param = @{ Command = $MyInvocation.MyCommand.Name; Endpoint = $PSCmdlet.ParameterSetName }}
  process { Invoke-Falcon @Param -UserInput $PSBoundParameters }
}
function New-CommandName {
<#
.SYNOPSIS
Search for objects that match the specified filter criteria (returns metadata, not actual objects)
.DESCRIPTION
Requires 'Custom-Storage: Read'.
.PARAMETER CollectionName
The name of the collection
.PARAMETER Filter
Falcon Query Language expression to limit results

The filter to limit the returned results.
.PARAMETER Limit
Maximum number of results per request

The limit of results to return
.PARAMETER Offset
Position to begin retrieving results

The offset of results to return
.PARAMETER Sort
Property and direction to sort results

The sort order for the returned results.
.LINK
https://github.com/crowdstrike/psfalcon/wiki/New-CommandName
#>
  [CmdletBinding(DefaultParameterSetName='/customobjects/v1/collections/{collection_name}/objects:post',SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='/customobjects/v1/collections/{collection_name}/objects:post',Mandatory,Position=0)]
    [ValidateRange(1,255)]
    [Alias('collection_name')]
    [string]$CollectionName,
    [Parameter(ParameterSetName='/customobjects/v1/collections/{collection_name}/objects:post',Mandatory,Position=0)]
    [ValidateRange(1,255)]
    [string]$Filter,
    [ValidateScript({ Test-FqlStatement $_ })]
    [Parameter(ParameterSetName='/customobjects/v1/collections/{collection_name}/objects:post',Position=0)]
    [int32]$Limit,
    [Parameter(ParameterSetName='/customobjects/v1/collections/{collection_name}/objects:post')]
    [int32]$Offset,
    [Parameter(ParameterSetName='/customobjects/v1/collections/{collection_name}/objects:post',Position=0)]
    [ValidateRange(1,255)]
    [string]$Sort
  )
  begin { $Param = @{ Command = $MyInvocation.MyCommand.Name; Endpoint = $PSCmdlet.ParameterSetName }}
  process { Invoke-Falcon @Param -UserInput $PSBoundParameters }
}
function New-CommandName {
<#
.SYNOPSIS
Get the bytes for the specified object
.DESCRIPTION
Requires 'Custom-Storage: Read'.
.PARAMETER CollectionName
The name of the collection
.PARAMETER ObjectKey
The object key
.LINK
https://github.com/crowdstrike/psfalcon/wiki/New-CommandName
#>
  [CmdletBinding(DefaultParameterSetName='/customobjects/v1/collections/{collection_name}/objects/{object_key}:get',SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='/customobjects/v1/collections/{collection_name}/objects/{object_key}:get',Mandatory,Position=0)]
    [ValidateRange(1,255)]
    [Alias('collection_name')]
    [string]$CollectionName,
    [Parameter(ParameterSetName='/customobjects/v1/collections/{collection_name}/objects/{object_key}:get',Mandatory,Position=0)]
    [ValidateRange(1,1000)]
    [Alias('object_key')]
    [string]$ObjectKey
  )
  begin { $Param = @{ Command = $MyInvocation.MyCommand.Name; Endpoint = $PSCmdlet.ParameterSetName }}
  process { Invoke-Falcon @Param -UserInput $PSBoundParameters }
}
function New-CommandName {
<#
.SYNOPSIS
Put the specified new object at the given key or overwrite an existing object at the given key
.DESCRIPTION
Requires 'Custom-Storage: Write'.
.PARAMETER Body

.PARAMETER CollectionName
The name of the collection
.PARAMETER DryRun
If false, run the operation as normal.  If true, validate that the request *would* succeed, but don't execute it.
.PARAMETER ObjectKey
The object key
.PARAMETER SchemaVersion
The version of the collection schema
.LINK
https://github.com/crowdstrike/psfalcon/wiki/New-CommandName
#>
  [CmdletBinding(DefaultParameterSetName='/customobjects/v1/collections/{collection_name}/objects/{object_key}:put',SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='/customobjects/v1/collections/{collection_name}/objects/{object_key}:put',Mandatory,Position=0)]
    []$Body,
    [Parameter(ParameterSetName='/customobjects/v1/collections/{collection_name}/objects/{object_key}:put',Mandatory,Position=0)]
    [ValidateRange(1,255)]
    [Alias('collection_name')]
    [string]$CollectionName,
    [Parameter(ParameterSetName='/customobjects/v1/collections/{collection_name}/objects/{object_key}:put',Position=0)]
    [Alias('dry_run')]
    [boolean]$DryRun,
    [Parameter(ParameterSetName='/customobjects/v1/collections/{collection_name}/objects/{object_key}:put',Mandatory,Position=0)]
    [ValidateRange(1,1000)]
    [Alias('object_key')]
    [string]$ObjectKey,
    [Parameter(ParameterSetName='/customobjects/v1/collections/{collection_name}/objects/{object_key}:put',Position=0)]
    [Alias('schema_version')]
    [string]$SchemaVersion
  )
  begin { $Param = @{ Command = $MyInvocation.MyCommand.Name; Endpoint = $PSCmdlet.ParameterSetName }}
  process { Invoke-Falcon @Param -UserInput $PSBoundParameters }
}
function New-CommandName {
<#
.SYNOPSIS
Delete the specified object
.DESCRIPTION
Requires 'Custom-Storage: Write'.
.PARAMETER CollectionName
The name of the collection
.PARAMETER DryRun
If false, run the operation as normal.  If true, validate that the request *would* succeed, but don't execute it.
.PARAMETER ObjectKey
The object key
.LINK
https://github.com/crowdstrike/psfalcon/wiki/New-CommandName
#>
  [CmdletBinding(DefaultParameterSetName='/customobjects/v1/collections/{collection_name}/objects/{object_key}:delete',SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='/customobjects/v1/collections/{collection_name}/objects/{object_key}:delete',Mandatory,Position=0)]
    [ValidateRange(1,255)]
    [Alias('collection_name')]
    [string]$CollectionName,
    [Parameter(ParameterSetName='/customobjects/v1/collections/{collection_name}/objects/{object_key}:delete',Position=0)]
    [Alias('dry_run')]
    [boolean]$DryRun,
    [Parameter(ParameterSetName='/customobjects/v1/collections/{collection_name}/objects/{object_key}:delete',Mandatory,Position=0)]
    [ValidateRange(1,1000)]
    [Alias('object_key')]
    [string]$ObjectKey
  )
  begin { $Param = @{ Command = $MyInvocation.MyCommand.Name; Endpoint = $PSCmdlet.ParameterSetName }}
  process { Invoke-Falcon @Param -UserInput $PSBoundParameters }
}
function New-CommandName {
<#
.SYNOPSIS
Get the metadata for the specified object
.DESCRIPTION
Requires 'Custom-Storage: Read'.
.PARAMETER CollectionName
The name of the collection
.PARAMETER ObjectKey
The object key
.LINK
https://github.com/crowdstrike/psfalcon/wiki/New-CommandName
#>
  [CmdletBinding(DefaultParameterSetName='/customobjects/v1/collections/{collection_name}/objects/{object_key}/metadata:get',SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='/customobjects/v1/collections/{collection_name}/objects/{object_key}/metadata:get',Mandatory,Position=0)]
    [ValidateRange(1,255)]
    [Alias('collection_name')]
    [string]$CollectionName,
    [Parameter(ParameterSetName='/customobjects/v1/collections/{collection_name}/objects/{object_key}/metadata:get',Mandatory,Position=0)]
    [ValidateRange(1,1000)]
    [Alias('object_key')]
    [string]$ObjectKey
  )
  begin { $Param = @{ Command = $MyInvocation.MyCommand.Name; Endpoint = $PSCmdlet.ParameterSetName }}
  process { Invoke-Falcon @Param -UserInput $PSBoundParameters }
}
