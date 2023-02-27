class Attendee
attr_reader :id, 
            :first_name,
            :last_name,
            :zipcode,
            :name

  def initialize(id, first_name, last_name, zipcode)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @name = "#{first_name} #{last_name}"
    @zipcode = clean_zipcode(zipcode)
  end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end

  def display
    "#{id.to_s}: #{name}, #{clean_zipcode(zipcode)}"
  end
end