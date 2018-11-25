class WelcomeController < ApplicationController
    before_action :current_user

    def home
        @current_user ||= current_user
    end
end