class Tweet < ActiveRecord::Base

  belongs_to :user

  attr_accessible :content, :user_id

	has_many :retweets, :class_name => "Tweet", :foreign_key => "retweet_id"
	belongs_to :original_tweet, :class_name => "Tweet", :foreign_key => "retweet_id"

  validates :content, :length => { :maximum => 140 }
  validates :content, :presence => true
  
  validates :user_id, :presence => { :presence => true, :message => "Can not find user name" }

  scope :tweets, includes(:user).order("created_at DESC")
  scope :timeline_for, lambda { |users| where(user_id: users) }

  def retweet?
		self.original_tweet.present?
  end
end
