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
@months = [:Unknown, :January, :Febuary, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December,]

# prints the header text
def print_header
  puts "The students of Villains Academy".center(110)
  puts "--------------------------------".center(110)
end

def select_cohort
  cohort = gets.chomp.capitalize.to_sym
    while !@months.include?(cohort) || cohort.empty?
      puts "That is not a valid Month. Try again:"
      cohort = gets.chomp.capitalize.to_sym
    end
  cohort
end

def input_students
  puts "To exit hit return 3 times"
  puts "Please enter the names of the students"
  name = gets.chomp.capitalize
  puts "Which cohort are they part of?"
  puts "(Enter 'Month' or 'Unknown')"
  cohort = select_cohort
  puts "Please enter their age"
  age = gets.chomp
  puts "What are their hobbies?"
  hobbies = gets.chomp

  students = []

  # whil the name is not empty, repeat this code
  while !name.empty? do
    # if !cohort.empty?
      students << {name: name, age: age, hobbies: hobbies, cohort: cohort}
    # else
    # students << {name: name, age: age, hobbies: hobbies, cohort: :Unknown}
    # end
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    puts "Next student name: "
    name = gets.chomp.capitalize
    puts "Their cohort: "
    cohort = select_cohort
    puts "Age: "
    age = gets.chomp
    puts"Hobbies: "
    hobbies = gets.chomp
  end

  students
end

# prints the students and their personal information
def print(students)
    index = 0
    until index == students.count
      puts "#{students[index][:name].center(30)} | Age: #{students[index][:age].center(5)} | Likes: #{students[index][:hobbies].center(30)} | #{students[index][:cohort]} cohort"
      index += 1
    end
end

# Prints footer message
def print_footer(names)
  if names.count == 1
    puts
    puts "Overall, we have #{names.count} great student".center(110)
    puts
  elsif names.count > 1
    puts
    puts "Overall, we have #{names.count} great students".center(110)
    puts
  else
    puts
    puts "We don't have any students!".center(110)
    puts
  end
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
