class CreateToDoItems < ActiveRecord::Migration[5.2]
  def change
    create_table :to_do_items do |t|
      t.string :task
      t.text :description

      t.timestamps
    end
  end
end
