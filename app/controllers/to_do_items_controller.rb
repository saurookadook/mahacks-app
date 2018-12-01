class ToDoItemsController < ApplicationController
    before_action :set_user!, :current_user
    before_action :set_to_do_item, only: [:edit, :update, :destroy]

    def index
        if current_user
            @to_do_items = current_user.to_do_items
            @to_do_items ||= ToDoItem.all
        else
            redirect_to new_user_registration_path
        end
    end

    def new
        if current_user
            @to_do_item = ToDoItem.new
        else
            redirect_to new_user_registration_path
        end 
    end

    def create
        @to_do_item = ToDoItem.new(to_do_item_params)
        if @to_do_item.valid?
            @to_do_item.user = current_user
            @to_do_item.save
            redirect_to user_to_do_items_path(current_user)
        else
            flash[:message] = "There was an issue adding the item to your to-do list. Please make sure that both fields have at least 3 characters."
            render :new
        end
    end

    def edit
    end

    def update
        # binding.pry
        @to_do_item.update(to_do_item_params)
        if @to_do_item.valid?
            flash[:message] = "Task updated!"
            redirect_to user_to_do_items_path(current_user)
        else
            flash[:message] = "There's been a problem updating your task. Please try again!"
            render :edit
        end
    end

    def destroy
        @to_do_item.destroy
        flash[:message] = "Task deleted!"
        redirect_to user_to_do_items_path(current_user)
    end

    private

    def to_do_item_params
        params.require(:to_do_item).permit(:task, :description, :user_id)
    end

    def set_to_do_item
        @to_do_item ||= ToDoItem.find(params[:id]) if params[:id]
    end
end
