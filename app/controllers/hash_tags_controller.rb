class HashTagsController < ApplicationController
	def with_tag
		@tweets = Tweet.with_hash_tag(params[:hash_tag])
	end
end