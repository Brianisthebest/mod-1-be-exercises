# ./photo.rb
require './lib/commentable'

class Photo
	include Commentable

	attr_reader :image_source, :caption, :comments

	def initialize(image_source, caption)
		@image_source = image_source
		@caption = caption
		@comments = {}
	end
end
