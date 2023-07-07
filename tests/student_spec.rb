require_relative '../student'
require_relative '../person'
require_relative '../classroom'
require 'rspec'

RSpec.describe Student do
  let(:classroom) { Classroom.new('Math') }
  let(:student) { Student.new(16, classroom, 'John Doe') }

  describe '#classroom=' do
    it 'sets the classroom and adds the student to the new classroom' do
      new_classroom = Classroom.new('Science')
      student.classroom = new_classroom

      expect(student.classroom).to eq(new_classroom)
      expect(new_classroom.students).to include(student)
    end

    it 'does not duplicate the student in the classroom' do
      student.classroom = classroom

      expect(classroom.students.count(student)).to eq(1)
    end
  end

  describe '#play_hooky' do
    it 'returns the string representation of playing hooky' do
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end
end
