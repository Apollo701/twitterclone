class CreateListMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :list_members do |t|
      t.integer :list_id
      t.integer :user_id

      t.timestamps
    end
    add_index :list_members, :list_id
    add_index :list_members, :user_id
    add_index :list_members, [:list_id, :user_id], unique: true
  end
end
