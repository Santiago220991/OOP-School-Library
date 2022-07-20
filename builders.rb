module Builders
    def create_student(value)
        print "Insert Age:\s"
        age=gets.chomp.to_i
        print "Insert Name:\s"
        name=gets.chomp
        print "Has parent permission [Y/N]?\s"
        permission=gets.chomp.capitalize
        if(permission=="Y")
            permission=true
        else
            permission=false
        end
        {age:age, name:name, permission:permission}
    end

    def create_teacher(value)
        print "Insert Age:\s"
        age=gets.chomp.to_i
        print "Insert Name:\s"
        name=gets.chomp
        print "Insert Specialization: \s"
        specialization=gets.chomp
        {age:age, name:name, specialization:specialization}
    end

    def create_book()
        print "Insert title: \s"
        title=gets.chomp
        print "Insert author: \s"
        author=gets.chomp
        {title: title, author: author}
    end

    def list_of_books(books)
        books.each_with_index do |book,index|
            puts "#{index}) #{book.title} #{book.author}"
        end
    end

    def list_of_people(people)
        people.each_with_index do |person, index|
            puts "#{index}) [#{person.class.name}] Name: #{person.name} ID: #{person.id} Age: #{person.age}"
        end
    end

    def create_rental(books,people)
        list_of_books(books)
        print ("Select by number one of the books listed (not id) \s")
        book_num=gets.chomp.to_i
        list_of_people(people)
        print ("Select by number one of the people listed (not id) \s")
        person_num=gets.chomp.to_i
        print ("Insert a date: \s")
        date=gets.chomp
        {book_num: book_num, person_num: person_num, date: date} 
    end

    def list_of_rentals(rented)
        print ("Insert person ID: \s")
        id=gets.chomp.to_i
        print ("Rentals:\n")
        rented.map do |rental|
            puts "#{rental.date}, '#{rental.book.title}' by #{rental.book.author}" if rental.person.id==id
        end
    end
end