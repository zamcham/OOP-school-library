require_relative '../classroom'

describe Classroom do
  let(:label) { 'Math Class' }
  let(:classroom) { Classroom.new(label) }

  describe '#initialize' do
    it 'creates a new classroom with the given label' do
      expect(classroom.label).to eq(label)
      expect(classroom.students).to be_empty
    end
  end
end
