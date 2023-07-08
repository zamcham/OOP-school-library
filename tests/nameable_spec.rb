require_relative '../nameable'

class NameableTestImplementation < Nameable
  def correct_name
    # Implement the abstract method for testing purposes
    'Test Name'
  end
end

describe Nameable do
  let(:nameable) { NameableTestImplementation.new }

  describe '#correct_name' do
    it 'raises NotImplementedError when called on the abstract class' do
      expect { subject.correct_name }.to raise_error(NotImplementedError)
    end

    it 'returns the correct name when called on a concrete subclass' do
      expect(nameable.correct_name).to eq('Test Name')
    end
  end
end
