require './person'

class Student < Person
  def initialize(classroom)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  attr_reader :classroom

  def play_hooky
    '¯\(ツ)/¯'
  end
end
