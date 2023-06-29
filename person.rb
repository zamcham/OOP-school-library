require_relative 'decorator'
require_relative 'nameable'

class Person < Nameable
  # automatically generates getter methods for each variable.
  attr_accessor :name, :age
  attr_reader :id

  def initialize(id, name: 'Unknown', age: nil, parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
  end

  # Setters

  def can_use_services?
    of_age? || @parent_permission
  end

  # Implementing correct_name method from Nameable
  def correct_name
    name
  end

  def add_rental(person, date)
    Rental.new(date, self, person
  end

  private

  def of_age?
    @age.to_i >= 18
  end
end
