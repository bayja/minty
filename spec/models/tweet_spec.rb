# encoding: utf-8

require 'spec_helper'

describe Tweet do
	it '의 컨텐츠의 길이는 140자까지 된다.' do
		content = 'a' * 140
		tweet = Tweet.new(content: content)
		tweet.should be_valid
	end

	it '컨텐츠가 반드시 존재하여야 한다.' do
		tweet = Tweet.new(content: nil)
	 	tweet.should_not be_valid
	 	tweet.errors.should include(:content)
	 	tweet.errors[:content].should include("can't be blank")
	 	# tweet.errors.keys.should include(:content)
	 	# tweet.errors.values.should include(["can't be blank"])
	end

	it '은 작성자가 존재해야 한다.' do
		tweet = Tweet.new
		tweet.content = "aaaa"
		tweet.user = nil
		tweet.should_not be_valid
		tweet.errors.should include(:user_id)
	 	tweet.errors[:user_id].should include("Can not find user name")
	end

	it '을 하면 원본 트윗글의 리트윗이 된다.' do
		user1 = User.new()
		user1.save(validate: false)

		user2 = User.new()
		user2.save(validate: false)

		tweet1 = user1.tweets.build(content: "Test Tweet")
		tweet1.save

		tweet2 = tweet1.retweet(user2)

		tweet2.original_tweet.should == tweet1
	end

	it '을 하면 리트윗의 리트윗을 하더라도 원본글은 같다.' do
		user1 = User.new()
		user1.save(validate: false)

		tweet1 = user1.tweets.build(content: "원본")
		tweet1.save

		tweet2 = tweet1.retweet(user1)
		tweet3 = tweet2.retweet(user1)

		tweet3.original_tweet.should == tweet2.original_tweet
	end

end