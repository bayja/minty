class Tweet < ActiveRecord::Base

  belongs_to :user

  attr_accessible :content, :user_id

	has_many :retweets, :class_name => "Tweet", :foreign_key => "retweet_id"

	has_many :favorites
	has_many :favorite_users, :through => :favorites, :source => :user

	belongs_to :original_tweet, :class_name => "Tweet", :foreign_key => "retweet_id"

  validates :content, :length => { :maximum => 140 }
  validates :content, :presence => true
  
  validates :user_id, :presence => { :presence => true, :message => "Can not find user name" }

  scope :tweets, includes(:user).order("created_at DESC")
  scope :timeline_for, lambda { |users| where(user_id: users) }

  def retweet?
		self.original_tweet.present?
  end

  def hash_tags
    content.scan(/#(\w+)/).flatten
  end

  def self.with_hash_tag(hash_tag)
    order('created_at DESC').select do |tweet|
      tweet.hash_tags.include?(hash_tag)
    end
  end
end
