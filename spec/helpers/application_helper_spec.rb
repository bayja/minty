# encoding: utf-8

require "spec_helper"

# require_relative '../../app/helpers/application_helper'
# include ApplicationHelper

describe ApplicationHelper do
	it '관리자만 볼 수 있다.' do
		admin_user = stub(:user, "admin?" => true)
		only_for_admin(admin_user) do
			"abc"
		end.should == "abc"
	end

	it '관리자가 아니면 될 수 없다.' do
		normal_user = stub(:user, "admin?" => false)
		only_for_admin(normal_user) do
			"abc"
		end.should == nil
	end

	context "Design Image" do
		it '현재 사용자의 배경 이미지 URL을 가져온다.' do
			user = stub(:user, id: 3)
			background_url_for_user(user).should == "/design_image/#{user.id}"
		end
	end

end