# ./lib/event_manager.rb
require "csv"
require './lib/attendee'
require './lib/event_manager'
puts "EventManager initialized."
#  contents = File.read "event_attendees.csv"
#  puts contents

# lines = File.readlines "event_attendees.csv"

# lines.each_with_index do |line, index|
#   next if index == 0
#   columns = line.split(',')
#   name = columns[2]
#   puts name
# end
require 'csv'


puts "EventManager initialized."
class EventManager
  attr_reader :attendees
  content = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

  def initialize
    @attendees = []
  end

  def add_attendee(content)
    contents.each do |row|
      first_name = row[:first_name]
      last_name = row[:last_name]
      zipcode = row[:zipcode]
      id = id
      @attendees << attendee = Attendee.new(id, first_name, last_name, zipcode)
    end
    require 'pry'; binding.pry
  end
end
  