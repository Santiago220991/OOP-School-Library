class App
    attr_accessor :people, :books
    def initialize()
        @people=[]
        @books=[]
    end

    def select_option(option)
        case option
        when 1
            puts "opcion 1"
        when 2
            puts "opcion 2"
        when 3
            puts "opcion 3"
        when 4
            puts "opcion 4"
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