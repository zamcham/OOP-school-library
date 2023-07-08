require_relative '../nameable'
require_relative '../decorator'
require_relative '../data_manager'
require 'rspec'

class TestNameable
  def correct_name
    'Test Name'
  end
end

RSpec.describe Decorator do
  let(:nameable) { TestNameable.new }
  let(:decorator) { Decorator.new(nameable) }

  describe '#correct_name' do
    it 'returns the correct name using the nameable object' do
      expect(decorator.correct_name).to eq('Test Name')
    end
  end
end
