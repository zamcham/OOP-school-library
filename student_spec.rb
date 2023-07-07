require_relative '../student'
require_relative '../person'
require_relative '../classroom'
require 'rspec'

RSpec.describe Student do
  let(:classroom) { Classroom.new('Math') }
  let(:student) { Student.new(16, classroom, 'John Doe') }

  describe '#initialize' do
    it 'sets the age, classroom, name, parent_permission, and id' do
      expect(student.age).to eq(16)
      expect(student.classroom).to eq(classroom)
      expect(student.name).to eq('John Doe')
      expect(student.parent_permission).to be(true)
      expect(student.id).to be_nil
    end

    it 'assigns the student to the classroom' do
      expect(classroom.students).to include(student)
    end
  end

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
