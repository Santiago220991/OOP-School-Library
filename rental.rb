
class Rental
  attr_accessor :person, :date, :book

  def initialize(person, book, date)
    @person = person
    person.rentals << self
    @book = book
    book.rentals << self
    @date = date
  end

  def to_json(*args)
    {
      JSON.create_id  => self.class.name,
      'a'             => [ @person.id, @book.title, @date ]
    }.to_json(*args)
  end 

  def self.json_create(object)
    {person_id:object['a'][0], book_title:object['a'][1], date:object['a'][2]}
  end

end
