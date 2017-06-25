# Send-Email-With-Matlab
A matlab function helps to send e-mail to you, which can work as a reminder of your program' status.

This function sends an E-mail from the SenderAddress to the RecipientsAddress.
It is based on the Mablab function: sendmail().

## Form: 
'MatlabSendMail(subject, content, RecipientsAddress, Attachments,SenderAddress,SenderPassword)'
## Arguments:
  subject: subject of the mail. Default: 'subjectTest(FromMatlab)'
  
  content: content of teh mail. Default: 'contentTest(FromMatlab)'
  
  RecipientsAddress: target address of mail. 
  
  Attachments: data path of  attachments.
  
  SenderAddress: source address of mail.
  
  SenderPassword: password of source address
