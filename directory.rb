# lets put all students into an array
# students = [
#  {name: "Dr. Hanibal Lecter", cohort: :november},
#  {name: "Darth Vader", cohort: :november},
#  {name: "Nurse Ratched", cohort: :november},
#  {name: "Michael Corleone", cohort: :november},
#  {name: "Alex DeLarge", cohort: :november},
#  {name: "The Wicked Witch of the West", cohort: :november},
#  {name: "Terminator", cohort: :november},
#  {name: "Freddy Krueger", cohort: :november},
#  {name: "The Joker", cohort: :november},
#  {name: "Joffrey Baratheon", cohort: :november},
#  {name: "Norman Bates", cohort: :november}
# ]

def print_header
  puts "The students of Villains Academy".center(110)
  puts "--------------------------------".center(110)
end

def input_students
  puts "To exit hit return 3 times"
  puts "Please enter the names of the students"
  name = gets.chomp
  puts "Please enter their age"
  age = gets.chomp
  puts "What are their hobbies?"
  hobbies = gets.chomp

  students = []

  # whil the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, age: age, hobbies: hobbies, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Next student name: "
    name = gets.chomp
    puts "Age: "
    age = gets.chomp
    puts"Hobbies: "
    hobbies = gets.chomp
  end
  # return the array of students
  students
end


def print(students)
    index = 0
    until index == students.count
      puts "#{students[index][:name].center(30)} | Age: #{students[index][:age].center(5)} | Likes: #{students[index][:hobbies].center(30)} | #{students[index][:cohort]} cohort"
      index += 1
    end
end

def print_footer(names)
  puts
  puts "Overall, we have #{names.count} great students".center(110)
  puts
end
# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
