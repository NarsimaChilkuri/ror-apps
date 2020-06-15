class AddColumnToTweet < ActiveRecord::Migration[6.0]
  def change
  	add_column :tweets, :attachment, :string
  end
end
