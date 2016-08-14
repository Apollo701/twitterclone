class CreateRetweets < ActiveRecord::Migration[5.0]
  def change
    create_table :retweets do |t|
      t.integer :tweet_id
      t.integer :retweeter_id

      t.timestamps
    end
    add_index :retweets, :tweet_id
    add_index :retweets, :retweeter_id
    add_index :retweets, [:tweet_id, :retweeter_id], unique: true
  end
end
