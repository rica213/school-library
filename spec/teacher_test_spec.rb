require_relative '../classes/teacher.rb'

describe Teacher do
  context "Create an instance of teacher and test methods" do
    it "Create an instance of teacher" do 
      teacher = Teacher.new('computer', 22, 'helski')
      expect(teacher).to be_a Teacher
    end

    it "Testing can use services method" do
      teacher = Teacher.new('computer', 22, 'helski')
      use_services = eacher.can_use_services?
      expect
    end
  end
end