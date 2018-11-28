class ToDoItemsController < ApplicationController
    before_action :set_to_do_item, only: [:edit, :update]

    def index
        @to_do_items = current_user.to_do_items
        @to_do_items ||= ToDoItem.all
    end

    def show
    end

    def new
        @to_do_item = ToDoItem.new
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
    end

    def destroy
    end

    private

    def to_do_item_params
        params.require(:to_do_item).permit(:task, :description, :user_id)
    end

    def set_to_do_item
        @to_do_item ||= ToDoItem.find(params[:id]) if params[:id]
    end
end
