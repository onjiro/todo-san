class AddDoneToTodos < ActiveRecord::Migration
  def change
    change_table :todos do |t|
      t.boolean :done, null: false, default: false
    end
  end
end
