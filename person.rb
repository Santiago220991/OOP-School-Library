class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age:, parent_permission: true, name: 'Unknow')
    @id = rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    return true if @age >= 18 || @parent_permission == true

    false
  end

  def of_age?
    return true if @age >= 18

    false
  end

  private :is_of_age?
end

person = Person.new(age: 20)
p person
person.name = 'Andres'
person.age = 21
p person
