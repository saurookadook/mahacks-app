class ToDoItem < ApplicationRecord
    validates :task, :description, presence: :true
    validates :task, :description, length: { minimum: 3 }

    belong_to :user
end
