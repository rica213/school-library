require 'json'
require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative './person'

module Preserve
  def write_book
    book_array = []
    @books.each { |book| book_array << { title: book.title, author: book.author } }
    # parse the array of hashes
    book_json_data = JSON.generate(book_array)
    # write the data to books.json
    File.write('./data/books.json', book_json_data, mode: 'w')
  end

  def load_books
    # read books in book.json
    book_data = File.read('./data/books.json')
    arr = JSON.parse(book_data)
    arr.each { |book| @books << Book.new(book['title'], book['author']) }
  end

  def write_people
    people = []
    @people.each do |person|
      if person.is_a? Student
        people << { age: person.age, name: person.name, permission: person.parent_permission,
                    type: 'student' }
      elsif person.is_a? Teacher
        people << { age: person.age, name: person.name, specialization: person.specialization,
                    type: 'teacher' }
      end
    end
    person_json_data = JSON.generate(people)
    File.write('./data/people.json', person_json_data, mode: 'w')
  end

  def load_people
    people_data = File.read('./data/people.json')
    arr = JSON.parse(people_data)
    arr.each do |person|
      if person['type'] == 'student'
        @people << Student.new(person['age'], person['name'], person['permission'])
      elsif person['type'] == 'teacher'
        @people << Teacher.new(person['specialization'], person['age'], person['name'])
      end
    end
  end
end
