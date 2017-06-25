function MatlabSendMail(subject, content, RecipientsAddress, Attachments,SenderAddress,SenderPassword)
% This function sends an E-mail from the SenderAddress to the RecipientsAddress.
% It is based on the Mablab function: sendmail().
% Form: MatlabSendMail(subject, content, RecipientsAddress, Attachments,SenderAddress,SenderPassword)
% Input:
%  subject: subject of the mail. Default: 'subjectTest(FromMatlab)'
%  content: content of teh mail. Default: 'contentTest(FromMatlab)'
%  RecipientsAddress: target address of mail. 
%  Attachments: data path of attachments. For example, ['./filename.txt']
%  SenderAddress: sender address of mail.
%  SenderPassword: password of sender address

%%
if nargin < 6 || isempty(SenderPassword)
    str = ['Please input the SenderPassword:'];
    disp(str);
    return;
end
if nargin < 5 || isempty(SenderAddress)
    str = ['Please input the SenderAddress:'];
    disp(str);
    return;
end
if nargin < 4
    Attachments = [];
end
if nargin < 3 || isempty(RecipientsAddress)
    RecipientsAddress = SenderAddress;
end
if nargin < 2 || isempty(content)
    content = 'contentTest(FromMatlab)';
end
if nargin < 1 || isempty(subject)
    subject = 'subjectTest(FromMatlab)';
end

%% SMTP_Server Get
ind = find( SenderAddress == '@', 1);
temp = SenderAddress(ind+1:end);
FieldName = temp;
SMTP_Server = ['smtp.',FieldName];

str = ['SMTP_Server = ',SMTP_Server];
disp(str);
disp('Try to send the E-mail...');
%% send E-mail
DateTime = datestr(now,'yyyy-mm-dd HH:MM:SS');
try
    setpref('Internet','SMTP_Server',SMTP_Server); %SMTP server, set the smtp of your E-mail address
    setpref('Internet','E_mail',SenderAddress);
    setpref('Internet','SMTP_Username',SenderAddress);
    setpref('Internet','SMTP_Password',SenderPassword);
    props = java.lang.System.getProperties;
    props.setProperty('mail.smtp.auth','true');
% %     props.setProperty('mail.smtp.socketFactory.class','javax.net.ssl.SSLSocketFactory');
% %     props.setProperty('mail.smtp.socketFactory.port','465');
    if isempty(Attachments)
        sendmail(RecipientsAddress, subject, [content  char(10) char(10) 'Sent at ' DateTime]);
    else
        sendmail(RecipientsAddress, subject, [content  char(10) char(10) 'Sent at ' DateTime], Attachments);
    end
    % sendmail(recipients,subject,message,attachments)
    
    disp(['*********** OK, E-mail Sent sucessfully at ',DateTime ,'****************']);
catch err
    str = ['Exceptions occur!'];
    disp(str);
    for i = 1:size(err.stack,1)
        StrTemp = ['FunName:',err.stack(i).name,' Line:',num2str(err.stack(i).line)];
        disp(StrTemp);
    end
    disp('*********** Sorry, E-mail sent failed! *****************')
end

end
