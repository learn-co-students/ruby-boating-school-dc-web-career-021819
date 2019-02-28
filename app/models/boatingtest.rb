class BoatingTest
  attr_accessor :student, :instructor, :test_name, :test_status
  @@all = []

  def initialize(student, test_name, test_status, instructor)
    @student, @test_name, @test_status, @instructor = student, test_name, test_status, instructor
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_student_with_test_name(student, test_name)
    self.all.find{|x| x.student == student && x.test_name == test_name}
  end

end
