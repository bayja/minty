#encoding: utf-8

require "spec_helper"

describe ApplicationHelper do
	helper ApplicationHelper

	it '현재 사용자의 배경 이미지 URL을 가져온다.' do
		user = stub(:user, id: 3)
		background_url_for_user(user).should == "/design_image/#{user.id}"
	end
end