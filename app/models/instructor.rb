class Instructor
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def check_my_student(student, test_name)
    stu_ob = BoatingTest.find_student_with_test_name(student, test_name)
    if stu_ob
      if stu_ob.student == student && stu_ob.test_name == test_name && stu_ob.instructor == self
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def pass_student(student, test_name)
    stu_ob = BoatingTest.find_student_with_test_name(student, test_name)
    if check_my_student(student, test_name)
      stu_ob.test_status = "passed"
      BoatingTest.find_student_with_test_name(student, test_name)
    else
      BoatingTest.new(student, test_name, "passed", self)
    end
  end

  def fail_student(student, test_name)
    stu_ob = BoatingTest.find_student_with_test_name(student, test_name)
    if check_my_student(student, test_name)
      stu_ob.test_status = "failed"
      BoatingTest.find_student_with_test_name(student, test_name)
    else
      BoatingTest.new(student, test_name, "failed", self)
    end
  end
end
