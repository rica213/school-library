require 'json'
require_relative './book'

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
end
