module TweetsHelper
	def add_link_to_hash_tag(content)
	end

	def hash_tags(content)
		hash_tags = content.scan(/#(\w+)/).flatten.map do |tag|
			"#" + tag
	  end
	end
end
