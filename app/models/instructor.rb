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

  def pass_student(student, test_name)
    test_check = BoatingTest.all.find {|boatingtest| boatingtest.student == student && boatingtest.test_name == test_name}
      if test_check
        test_check.test_status = "passed"
      else
        BoatingTest.new(student, test_name, "passed", self)
      end
  end

  def fail_student(student, test_name)
    fail_check = BoatingTest.all.find {|boatingtest| boatingtest.student == student && boatingtest.test_name == test_name}
      if fail_check
        fail_check.test_status = "failed"
      else
        BoatingTest.new(student, test_name, "failed", self)
      end
  end

end
