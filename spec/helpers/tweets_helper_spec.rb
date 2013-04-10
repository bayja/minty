#encoding: utf-8

require "spec_helper"

describe TweetsHelper do
	helper TweetsHelper
	
	it '컨텐츠에서 해시태크를 가져온다.' do
		content = "안녕하세요 #heaven #test #heaven 입니다."
		hash_tags(content).should == ["#heaven", "#test", "#heaven"]
	end
	
	it '해시태그에 링크를 달아준다.'
end