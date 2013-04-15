class Tweet < ActiveRecord::Base

  belongs_to :user


  attr_accessible :content, :user_id, :retweet_count, :link

  has_many :retweets, :class_name => "Tweet", :foreign_key => "retweet_id"

  has_many :favorites
  has_many :favorite_users, :through => :favorites, :source => :user

  belongs_to :original_tweet, :class_name => "Tweet", :foreign_key => "retweet_id"

  validates :content, :length => { :maximum => 140 }
  validates :content, :presence => true
  
  validates :user_id, :presence => { :presence => true, :message => "Can not find user name" }

  before_save :add_http_to_image_url

  scope :tweets, includes(:user).order("created_at DESC")
  scope :timeline_for, lambda { |users| where(user_id: users) }

  def retweet?
    self.original_tweet.present?
  end

  def retweet(user)
    retweet = Tweet.new(content: "RT", user_id: user.id)
  
    if self.retweet?
      retweet.original_tweet = self.original_tweet
    else
      retweet.original_tweet = self
    end

    # retweet.original_tweet.retweet_count += 1
    retweet.original_tweet.retweet_count = retweet.original_tweet.retweet_count + 1

    retweet.original_tweet.save
    retweet.save
    retweet
  end

  def hash_tags
    content.scan(/#(\w+)/).flatten
  end

  def self.with_hash_tag(hash_tag)
    where("content LIKE ?", "%##{hash_tag}%").order('created_at DESC')
  end

  def self.find_many_retweets
    where('retweet_count > 0').order('retweet_count DESC')
  end
  
  def self.search(search)
    if search
      where("content like ?", "%#{search}%")
    end
  end

  def add_http_to_image_url
    if self.link.present?
      self.link = "http://#{link}" unless self.link.match(/^http/)
    end
  end
end
