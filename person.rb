class Person 
    attr_reader :id, :name, :age
    attr_writer :name, :age
    
    def initialize(age:, parent_permission:true, name:"Unknow")
        @id=rand(1..100)
        @name=name
        @age=age
        @parent_permission=parent_permission
    end

    def can_use_services?
        return true if (@age>=18 || @parent_permission==true)
        false
    end

    def is_of_age?
        return true if @age>=18
        false
    end

    private :is_of_age?
end

