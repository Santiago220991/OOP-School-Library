class Book
    attr_accessor :title, :author, :rentals
    def initialize(title, author)
        @title=title
        @author=author
        @rentals=[]
    end

    def add_rental(date, person)
        rental=Rental.new(person, book, date)
        @rentals << rental unless @rentals.include?(rental)
end