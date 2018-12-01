class ToDoItem < ApplicationRecord
    validates :task, :description, presence: :true
    validates :task, :description, length: { minimum: 3 }

    belongs_to :user
end
