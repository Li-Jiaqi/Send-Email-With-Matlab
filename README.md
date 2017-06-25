# Send-Email-With-Matlab
  A matlab function which can helps to send e-mail to you, as a reminder of your program' status.

  This function sends an E-mail from the SenderAddress to the RecipientsAddress.
  It is based on the Mablab function: sendmail().

## Form: 
```Matlab
MatlabSendMail(subject, content, RecipientsAddress, Attachments,SenderAddress,SenderPassword)
```
## Arguments:
```Matlab
%  subject: subject of the mail. Default: 'subjectTest(FromMatlab)'
  
%  content: content of teh mail. Default: 'contentTest(FromMatlab)'
  
%  RecipientsAddress: target address of mail. 
  
%  Attachments: data path of attachments. For example, ['./filename.txt']
  
%  SenderAddress: sender address of mail.
  
%  SenderPassword: password of sender address
```
