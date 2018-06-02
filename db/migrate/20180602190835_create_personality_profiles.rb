class CreatePersonalityProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :personality_profiles do |t|
      t.text :username
      t.integer :word_count
      t.string :warning_message
      t.string :error_message
      t.integer :total_tweets_analyzed
      t.string :newest_tweet_analyzed
      t.string :oldest_tweet_analyzed

      t.timestamps null: false
    end
  end
end
