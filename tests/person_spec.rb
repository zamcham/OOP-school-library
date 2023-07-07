require_relative '../decorator'
require_relative '../person'
require 'rspec'

RSpec.describe Person do
  let(:person) { Person.new(20, 'John Doe') }

  describe '#initialize' do
    it 'sets the age, name, parent_permission, and rentals' do
      expect(person.age).to eq(20)
      expect(person.name).to eq('John Doe')
      expect(person.parent_permission).to be(true)
      expect(person.rentals).to be_empty
    end

    it 'generates a random id if id is not provided' do
      expect(person.id).to be_a(Integer)
    end

    it 'uses the provided id if id is provided' do
      person_with_id = Person.new(25, 'Jane Smith', id: 123)
      expect(person_with_id.id).to eq(123)
    end
  end

  describe '#can_use_services?' do
    it 'returns true if the person is of age' do
      person = Person.new(18)
      expect(person.can_use_services?).to be(true)
    end

    it 'returns true if the person has parent permission' do
      person = Person.new(15)
      expect(person.can_use_services?).to be(true)
    end

    it 'returns false if the person is underage and has no parent permission' do
      person = Person.new(12, 'Alice', parent_permission: false)
      expect(person.can_use_services?).to be(false)
    end
  end

  describe '#correct_name' do
    it 'returns the correct name' do
      expect(person.correct_name).to eq('John Doe')
    end
  end
end
