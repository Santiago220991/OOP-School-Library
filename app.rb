require './person'
require './book'
require './student'
require './teacher'
require './rental'
require './builders'
require 'json'

class App
  include Builders
  attr_accessor :people, :books, :rented

  def initialize()
    @people = File.exist?('./people.json') ? JSON.parse(File.read('./people.json'), create_additions: true) : []
    @books = File.exist?('./books.json') ? JSON.parse(File.read('./books.json'), create_additions: true) : []
    @rented = if File.exist?('./rentals.json')
                JSON.parse(File.read('./rentals.json'),
                           create_additions: true).map do |rental|
                  load_rental(rental)
                end
              else
                []
              end
  end

  def select_option(option)
    case option
    when 1
      list_of_books(books)
    when 2
      list_of_people(people)
    when 3
      data = create_person
      @people << data
    when 4
      book = create_book
      @books << book
    when 5
      rental = create_rental(books, people)
      @rented << rental
    when 6
      list_of_rentals(rented)
    else
      puts 'invalid option'
    end
  end

  def save_data
    File.write('books.json', JSON.generate(@books))
    File.write('people.json', JSON.generate(@people))
    File.write('rentals.json', JSON.generate(@rented))
  end

  def load_rental(rental)
    person = @people.filter { |per| per.id == rental[:person_id] }.first
    book = @books.filter { |b| b.title == rental[:book_title] }.first
    Rental.new(person, book, rental[:date])
  end
end
