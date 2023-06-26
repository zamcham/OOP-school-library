require_relative 'person'

class Student < Person
  def initialize(id, classroom, name: 'Unknown', age: nil, parent_permission: true)
    super(id, name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
