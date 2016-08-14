class CreateListSubscribers < ActiveRecord::Migration[5.0]
  def change
    create_table :list_subscribers do |t|
      t.integer :list_id
      t.integer :user_id

      t.timestamps
    end
    add_index :list_subscribers, :list_id
    add_index :list_subscribers, :user_id
    add_index :list_subscribers, [:list_id, :user_id], unique: true
  end
end
