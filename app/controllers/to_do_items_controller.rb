class ToDoItemsController < ApplicationController
    before_action :set_user, :current_user

    def index
        @to_do_items = ToDoItem.all
    end

    def new
        @to_do_item = ToDoItem.new
    end

    def create
        @to_do_item = ToDoItem.new(to_do_item_params)
        if @to_do_item.valid?
            @to_do_item.user = current_user
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
end
