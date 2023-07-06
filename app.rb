require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require 'json'

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    if @books.empty?
      puts 'No books available.'
    else
      puts 'All Books:'
      @books.each_with_index do |book, index|
        puts "#{index + 1}. Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_all_people
    if @people.empty?
      puts 'No people available.'
    else
      puts 'All People:'
      @people.each do |person|
        puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}, Type: #{person.class}"
      end
    end
  end

  def create_person
    print 'Do you want to create a Student(1) or a Teacher(2)? [Input the number]: '
    res = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    if res == 1
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp.downcase == 'y'
      person = Student.new(age, nil, name, parent_permission: parent_permission)
      puts "Student created successfully. ID: #{person.id}, Name: #{person.name}"
    elsif res == 2
      print 'Enter the teacher\'s specialization: '
      specialization = gets.chomp
      person = Teacher.new(age, specialization, name)
      puts "Teacher created successfully. Name: #{person.name}, ID: #{person.id}"
    else
      puts 'Invalid choice. Person creation failed.'
    end
    @people << person
  end

  def create_book
    print 'Enter the book\'s title: '
    title = gets.chomp
    print 'Enter the book\'s author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully.'
  end

  def select_person
    puts 'Select a person to create a rental:'
    list_all_people
    print 'Enter the person\'s ID: '
    person_id = gets.chomp.to_i
    @people.find { |p| p.id == person_id }
  end

  def create_rental
    person = select_person
    puts 'Person not found.' and return if person.nil?

    puts 'Select a book to rent:'
    list_all_books
    print 'Enter the book\'s number: '
    index = gets.chomp.to_i
    book = @books[index - 1]
    if book.nil?
      puts 'Book not found.'
      return
    end
    print 'Enter the rental date (YYYY-MM-DD): '
    date = gets.chomp
    rental = Rental.new(book, person, date)
    @rentals << rental
    puts 'Rental created successfully.'
  end

  def list_rentals_for_person
    puts 'Select a person to list rentals:'
    list_all_people

    print 'Enter the person\'s ID: '
    person_id = gets.chomp.to_i

    person = @people.find { |p| p.id == person_id }
    if person.nil?
      puts 'Person not found.'
      return
    end

    rentals = @rentals.select { |r| r.person == person }

    if rentals.empty?
      puts 'No rentals found for the person.'
    else
      puts "Rentals for Person #{person.id} (#{person.name}):"
      rentals.each do |rental|
        puts "Book: #{rental.book.title}, Date: #{rental.date}"
      end
    end
  end

  def quit
    save_data_to_files
    false
  end

  def save_data_to_files
    save_to_json('people.json', serialize_people)
    save_to_json('books.json', serialize_books)
    save_to_json('rentals.json', serialize_rentals)
  end

  def save_to_json(filename, data)
    File.write(filename, JSON.generate(data))
    puts "Data saved to #{filename}."
  end

  def load_data_from_files
    @people = load_from_json('people.json')
    @books = load_from_json('books.json')
    @rentals = load_from_json('rentals.json')
  end

  def load_from_json(filename)
    return [] unless File.exist?(filename)

    JSON.parse(File.read(filename)).map do |item|
      case item['type']
      when 'Student'
        Student.new(item['age'], item['name'], parent_permission: item['parent_permission'])
      when 'Teacher'
        Teacher.new(item['age'], item['specialization'], item['name'], parent_permission: item['parent_permission'])
      when 'Book'
        Book.new(item['title'], item['author'])
      when 'Rental'
        book = @books.find { |b| b.title == item['book_title'] }
        person = @people.find { |p| p.id == item['person_id'] }
        Rental.new(book, person, item['date'])
      end
    end
  end

  def serialize_people
    @people.map do |person|
      serialized_person = {
        'type' => person.class.name,
        'age' => person.age,
        'id' => person.id,
        'name' => person.name
      }
      if person.is_a?(Student)
        serialized_person['parent_permission'] = person.parent_permission
      elsif person.is_a?(Teacher)
        serialized_person['specialization'] = person.specialization
      end
      serialized_person
    end
  end

  def serialize_books
    @books.map do |book|
      {
        'type' => book.class.name,
        'title' => book.title,
        'author' => book.author
      }
    end
  end

  def serialize_rentals
    @rentals.map do |rental|
      {
        'type' => rental.class.name,
        'book_title' => rental.book.title,
        'person_id' => rental.person.id,
        'date' => rental.date
      }
    end
  end
end
