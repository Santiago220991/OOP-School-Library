require './app'
require './nameable'
require './person'
require './book'
require './student'
require './teacher'
require './rental'

def main
    app=App.new()
    exit=0
    while(exit==0)
    print("Welcome to School Library App! 

        Please choose an option by entering a number:
        1 - List all books
        2 - List all people
        3 - Create a person
        4 - Create a book
        5 - Create a rental 
        6 - List all rentals for a given person id
        7 - Exit
            ")
        option=gets.chomp.to_i

        if option==7
            exit=1
        end
        app.select_option(option)
    end
end
main()