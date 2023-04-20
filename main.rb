require_relative './student'
require_relative './teacher'
require_relative './book'

$people = []
$books = []
$rentals = []

def intro
  puts 'Welcome to School Library App!'
end

def options
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

# option 1
def list_books
  puts 'No book yet!' if books.empty?
  $books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
end

# option 2
def list_people
  puts 'We do not have people' if people.empty?
  $people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
end

# option 3
def create_person
  print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
  option = gets.chomp
  if option == '1'
    print 'Age: '
    age = gets.to_i
    print "\nName: "
    name = gets.chomp.capitalize
    print "\nHas parent permission? [Y/N]: "
    permission = gets.downcase == 'y'
    $people << Student.new(age, name, permission)
    puts 'Person created successfully'
  elsif option == '2'
    print 'Age: '
    age = gets.to_i
    print "\nName: "
    name = gets.chomp.capitalize
    print "\nSpecialization: "
    specialization = gets.chomp.capitalize
    $people << Teacher.new(specialization, age, name)
    puts 'Person created successfully'
  else
    puts "You entered a wrong input, it's either 1 (for a new student) or 2 (for a new teacher)"
  end
end

# option 4
def create_book
  print "\nTitle: "
  title = gets.chomp.capitalize
  print "\nAuthor: "
  author = gets.chomp.capitalize
  $books << Book.new(title, author)
  puts 'Book created successfully'
end

# option 5
def create_rental
  if $books.empty? || $people.empty?
    puts 'There are no books or people to create a rental'
    return
  end
  puts 'Select a book from the following list by number'
  $books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: \"#{book.author}\"" }
  book_id = gets.chomp.to_i

  puts 'Select a person from the following list by number (not id)'
  $people.each_with_index do |person, index|
    puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end
  person_id = gets.chomp.to_i

  print 'Date: '
  date = gets.chomp
  $rentals << Rental.new(date, $books[book_id], $person[person_id])
  puts 'Rental created successfully'
end

# option 6
def list_all_rentals
  print 'ID of person: '
  id = gets.chomp.to_i
  puts 'Rentals:'
  $rentals.each do |rental|
    puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
  end
end

# option 7
def exit_app
  puts 'Thank you for using this app!'
  exit
end

def main
  intro
  loop do
    options
    option = gets.chomp
    case option
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_all_rentals
    when '7'
      exit_app
    else
      puts 'You entered a wrong input, please try again'
    end
  end
end

main
