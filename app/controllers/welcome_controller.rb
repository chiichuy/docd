class WelcomeController < ApplicationController
  def index
    # session[:currentUser] = nil

    if !self.isSessionValid(session[:currentUser])
      redirect_to '/login'
      return
    end

    redirect_to '/home'
  end

  def isSessionValid(ses)
    if ses == nil
      return false
    end
    return true
  end


  def checkSession

  end

  def home
    if !self.isSessionValid(session[:currentUser])
      redirect_to '/login'
      return
    end


    begin
      user = User.find(session[:currentUser])
    rescue Exception => ex
      session[:currentUser] = nil
      redirect_to '/'
      return
    end

    print("#####")
    print(user.sucursals.count())
    print("#######")
    @user = user
  end
end
