Import-Module dbatools;
Import-Module ExcelPSLib;

$credential = Get-Credential;
# get results from table 
$result= Invoke-DbaQuery -SQLInstance localhost -Database master -Query "SELECT * FROM sys.tables" -SqlCredential $credential ;
# debug the output
$result | Out-GridView

# export to excel
$result | Export-OOXML -FileFullPath test.xlsx -WorksheetName test -AutoFit -HeaderStyle WhiteSmoke