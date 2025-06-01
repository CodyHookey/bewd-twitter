class AddingUserIdToTweets < ActiveRecord::Migration[7.2]
  def change
    add_belongs_to :tweets, :user
  end
end
