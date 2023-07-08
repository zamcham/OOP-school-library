require 'date'
require_relative '../rental'
require_relative '../book'
require_relative '../person'
require 'rspec'

RSpec.describe Rental do
  let(:book) { Book.new('Title', 'Author') }
  let(:person) { Person.new(20, 'John Doe') }
  let(:date) { Date.today }
  let(:rental) { Rental.new(book, person, date) }

  describe '#initialize' do
    it 'sets the book, person, and date' do
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
      expect(rental.date).to eq(date)
    end

    it 'adds itself to the rentals of the book and person' do
      expect(book.rentals).to include(rental)
      expect(person.rentals).to include(rental)
    end
  end
end
