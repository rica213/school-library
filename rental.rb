class Rental
  attr_accessor :date, :book

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end
end
