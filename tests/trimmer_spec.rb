require_relative '../trimmer_decorator'
require_relative '../decorator'
require 'rspec'

RSpec.describe TrimmerDecorator do
  let(:nameable) { double('Nameable', correct_name: 'Lorem ipsum dolor sit amet') }
  let(:decorator) { TrimmerDecorator.new(nameable) }

  describe '#correct_name' do
    it 'returns the trimmed name using the nameable object' do
      expect(decorator.correct_name).to eq('Lorem ipsu')
    end
  end
end
