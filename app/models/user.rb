# encoding: utf-8
class User < ActiveRecord::Base
  # validates :name, :presence => true
  # validates :name, :length => {:minimum => 4, :maximum =>40}
  # validates :name, :uniqueness => true

  def save(*)
    return false if name_blank?
    return false unless valid_length?
    return false unless unique_name?

    super
    true
  end

  def name_blank?
    if name.blank?
      errors.add(:name, "이름은 필수항목입니다.")
      true
    end
  end

  def valid_length?
    if (name.length >= 4 and name.length <= 40)
      true
    else
      errors.add(:name, "길이가 잘못되었어요.")
      false
    end
  end

  def unique_name?
    if User.where(name: name).count == 0
      true
    else
      errors.add(:name, "이름은 중복되면 안됩니다.")
      false
    end
  end














  attr_accessible :name, :description, :admin, :address, :email, :phone, :password, :password_confirmation

  # has_secure_password

  has_many :tweets, order: "created_at desc"

  has_many :favorites
  has_many :favorite_tweets, :through => :favorites, :source => :tweet

  has_and_belongs_to_many :followings,
                          :class_name => 'User',
                          :join_table => 'users_have_followings',
                          :foreign_key => 'user_id',
                          :association_foreign_key => 'following_id',
                          :uniq => true
  # has_many :follow_as_follower, foreign_key: 'user_id', class_name: 'Follow'
  # has_many :follow_as_following, foreign_key: 'following_id', class_name: 'Follow'

  # has_many :followers, through: :follow_as_follower
  # has_many :followings, through: :follow_as_following
  # # has_many  :followings,
  #           :through => :followings,
  #           :source => :user

  has_and_belongs_to_many :followers,
                          :class_name => 'User',
                          :join_table => 'users_have_followings',
                          :foreign_key => 'following_id',
                          :association_foreign_key => 'user_id',
                          :uniq => true

  # validates :name, :uniqueness => true
  # validates :name, :presence => true
  # validates :name, :length => {:minimum => 4, :maximum =>40}
  # validates :name, :format => { :with => /^[a-zA-Z0-9_]+$/,
  #   :message => "Only letters and digit and underbar allowed" }

  # validates :phone, :format => { :with => /^[0-9]{3,}\-[0-9]{3,}\-[0-9]{4,}$/ }

  # validates :email, :format => { :with => /^[a-zA-Z0-9_]+\@[a-zA-Z0-9_]+\.[a-zA-Z0-9_]+.[a-zA-Z0-9_]*$/ }

  # validates :password, :presence => true
  # validates :password, :length => {:minimum => 6, :maximum =>12}
  # validate :check_following_in_my_id

  # def check_following_in_my_id
  #   if self.followings.include? self
  #     errors.add(:followings, "Cannot follow me")
  #   end
  # end

  def me_and_followings
    self.followings+[self]
  end

  def add_to_favorites(tweet)
    favorite_tweets << tweet
  end

  def self.search(search)
    if search
      where("name like ?", "%#{search}%")
    end
  end
end
