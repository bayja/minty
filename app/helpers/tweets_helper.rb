module TweetsHelper
	def add_link_to_hash_tags(content)
		tags = hash_tags(content)
		tags.each do |tag|
			content.gsub!(tag, "<a href='/hash_tags/#{tag[1..-1]}'>#{tag}</a>")
		end
		raw content
	end

	def hash_tags(content)
		hash_tags = content.scan(/#(\w+)/).flatten.map do |tag|
			"#" + tag
	  end
	end


end
