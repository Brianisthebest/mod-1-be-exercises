require 'csv'
require 'pry'

class Name
  attr_reader :year, :bio_gender, :ethnicity, :name, :count, :rank
  @@filename = 'Popular_Baby_Names.csv'

  def initialize(data)
    require 'pry'; binding.pry
    @year = data[:year_of_birth]
    @bio_gender = data[:gender]
    @ethnicity = data[:ethnicity]
    @name = data[:name]
    @count = data[:count]
    @rank = data[:rank]
  end

  def self.find_by_name(name)
    rows = CSV.read(@@filename, headers: true, header_converters: :symbol)
    result = []
    # new code goes here
    rows.each do |row|
      if name == row[:childs_first_name].upcase
        result << row[:childs_first_name]
      end
    end
    
    result.count
  end
end

puts Name.find_by_name('HEAVEN')
