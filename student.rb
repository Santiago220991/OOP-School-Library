class Student < Person

    def initialize (classroom:, **parameters)
        super(**parameters)
        @classroom=classroom
    end
    
    def play_hooky
        "¯\(ツ)/¯"
    end

end
