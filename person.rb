require './nameable'
require './decorator'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age:, name: 'Unknow', parent_permission: true)
    super()
    @id = rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def can_use_services?
    return true if of_age? || @parent_permission

    false
  end

  def add_rental(date, book)
    rental = Rental.new(self, book, date)
    @rentals << rental unless @rentals.include?(rental)
  end

  def of_age?
    @age >= 18
  end

  private :of_age?
end
