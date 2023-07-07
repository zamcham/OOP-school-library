require_relative '../menu'
require 'rspec'

class TestApp
  def list_all_books; end

  def list_all_people; end

  def create_person; end

  def create_book; end

  def create_rental; end

  def list_rentals_for_person; end

  def quit; end
end

RSpec.describe Menu do
  let(:app) { TestApp.new }
  let(:menu) { Menu.new(app) }

  describe '#display' do
    it 'displays the menu options' do
      expected_output = <<~MENU
        -------------------
        Console App Options
        -------------------
        1. List all books
        2. List all people
        3. Create a person
        4. Create a book
        5. Create a rental
        6. List all rentals for a person
        0. Quit
        -------------------
        Enter your choice:
      MENU

      expect { menu.display }.to output(include(expected_output.strip)).to_stdout
    end
  end
end
