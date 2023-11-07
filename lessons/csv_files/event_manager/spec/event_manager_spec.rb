require 'rspec'
require './lib/attendee'
require './lib/event_manager'
require 'csv'

RSpec.describe EventManager do
  before(:each) do
    # @content = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
    @event_manager = EventManager.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@event_manager).to be_a(EventManager)
      expect(@event_manager.attendees).to eq([])
    end
  end
  describe '#add_attendee' do
  @event_manager.add_attendee(@content)
  end
end