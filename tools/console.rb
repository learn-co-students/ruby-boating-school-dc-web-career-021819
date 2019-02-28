require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
spongebob = Student.new("Spongebob")
patrick = Student.new("Patrick")

puff = Instructor.new("Ms.Puff")
krabs = Instructor.new("Mr.Krabs")

no_crashing = spongebob.add_boating_test("Don't Crash 101", "pending", puff)
power_steering_failure = patrick.add_boating_test("Power Steering 202", "failed", puff)
power_steering_pass = patrick.add_boating_test("Power Steering 201", "passed", krabs)
a = patrick.add_boating_test("a", "failed", krabs)

puts "Student.all"
puts Student.all == [spongebob, patrick]

puts "Student#add_boating_test"
puts BoatingTest.all == [no_crashing, power_steering_failure, power_steering_pass, a]

puts "Student.find_student"
puts Student.find_student("Spongebob") == spongebob

puts "Student#grade_percentage"
puts patrick.grade_percentage == 33.33
puts spongebob.grade_percentage == 0.0

puts "Instructor.all"
puts Instructor.all == [puff, krabs]

puts "Instructor#pass_student"
puts BoatingTest.find_student_with_test_name(patrick, "a").test_status
puts krabs.pass_student(patrick, "a").test_status

puts "Instructor#fail_student"
puts BoatingTest.find_student_with_test_name(spongebob, "Don't Crash 101").test_status
puts puff.fail_student(spongebob, "Don't Crash 101").test_status

puts "end"

# binding.pry
# 0 #leave this here to ensure binding.pry isn't the last line
