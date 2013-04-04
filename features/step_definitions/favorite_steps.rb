#encoding: utf-8

Given(/^트윗이 있다\.$/) do
	@tweet = Tweet.create! content:"test"
end

Given(/^사용자가 있다\.$/) do
  @user = User.create! name: "tester"
end

When(/^좋아요 버튼을 누른다\.$/) do
	@user.add_to_favorites @tweet
end

Then(/^사용자의 좋아요 목록에 좋아한 트윗이 보인다\.$/) do
  pending "@user.favorites.should.include? @tweet"
end