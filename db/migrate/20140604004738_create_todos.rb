class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.references :user, index: true
      t.text :content

      t.timestamps
    end
  end
end
