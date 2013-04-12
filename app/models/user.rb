# encoding: utf-8

module MintyValidator
  class Base
    def initialize(key, base, options)
      @key = key
      @base = base
      @options = options
    end
  end

  class PresenceValidator < Base
    def validate
      if @base.send(@key).blank?
        @base.errors.add(@key, "이름은 필수항목입니다.")
      end
    end
  end

  class UniquenessValidator < Base
    def validate
      query_options = { @key => @base.send(@key) }
      if @base.class.where( query_options ).count != 0
        @base.errors.add(@key, "#{@key}: 중복되면 안됩니다.")
      end
    end
  end

  class LengthValidator < Base
    def validate
      val = @base.send(@key).to_s
      if @options[:minimum]
        unless val.length >= @options[:minimum]
          @base.errors.add(@key, "길이가 너무 짧아요.")
        end
      end

      if @options[:maximum]
        unless val.length <= @options[:maximum]
          @base.errors.add(@key, "길이가 너무 길어요.")
        end
      end
    end
  end

  class FormatValidator < Base
    def validate
      val = @base.send(@key).to_s
      unless val.match(@options[:with])
        @base.errors.add(@key, "잘못된 문자가 들어갔습니다.")
      end
    end
  end
end


class User < ActiveRecord::Base
  # validates :name, :presence => true
  # validates :email, :presence => true
  # validates :name, :length => {:minimum => 4, :maximum =>40}
  # validates :name, :uniqueness => true
  # validates :name, :format => { :with => /^[a-zA-Z0-9_]+$/


  def save(*)
    validates :name, presence: true
    validates :email, presence: true
    validates :name, uniqueness: true
    validates :name, length: {:minimum => 4, :maximum =>40}
    validates :name, :format => { :with => /^[a-zA-Z0-9_]+$/ }

    if errors.keys.count == 0
      super
      true
    else
      false
    end
  end

  def validates(key, options)
    validator_name = options.keys.first
    validator = "MintyValidator::#{validator_name.to_s.capitalize}Validator".constantize
    validator.new(key, self, options[validator_name]).validate
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
