require_relative '../classes/book.rb'
require_relative '../classes/rental.rb'
require_relative '../classes/student.rb'

describe Book do
  context "Create an instance and add rentals to the book" do
    it "should create an instance of a book" do
      book = Book.new("Jones", "MR Perry")
      expect(book).to be_a Book
    end

    it "Add a book to rentals" do
      book1 = Book.new("Jones", "MR Perry")
      person = Student.new(12, 'Dorsey', 'y')
      rental_book = book1.add_rental(person, '2023-11-12')
      expect(rental_book).to be_a Rental
    end
  end

end