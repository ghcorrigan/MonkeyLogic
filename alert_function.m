function alert_function(hook,MLConfig,TrialRecord)
% Edit this function and make ML2 alert you at folliwing events.

% Email
% 1. Run these commands on the MATLAB command window. Change the email
%   address and password accordingly.
%
%   setpref('Internet','E_mail','my_email@example.com');
%   setpref('Internet','SMTP_Server','my_server.example.com');
%   props = java.lang.System.getProperties;
%   props.setProperty('mail.smtp.auth','true');
%   setpref('Internet','SMTP_Username','myaddress@example.com');
%   setpref('Internet','SMTP_Password','mypassword');
%
% 2. Add the following sendmail command in the switch statement below.
%
%   sendmail('my_email@example.com','Task done', ...
%       'This message is sent from ML2.');

% Slack
% 1. Configure an Incoming Webhooks at https://slack.com/services/new/incoming-webhook
% 2. Copy the Webhook URL once the service is configured, and store it as a
%   MATLAB string.
%
%   strHookURL = 'https://hooks.slack.com/services/T83J0FY9Y/B83NX6F....';
% 
% 3. Call SendSlackNotification() in the switch statement below. For the
%    syntax details, type 'help SendSlackNotification' on the MATLAB
%    command window.
%
%   SendSlackNotification(strHookURL,'Task done. This message is sent from ML2');
%
% 4. You can use Slack attachments to display rich content. See the
%   comments in MakeSlackAttachment or type 'help MakeSlackAttachment'.
%
% 5. This Slack integration depends on Dylan Muir's SlackMatlab code. For
%   more information, visit https://github.com/DylanMuir/SlackMatlab

switch hook
    case 'task_start'
        
    case 'block_start'
        
    case 'trial_start'
        
    case 'trial_end'
        
    case 'block_end'
        
    case 'task_end'

    case 'task_paused'

    case 'task_resumed'
        
    case 'task_aborted'  % in case that the task stopped with an error
end

end
