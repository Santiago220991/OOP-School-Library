require './person'
require './book'
require './student'
require './teacher'
require './rental'
require './builders'

class App
    include Builders
    attr_accessor :people, :books, :rented
    def initialize()
        @people=[]
        @books=[]
        @rented=[]
    end

    def select_option(option)
        case option
        when 1
            list_of_books(books)
        when 2
            list_of_people(people)
        when 3
            print  "Do you want to create a student (1) or a teacher (2)? [Input the number]:\s"
            value=gets.chomp
            if(value=="1")
                data = create_student(value)
                student = Student.new(classroom:nil, age:data[:age], name:data[:name],  parent_permission: data[:permission])
                @people << student
                print "Person created succesfully"
            elsif(value=="2")
                data = create_teacher(value)
                teacher = Teacher.new(specialization: data[:specialization], age:data[:age], name:data[:name],  parent_permission: data[:permission])
                @people << teacher
                print "Person created succesfully"
            else
                puts "Invalid option"
            end
        when 4
            data = create_book()
            book = Book.new(data[:title], data[:author])
            @books << book
            print "Book created succesfully"
        when 5
            data=create_rental(books,people)
            rental=Rental.new(people[data[:person_num]], books[data[:book_num]], data[:date])
            @rented << rental
        when 6
            list_of_rentals(rented, people)
        when 7
            puts "Thanks for using the app"
        else 
            puts "invalid option"
        end
    end
end