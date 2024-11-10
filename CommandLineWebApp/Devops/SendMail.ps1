param (
    [string]$pathToFile
)

$EmailTo = 'Marco.Lopes@nexus-ag.de'
$EmailFrom = "azurebot@alemaes.de"
$Subject = "Webservice Docs" 
$Body = "
Your webservice has been deployed
"
Write-Output $pathToFile

$SMTPServer = "w0139d43.kasserver.com"
$SMTPPort = 587 # Port for TLS
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom, $EmailTo, $Subject, $Body)
$attachment = New-Object System.Net.Mail.Attachment($pathToFile)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, $SMTPPort)
$SMTPClient.EnableSsl = $true # Enable SSL for TLS
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential($EmailFrom, $env:EmailPassword)
Write-Output $Body
$SMTPClient.Send($SMTPMessage)
