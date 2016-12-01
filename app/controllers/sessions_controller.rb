class SessionsController < ApplicationController
  def index
    @message = flash[:message]
  end

  def signUp
    @message = flash[:message]
  end

  def signout
    session[:currentUser] = nil
    redirect_to '/'
  end

  def login
    printf(params[:user][:email]+"AA#########")
    user = User.where(email: params[:user][:email], password: params[:user][:password]).first

    if user == nil
      flash[:message] = "Usuario o contraseña invalidos"
      redirect_to '/login'
      return
    end

    session[:currentUser] = user.id
     redirect_to '/'
  end

  def create

    begin
    user = User.new(params[:user].permit!)
    user.save
    rescue Exception => ex
      flash[:message] = "Correo duplicado"
      flash[:user] = user
      redirect_to '/signup'
      return
    end

    session[:currentUser] = user.id
    redirect_to '/'
  end
end
