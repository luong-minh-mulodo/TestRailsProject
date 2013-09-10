class UserMailer < ActionMailer::Base

  default :from => "sendmailrails@gmail.com"   # Enter your email username here
  #    mail(:to => "luongcamminh1989@gmail.com", :subject => "kiki", :body => "ko co ju")  
    
  def SendMail(mail)   
#    mail(:to => "luongcamminh1989@gmail.com", :subject => "yenddn", :body => "yen dd") 
#  puts "aa #{mail["to"]} "
    attachments["img01.jpg"] = File.read("#{Rails.root}/public/image/img01.jpg")
    mail(:to =>mail["to"], :subject => mail["subject"], :body => mail["body"]) # we use mail as parameter because we create scaffold as Mail eairlier
  end
end
