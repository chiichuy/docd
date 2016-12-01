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

    user = User.find(session[:currentUser])
    print("#####")
    print(user.sucursals.count())
    print("#######")
    @user = user
  end
end
