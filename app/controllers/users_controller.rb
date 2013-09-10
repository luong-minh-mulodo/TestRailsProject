class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create,:login]
    
  def index
#    if session[:auth].nil?
#      redirect_to :action => 'login'
#    else
#      flash[:home] = t(:home)
      @users = User.all
#      @username = cookies[:username]
      @username = session[:auth][:name]

#    end

  end

  def show
    @users = User.find_by_id(params[:id])
  end

  def login
    @error = nil
    if session[:auth].nil?      
      if params[:users].nil?
          render 'users/login'  
        else
        @auth = User.authenticate(params[:users][:name],params[:users][:password])
        if @auth != nil
          puts "ki2 #{@auth[0]}"
          session[:auth] = @auth
          cookies[:username] = params[:users][:name]
          cookies[:password] = params[:users][:password]
          cookies[:remember] = 1
          @users = User.all
          redirect_to :action => 'index'
        else
        @error = { "Error" => "Because error"}
          render 'users/login'
    end
      end
    else
    @users = User.all
    redirect_to :action => 'index'
    end
  end
  
#def login
#    @error = nil
#    if session[:auth].nil?
#      if params[:users].nil?
#        render 'users/login'  
#      else
#        @auth = User.authenticate(params[:users][:name],params[:users][:password])
#        if !@auth.empty?
#          session[:auth] =  @auth[0]
#          cookies[:username] = params[:users][:name]
#          cookies[:password] = params[:users][:password]
#          cookies[:remember] = 1
#        @users = User.all
#        redirect_to :action => 'index'
#        else
#        @error = { "Error" => "Because error"}
##          @error = @auth.errors
#          render 'users/login'
#        end
#    end
#  
#    else
#    @users = User.all
#    redirect_to :action => 'index'
#    end
#  end
  
  def logout
    puts "logout"
    reset_session
    redirect_to :action => 'login'
#    render 'users/login'
  end
  
  def new
#    flash[:notice] = "You signed up successfully"
#            flash[:color]= "valid"
    if request.post?
      @error = nil
      @users = User.create(params.require(:users).permit(:name,:email,:password,:password_confirmation))
      if @users.save
        render 'users/show'
      else
        @error = @users.errors
        render 'users/new'
      end
    end
  end

  def edit
    @users = User.find_by_id(params[:id])

  end

  def update
    @error = nil
    if params[:user].nil?
      render 'users/edit'
    else
    @users = User.update(params[:id],params.require(:user).permit(:name,:email))
      if @users.valid?
        render 'users/show'
      else
        @error = @users.errors
        render 'users/edit'
      end
    end
  end

  def destroy
    @users = User.find_by_id(params[:id])
    if @users.destroy
      redirect_to @users
    end
  end
  
  
 
end