require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


spongebob = Student.new("Spongebob")
patrick= Student.new("Patrick")

puff= Instructor.new("Ms.Puff")
krabs= Instructor.new("Mr.Krabs")

boating_test1 = BoatingTest.new(spongebob, "Don't Crash 101", "pending", puff)
boating_test2 = BoatingTest.new(patrick, "Power Steering 202", "failed", puff)
boating_test3 = BoatingTest.new(patrick, "Power Steering 201", "passed", krabs)
boating_test4 = BoatingTest.new(patrick, "Leedle", "passed", krabs)


binding.pry 
0
