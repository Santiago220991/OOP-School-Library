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
        return {age:age, name:name, permission:permission}
    end

    def create_teacher(value)
        print "Insert Age:\s"
        age=gets.chomp.to_i
        print "Insert Name:\s"
        name=gets.chomp
        print "Insert Specialization: \s"
        specialization=gets.chomp
        return {age:age, name:name, specialization:specialization}
    end

end