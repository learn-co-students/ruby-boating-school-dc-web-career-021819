class Student
  attr_accessor :first_name
  @@all = []

  def initialize(first_name)
    @first_name = first_name
    @@all << self
  end

  def self.all
    @@all
  end

  def add_boating_test(test_name, test_status, instructor)
    BoatingTest.new(self, test_name, test_status, instructor)
  end

  def self.find_student(first_name)
    self.all.find{|x| x.first_name == first_name}
  end

  def count(status = "all")
    if status == "passed"
      BoatingTest.all.count{|x| x.student == self && x.test_status == status}
    else
      BoatingTest.all.count{|x| x.student == self}
    end
  end

  def grade_percentage
    result = self.count("passed").to_f / self.count * 100
    result.round(2)
  end
end
