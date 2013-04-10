class HashTagsController < ApplicationController
	def heaven
		@tweets = Tweet.with_hash_tag("heaven")
	end
end