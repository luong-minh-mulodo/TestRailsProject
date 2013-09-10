class SendMailsController < ApplicationController

  # GET /send_mails
  # GET /send_mails.json
  def index
 
    if request.post?      
      @send_mail = params[:send_mails]
      flash[:bug] = params[:send_mails][:to]
  if  check_params(@send_mail) == false
        flash[:bug] =  "Error param" 
        render 'send_mails/index'  
       
      else
#        flash[:bug] =  "full"
        UserMailer.SendMail(@send_mail).deliver
        redirect_to users_url :action => 'users/index'
      end
    end
  end
  
#  def update
#    flash[:bug] = "vo create"
#  
##        @send_mail = params[:send_mails]
#        if @send_mail.values == nil
#          flash[:bug] =  "empty"
#          render 'send_mails/index'  
#         
#        else
#          flash[:bug] =  "full"
#  #        UserMailer.SendMail(@send_mail).deliver
#  #        redirect_to users_url :action => 'users/index'
#        end
#  end

  private 
  def check_params param
    param.each do |x,y|
      if  x == "to"
        if is_a_valid_email?(y) == false
          return false
        end
      end
   
        if y == ""
          return false
        end
        
    end
    return true
  end
  
  def is_a_valid_email?(email)
    # Check the number of '@' signs.
    if email.count("@") != 1 then
      return false
  
    # We can now check the email using a simple regex.
    # You can replace the TLD's at the end with the TLD's you wish
    # to accept.
    elsif email =~ /^.*@.*(.com|.org|.net)$/ then
      return true
    else
      return false
    end
  end
 
end
