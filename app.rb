require './person'
require './book'
require './student'
require './teacher'
require './rental'
require './builders'

class App
    include Builders
    attr_accessor :people, :books
    def initialize()
        @people=[]
        @books=[]
    end

    def select_option(option)
        case option
        when 1
            print @books
        when 2
            print @people
        when 3
            print  "Do you want to create a student (S) or a teacher (T)? [Input the number]:\s"
            value=gets.chomp.capitalize
            if(value=="S")
                data=create_student(value)
                student=Student.new(classroom:nil, age:data[:age], name:data[:name],  parent_permission: data[:permission])
                people << student
            else
                data=create_teacher(value)
                teacher=Teacher.new(specialization: data[:specialization], age:data[:age], name:data[:name],  parent_permission: data[:permission])
                people << teacher
            end
        when 4
            data=create_book()
            book=Book.new(data[:title], data[:author])
            books<<book
        when 5
            puts "opcion 5"
        when 6
            puts "opcion6"
        when 7
            puts "Thanks for using the app"
        else 
            puts "invalid option"
        end
    end
end