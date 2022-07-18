require "./nameable"
require "./decorator"
require "./capitalize_decorator"
require "./trimmer_decorator"

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknow', parent_permission: true)
    @id = rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def correct_name
    @name
  end

  def can_use_services?
    return true if of_age? || @parent_permission

    false
  end

  def of_age?
    @age >= 18
  end

  private :of_age?
end
