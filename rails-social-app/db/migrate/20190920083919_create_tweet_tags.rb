class CreateTweetTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tweet_tags do |t|
      t.references :tweet, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
