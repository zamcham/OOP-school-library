class Menu
  OPTIONS = {
    1 => :list_all_books,
    2 => :list_all_people,
    3 => :create_person,
    4 => :create_book,
    5 => :create_rental,
    6 => :list_rentals_for_person,
    0 => :quit
  }.freeze

  def initialize(app)
    @app = app
  end

  def display
    puts '-------------------'
    puts 'Console App Options'
    puts '-------------------'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a person'
    puts '0. Quit'
    puts '-------------------'
    print 'Enter your choice: '
  end

  def process_choice(choice)
    action = OPTIONS[choice]
    if action
      @app.send(action)
    else
      puts 'Invalid choice. Please try again.'
    end
    !choice.zero?
  end
end