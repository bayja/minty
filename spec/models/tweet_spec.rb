# encoding: utf-8
require "spec_helper"

describe Tweet do
	context 'hash tag' do
		it 'hash tag가 있으면 읽을 수 있다.' do
			tweet = Tweet.create(content: "test#minty#heaven end")
			tweet.hash_tags.should == ["minty", "heaven"]
		end

		it 'hash tag가 없으면 안 읽는다' do
			tweet = Tweet.create(content: "test #heaven end")
			tweet.hash_tags.should == []			
		end

		it 'hash tag를 가지고 있는 트윗을 모아볼 수 있다.' do
			user = User.create!(name: "tester", phone: "010-0000-1111", email: "heaven@wangsy.com")
			tweet01 = Tweet.create(content: "test01 #heaven end", user_id: user.id)
			tweet02 = Tweet.create(content: "test02 #heaven end", user_id: user.id)
			tweet03 = Tweet.create(content: "test03 end", user_id: user.id)

			Tweet.with_hash_tag("heaven").should == [tweet02, tweet01]
		end
	end
end