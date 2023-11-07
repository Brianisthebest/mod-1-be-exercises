# ./commentable.rb
module Commentable

  def next_comment_id
		if total_comments == 0
			total_comments + 1
		else
			comments.keys.last + 1
		end
	end

	def total_comments
		comments.count
	end

	def add_comment(comment)
		comments[next_comment_id] = comment
	end

	def remove_comment(id)
		comments.delete(id)
	end

  def display
    if self.instance_of?(Photo)
      display_string = "-" * 50 + "\n"
      display_string += "PHOTO" + "\n"
      display_string += "URL: #{image_source}" + "\n"
      display_string += "Caption: #{caption}" + "\n"
      comments.each do |id, text|
        display_string += "#{id}: #{text}" + "\n"
      end
      display_string += "-" * 50
      return display_string
    elsif self.instance_of?(StatusUpdate)
      display_string = "-" * 50 + "\n"
		  display_string += "STATUS UPDATE" + "\n"
		  display_string += "Body: #{body}" + "\n"
		  comments.each do |id, text|
			  display_string += "#{id}: #{text}" + "\n"
		  end
		  display_string += "-" * 50
    end
	end
end
