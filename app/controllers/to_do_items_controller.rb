class ToDoItemsController < ApplicationController
    before_action :set_to_do_item, only: [:show, :edit, :update]

    def index
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
            @to_do_item.save
            redirect_to to_do_items_path
        else
            flash[:message] = "There was an issue adding the item to your to-do list. Please make sure that both fields have at least 3 characters."
            render :new
        end
    end

    def edit
    end

    def update
        @to_do_item.update(to_do_item_params)
        if @to_do_item.valid?
            @to_do_item.save
            flash[:message] = "Task ID number #{@to_do_item.id} has been successfully updated!"
        else
            flash[:message] = "There's been an issue updating this task. Please try again."
            render :edit
        end
    end

    def destroy
        @to_do_item.destroy
        flash[:message] = "Task successfully removed."
        redirect_to :root
    end

    private

    def to_do_item_params
        params.require(:to_do_item).permit(:task, :description, :user_id)
    end

    def set_to_do_item
        @to_do_item ||= ToDoItem.find(params[:id]) if params[:id]
    end
end
