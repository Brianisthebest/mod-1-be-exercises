# ./status_update.rb
require './lib/commentable'

class StatusUpdate
	include Commentable

	attr_reader :body, :comments

	def initialize(body)
		@body = body
		@comments = {}
	end
end
