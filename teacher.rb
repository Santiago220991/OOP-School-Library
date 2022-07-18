class Teacher < Person
    def initialize(specialization:, **parameters)
        super(**parameters)
        @specialization=specialization
    end
    
    def can_use_services?
        true
    end
end