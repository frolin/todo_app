class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :todo_list, index: true
      t.text :content

      t.timestamps null: false
    end
    add_foreign_key :tasks, :todo_lists
  end
end
