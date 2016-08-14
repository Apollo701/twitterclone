class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.integer :author_id

      t.timestamps
    end
    add_index :lists, :name
    add_index :lists, :author_id
    add_index :lists, [:name, :author_id], unique: true
  end
end
