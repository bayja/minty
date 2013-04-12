# encoding: utf-8

class User < ActiveRecord::Base
  # validates :name, :presence => true
  # validates :email, :presence => true
  # validates :name, :length => {:minimum => 4, :maximum =>40}
  # validates :name, :uniqueness => true

  def save(*)
    validates_presence_of :name
    validates_presence_of :email
    validates_length_of :name, {:minimum => 4, :maximum =>40}
    validates_uniqueness_of :name

    if errors.keys.count == 0
      super
      true
    else
      false
    end
  end

  def validates_presence_of(key)
    if send(key).blank?
      errors.add(key, "이름은 필수항목입니다.")
    end
  end

  def validates_length_of(key, options)
    val = send(key).to_s
    if !(val.length >= options[:minimum] and val.length <= options[:maximum])
      errors.add(key, "길이가 잘못되었어요.")
    end
  end

  def validates_uniqueness_of(key)
    query_options = { key => send(key) }
    if User.where( query_options ).count != 0
      errors.add(key, "#{key}: 중복되면 안됩니다.")
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
