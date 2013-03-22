class Tweet < ActiveRecord::Base

  belongs_to :user

  attr_accessible :content, :user_id

  validates :content, :length => { :maximum => 140 }
  validates :content, :presence => true
  
  validates :user_id, :presence => { :presence => true, :message => "Can not find user name" }

  scope :tweets, includes(:user).order("created_at DESC")
end
