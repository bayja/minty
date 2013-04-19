#encoding: utf-8

require_relative '../../app/helpers/users_helper'
include UsersHelper

describe UsersHelper do
  let(:user) {stub(:user, profile_thumb_image: "/images/fallback/default_profile.jpg")}

  it 'thumbnail 이미지를 만들어 준다.' do
    image_thumb_tag(user).should == "<img src='/images/fallback/default_profile.jpg' style='width: 100px; height: 100px'>"
  end

  it '썸네일 이미지를 만들어 준다2.' do
    user_thumb_image(user).should == ['/images/fallback/default_profile.jpg', {style: "width: 100px; height: 100px"}]
  end
end
