
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")
$headers.Add("Authorization", "Basic YWRtaW46UEBzc3dvcmQ2NVBAc3N3b3JkNjU=")

$body = @"
{
  `"description`": `"GIMS 2.0 - Full Blocked`",
  `"display_name`": `"Rule1",
  `"sequence_number`": 1,
  `"source_groups`": [
      `"/infra/domains/default/groups/webgroup`"
  ],
  `"logged`": false,
  `"destination_groups`": [
      `"/infra/domains/default/groups/InternetBlocked`"
  ],
  `"scope`": [
      `"ANY`"
  ],
  `"action`":`"ALLOW`",
`"disabled`":true,
  `"services`": [
      `"ANY`"
  ]
}
"@

$response = Invoke-RestMethod -SkipCertificateCheck 'https://fhlabnsx-t01.fairlesshillslab.local/policy/api/v1/infra/domains/default/security-policies/Maintest/rules/Rule1' -Method 'PUT' -Headers $headers -Body $body
$response | ConvertTo-Json