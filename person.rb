class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknow', parent_permission: true)
    @id = rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    return true if of_age? || @parent_permission == true

    false
  end

  def of_age?
    @age >= 18
  end

  private :of_age?
end

p persona=Person.new(12, parent_permission: false)
p persona.can_use_services?