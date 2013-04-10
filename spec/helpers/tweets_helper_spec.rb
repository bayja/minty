#encoding: utf-8

require "spec_helper"

describe TweetsHelper do
	helper TweetsHelper

	let(:content) { "안녕하세요 #heaven #test #heaven 입니다." }
	
	it '컨텐츠에서 해시태크를 가져온다.' do
		hash_tags(content).should == ["#heaven", "#test", "#heaven"]
	end
	
	it '해시태그에 링크를 달아준다.' do
		source = "안녕하세요 #heaven 입니다."
		result = "안녕하세요 <a href='/hash_tags/heaven'>#heaven</a> 입니다."
		add_link_to_hash_tags(source).should == result
	end
end