class RemoveNotesFromTodos < ActiveRecord::Migration[6.1]
  def change
    remove_column :todos, :notes, :text
  end
end
