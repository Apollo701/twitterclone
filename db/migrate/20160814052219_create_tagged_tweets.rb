class CreateTaggedTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tagged_tweets do |t|
      t.integer :tweet_id
      t.integer :tag_id

      t.timestamps
    end
    add_index :tagged_tweets, :tweet_id
    add_index :tagged_tweets, :tag_id
    add_index :tagged_tweets, [:tweet_id, :tag_id], unique: true
  end
end
