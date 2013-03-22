class User < ActiveRecord::Base
  attr_accessible :name, :description

  has_many :tweets

  has_and_belongs_to_many :followings,
                          :class_name => 'User',
                          :join_table => 'users_have_followings',
                          :foreign_key => 'user_id',
                          :association_foreign_key => 'following_id',
                          :uniq => true

  has_and_belongs_to_many :followers,
                          :class_name => 'User',
                          :join_table => 'users_have_followings',
                          :foreign_key => 'following_id',
                          :association_foreign_key => 'user_id',
                          :uniq => true

  validates :name, :uniqueness => true
  validates :name, :presence => true
  validates :name, :length => {:minimum => 4, :maximum =>40}
  validates :name, :format => { :with => /^[a-z0-9_]+$/,
    :message => "Only letters and digit and underbar allowed" }

end
