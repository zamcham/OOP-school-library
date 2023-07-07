require_relative '../app'
require_relative '../student'
require_relative '../teacher'
require_relative '../book'
require_relative '../rental'

RSpec.describe App do
  let(:app) { App.new }

  describe '#list_all_books' do
    context 'when there are no books' do
      it 'displays "No books available."' do
        expect { app.list_all_books }.to output("No books available.\n").to_stdout
      end
    end

    context 'when there are books' do
      let(:book1) { Book.new('Title 1', 'Author 1') }
      let(:book2) { Book.new('Title 2', 'Author 2') }

      before do
        app.books << book1
        app.books << book2
      end

      it 'displays all books' do
        expected_output = <<~OUTPUT
          All Books:
          1. Title: Title 1, Author: Author 1
          2. Title: Title 2, Author: Author 2
        OUTPUT
        expect { app.list_all_books }.to output(expected_output).to_stdout
      end
    end
  end

  describe '#list_all_people' do
    context 'when there are no people' do
      it 'displays "No people available."' do
        expect { app.list_all_people }.to output("No people available.\n").to_stdout
      end
    end

    context 'when there are people' do
      let(:student1) { Student.new('25', 'Classroom 1', 'John', parent_permission: true) }
      let(:student2) { Student.new('30', 'Classroom 2', 'Jane', parent_permission: false) }
      let(:teacher) { Teacher.new('40', 'Math', 'Mr. Smith') }

      before do
        app.people << student1
        app.people << student2
        app.people << teacher
      end

      it 'displays all people' do
        expected_output = <<~OUTPUT
          All People:
          ID: #{student1.id}, Name: John, Age: 25, Type: Student
          ID: #{student2.id}, Name: Jane, Age: 30, Type: Student
          ID: #{teacher.id}, Name: Mr. Smith, Age: 40, Type: Teacher
        OUTPUT
        expect { app.list_all_people }.to output(expected_output).to_stdout
      end
    end
  end
end