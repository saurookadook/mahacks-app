class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    protected

    def set_user!
        if params[:user_id]
            @user = User.find(params[:user_id])
        end
    end

    def set_session(user_id)
        session[:user_id] = user_id
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
