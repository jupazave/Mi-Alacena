module BlogHelper

	def markdown post
		RDiscount.new(post.body).to_html.html_safe
	end

	def markdown_preview post
		RDiscount.new(post.preview).to_html.html_safe
	end
end
