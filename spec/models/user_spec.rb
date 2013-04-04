# encoding: utf-8

require 'spec_helper'
describe User do
	let(:user) { User.create! name:'tester' }
	let(:tweet) { Tweet.create! content: 'test content' }
	it 'should add tweet to my favorites list' do
		user.add_to_favorites tweet
		user.favorite_tweets.should include(tweet)
	end

end