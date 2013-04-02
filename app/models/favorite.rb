class Favorite < ActiveRecord::Base
  attr_accessible :tweet_id, :user_id

  belongs_to :tweet
  belongs_to :user

  validates :user_id, uniqueness: {scope: :tweet_id}
end
