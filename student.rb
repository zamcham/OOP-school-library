require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_reader :classroom
  
  def initialize(id, classroom, name: 'Unknown', age: nil, parent_permission: true)
    super(id, name, age, parent_permission)
    @classroom = classroom
  end

  def set_classroom(classroom)
    @classroom = classroom
    classroom.students << self
  end
  
  def play_hooky
    '¯\\(ツ)/¯'
  end
end
