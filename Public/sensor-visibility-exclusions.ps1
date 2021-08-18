function Edit-FalconSvExclusion {
<#
.Synopsis
Modify Sensor Visibility exclusions
.Description
Requires 'sensor-visibility-exclusions:write'.
.Parameter Id
Sensor Visibility exclusion identifier
.Parameter Value
RegEx pattern value
.Parameter GroupIds
Host group identifier(s) or 'all'
.Parameter Comment
Audit log comment
.Role
sensor-visibility-exclusions:write
.Example
PS>Edit-FalconSvExclusion -Id <id> -Value '/foochanged*'

Modify the existing Sensor Visibility exclusion <id> to set the 'value' to '/foochanged*'.
#>
    [CmdletBinding(DefaultParameterSetName = '/policy/entities/sv-exclusions/v1:patch')]
    param(
        [Parameter(ParameterSetName = '/policy/entities/sv-exclusions/v1:patch', Mandatory = $true,
            ValueFromPipelineByPropertyName = $true, ValueFromPipeline = $true, Position = 1)]
        [ValidatePattern('^\w{32}$')]
        [string] $Id,

        [Parameter(ParameterSetName = '/policy/entities/sv-exclusions/v1:patch', Position = 2)]
        [string] $Value,

        [Parameter(ParameterSetName = '/policy/entities/sv-exclusions/v1:patch', Position = 3)]
        [ValidatePattern('^(\w{32}|all)$')]
        [array] $GroupIds,

        [Parameter(ParameterSetName = '/policy/entities/sv-exclusions/v1:patch', Position = 4)]
        [string] $Comment
    )
    begin {
        $Fields = @{
            GroupIds = 'groups'
        }
        $Param = @{
            Command  = $MyInvocation.MyCommand.Name
            Endpoint = $PSCmdlet.ParameterSetName
            Inputs   = Update-FieldName -Fields $Fields -Inputs $PSBoundParameters
            Format   = @{
                Body = @{
                    root = @('groups', 'id', 'value', 'comment')
                }
            }
        }
    }
    process {
        Invoke-Falcon @Param
    }
}
function Get-FalconSvExclusion {
<#
.Synopsis
Search for Sensor Visibility exclusions
.Description
Requires 'sensor-visibility-exclusions:read'.
.Parameter Ids
Sensor Visibility exclusion identifier(s)
.Parameter Filter
Falcon Query Language expression to limit results
.Parameter Sort
Property and direction to sort results
.Parameter Offset
Position to begin retrieving results
.Parameter Limit
Maximum number of results per request
.Parameter Detailed
Retrieve detailed information
.Parameter All
Repeat requests until all available results are retrieved
.Parameter Total
Display total result count instead of results
.Role
sensor-visibility-exclusions:read
.Example
PS>Get-FalconSvExclusion -Detailed

Return the first set of detailed results about Sensor Visibility exclusions.
#>
    [CmdletBinding(DefaultParameterSetName = '/policy/queries/sv-exclusions/v1:get')]
    param(
        [Parameter(ParameterSetName = '/policy/entities/sv-exclusions/v1:get', Mandatory = $true, Position = 1)]
        [ValidatePattern('^\w{32}$')]
        [array] $Ids,

        [Parameter(ParameterSetName = '/policy/queries/sv-exclusions/v1:get', Position = 1)]
        [string] $Filter,

        [Parameter(ParameterSetName = '/policy/queries/sv-exclusions/v1:get', Position = 2)]
        [ValidateSet('applied_globally.asc', 'applied_globally.desc', 'created_by.asc', 'created_by.desc',
            'created_on.asc', 'created_on.desc', 'last_modified.asc', 'last_modified.desc', 'modified_by.asc',
            'modified_by.desc', 'value.asc', 'value.desc')]
        [string] $Sort,

        [Parameter(ParameterSetName = '/policy/queries/sv-exclusions/v1:get', Position = 3)]
        [ValidateRange(1,500)]
        [int] $Limit,

        [Parameter(ParameterSetName = '/policy/queries/sv-exclusions/v1:get', Position = 4)]
        [int] $Offset,

        [Parameter(ParameterSetName = '/policy/queries/sv-exclusions/v1:get')]
        [switch] $Detailed,

        [Parameter(ParameterSetName = '/policy/queries/sv-exclusions/v1:get')]
        [switch] $All,

        [Parameter(ParameterSetName = '/policy/queries/sv-exclusions/v1:get')]
        [switch] $Total
    )
    begin {
        $Param = @{
            Command  = $MyInvocation.MyCommand.Name
            Endpoint = $PSCmdlet.ParameterSetName
            Inputs   = $PSBoundParameters
            Format   = @{
                Query = @('sort', 'ids', 'offset', 'filter', 'limit')
            }
        }
    }
    process {
        Invoke-Falcon @Param
    }
}
function New-FalconSvExclusion {
<#
.Synopsis
Create sensor visibility exclusions
.Description
Requires 'sensor-visibility-exclusions:write'.
.Parameter Value
RegEx pattern value
.Parameter GroupIds
Host group identifier(s) or 'all'
.Parameter Comment
Audit log comment
.Role
sensor-visibility-exclusions:write
.Example
PS>New-FalconSvExclusion -Value '/foo' -GroupIds all -Comment 'creating'

Create a Sensor Visibility exclusion with the value '/foo' and assign it to all hosts in your CID.
#>
    [CmdletBinding(DefaultParameterSetName = '/policy/entities/sv-exclusions/v1:post')]
    param(
        [Parameter(ParameterSetName = '/policy/entities/sv-exclusions/v1:post', Mandatory = $true, Position = 1)]
        [string] $Value,

        [Parameter(ParameterSetName = '/policy/entities/sv-exclusions/v1:post', Mandatory = $true, Position = 2)]
        [ValidatePattern('^(\w{32}|all)$')]
        [array] $GroupIds,

        [Parameter(ParameterSetName = '/policy/entities/sv-exclusions/v1:post', Position = 3)]
        [string] $Comment
    )
    begin {
        $Fields = @{
            GroupIds = 'groups'
        }
        $Param = @{
            Command  = $MyInvocation.MyCommand.Name
            Endpoint = $PSCmdlet.ParameterSetName
            Inputs   = Update-FieldName -Fields $Fields -Inputs $PSBoundParameters
            Format   = @{
                Body = @{
                    root = @('groups', 'value', 'comment')
                }
            }
        }
    }
    process {
        Invoke-Falcon @Param
    }
}
function Remove-FalconSvExclusion {
<#
.Synopsis
Delete Sensor Visibility exclusions
.Description
Requires 'sensor-visibility-exclusions:write'.
.Parameter Ids
Sensor Visibility exclusion identifier(s)
.Parameter Comment
Audit log comment
.Role
sensor-visibility-exclusions:write
.Example
PS>Remove-FalconSvExclusion -Ids <id>, <id>

Delete Sensor Visibility exclusions <id> and <id>.
#>
    [CmdletBinding(DefaultParameterSetName = '/policy/entities/sv-exclusions/v1:delete')]
    param(
        [Parameter(ParameterSetName = '/policy/entities/sv-exclusions/v1:delete', Mandatory = $true, Position = 1)]
        [array] $Ids,

        [Parameter(ParameterSetName = '/policy/entities/sv-exclusions/v1:delete', Position = 2)]
        [string] $Comment
    )
    begin {
        $Param = @{
            Command  = $MyInvocation.MyCommand.Name
            Endpoint = $PSCmdlet.ParameterSetName
            Inputs   = $PSBoundParameters
            Format   = @{
                Query = @('ids', 'comment')
            }
        }
    }
    process {
        Invoke-Falcon @Param
    }
}