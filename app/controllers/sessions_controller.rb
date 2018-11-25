class SessionsController < ApplicationController

    def new
      @user = User.new
    end
  
    def create
      if @user = User.find_by(username: user_params[:username])
        if @user.authenticate(user_params[:password])
          finalize_login(@user)
        end
      else
        render :new
      end
    end
  
    def destroy
      session.delete :user_id if !session[:user_id].nil?
      flash[:message] = "You have successfully logged out."
      redirect_to :root
    end
  
    private
  
    def finalize_login(user)
      set_session(user.id)
      flash[:message] = "Successfully logged in!"
      redirect_to :root
    end
  end
  