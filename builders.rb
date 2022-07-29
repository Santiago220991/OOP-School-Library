require './student'
require './person'
require './teacher'
require './book'
require './rental'

module Builders
  def create_person
    print "Do you want to create a student (1) or a teacher (2)? [Input the number]:\s"
    value = gets.chomp
    case value
    when '1'
      data = create_student()
      student = Student.new(classroom: nil, age: data[:age], name: data[:name],
                            parent_permission: data[:permission])
      print 'Person created successfully'
      student
    when '2'
      data = create_teacher()
      teacher = Teacher.new(specialization: data[:specialization], age: data[:age], name: data[:name],
                            parent_permission: true)
      print 'Person created successfully'
      teacher
    else
      puts 'Invalid option'
    end
  end

  def create_student
    print "Insert Age:\s"
    age = gets.chomp.to_i
    print "Insert Name:\s"
    name = gets.chomp
    print "Has parent permission [Y/N]?\s"
    permission = gets.chomp.capitalize
    permission = permission == 'Y'
    { age: age, name: name, permission: permission }
  end

  def create_teacher
    print "Insert Age:\s"
    age = gets.chomp.to_i
    print "Insert Name:\s"
    name = gets.chomp
    print "Insert Specialization: \s"
    specialization = gets.chomp
    { age: age, name: name, specialization: specialization }
  end

  def create_book()
    print "Insert title: \s"
    title = gets.chomp
    print "Insert author: \s"
    author = gets.chomp
    book = Book.new(title, author)
    print 'Book created succesfully'
    book
  end

  def list_of_books(books)
    books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title} Author: #{book.author}"
    end
  end

  def list_of_people(people)
    people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name} ID: #{person.id} Age: #{person.age}"
    end
  end

  def create_rental(books, people)
    print("Select by number one of the books listed (not id) \s\n")
    list_of_books(books)
    book_num = gets.chomp.to_i
    print("Select by number one of the people listed (not id) \s\n")
    list_of_people(people)
    person_num = gets.chomp.to_i
    print("Insert a date [DD-MM-YYYY]: \s")
    date = gets.chomp
    if((book_num <= books.length && book_num >=0)&&(person_num<=people.length && person_num>=0) )
    rental = Rental.new(people[person_num], books[book_num], date)
    print 'Rental created succesfully'
    rental
    else
      print ('Invalid book or person option')
    end
  end

  def list_of_rentals(rented)
    print("Insert person ID: \s")
    id = gets.chomp.to_i
    print("Rentals:\n")
    rented.map do |rental|
      puts "#{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
  end
end
