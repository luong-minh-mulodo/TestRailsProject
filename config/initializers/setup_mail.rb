ActionMailer::Base.smtp_settings = {
 
:address =>"smtp.gmail.com",
 
:port =>587,
 
:domain =>"gmail.com",
 
:user_name =>"sendmailrails",      # only username enough
 
:password =>"mail12345",                   # Enter your mail_id password
 
:authentication =>"plain",
 
:enable_starttls_auto =>true
 
}