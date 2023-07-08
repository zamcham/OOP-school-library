require_relative '../book'
require_relative '../rental'
require_relative '../person'
require 'rspec'

describe Book do
  let(:title) { 'The Great Gatsby' }
  let(:author) { 'F. Scott Fitzgerald' }
  let(:book) { Book.new(title, author) }

  describe '#initialize' do
    it 'creates a new book with the given title and author' do
      expect(book.title).to eq(title)
      expect(book.author).to eq(author)
      expect(book.rentals).to be_empty
    end
  end
end
