class UsersController < ApplicationController
    before_action :set_user

    def index
        @users = User.all
    end

    def show
        
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            set_session(@user.id)
            flash[:message] = "Account successfully created."
            redirect_to user_path(@user)
        else
            render :new
        end
    end
end
