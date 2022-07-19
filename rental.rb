class Rental
    attr_accessor :rental
    def initialize(person, book, date)
        @person=person
        person.rentals << self
        @book=book
        book.rentals << self
        @date=date
    end
end