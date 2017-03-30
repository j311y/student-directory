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
@students = []

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def show_students
  print_header
  print_students(@students)
  print_footer(@students)
end

def select_cohort
  months = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December,]
  cohort = gets.chomp.downcase.capitalize.to_sym
    while !months.include?(cohort)
      puts "That is not a valid Month. Try again:"
      cohort = gets.chomp.downcase.capitalize.to_sym
    end
  cohort
end

def input_students
  puts "Please enter student name"
  name = gets.delete("\n").capitalize
  puts "Which cohort are they part of?"
  puts "(Enter a month)"
  cohort = select_cohort
  puts "Please enter their age"
  age = gets.delete("\n")
  puts "What are their hobbies?"
  hobbies = gets.delete("\n")

  # whil the name is not empty, repeat this code
  while !name.empty? do
    # if !cohort.empty?
      @students << {name: name, age: age, hobbies: hobbies, cohort: cohort}
    # else
    # students << {name: name, age: age, hobbies: hobbies, cohort: :Unknown}
    # end
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    puts "Next student name:"
    name = gets.chomp.capitalize
    puts "Their cohort: "
    cohort = select_cohort
    puts "Age: "
    age = gets.chomp
    puts "Hobbies: "
    hobbies = gets.chomp
  end
end

# prints the header text
def print_header
  puts "The students of Villains Academy".center(90)
  puts "--------------------------------".center(90)
end

# prints the students and their personal information
def print_students(students)
    index = 0
    until index == students.count
      puts "#{index+1}. #{students[index][:name].center(30)} | Age: #{students[index][:age].center(5)} | Likes: #{students[index][:hobbies].center(20)} | #{students[index][:cohort]} cohort"
      index += 1
    end
end

# def print_by_cohort(students)
#   month = students.group_by {|input| input[:cohort]}
#     puts "\n"*2
#     puts "Students listed by cohort".center(90)
#     puts "--------------------------".center(90)
#       month.map do |key, value|
#         puts
#         puts "#{key}".center(90)
#         puts "------------".center(90)
#         for index in 0..value.size-1 do
#       puts "#{index+1}. #{value[index][:name].center(30)} | Age: #{value[index][:age].center(5)} | Likes: #{value[index][:hobbies].center(20)} |"
#     end
#   end
# end


# Prints footer message
def print_footer(names)
  if names.count == 1
    puts
    puts "Overall, we have #{names.count} great student".center(90)
    puts
  else names.count > 1
    puts
    puts "Overall, we have #{names.count} great students".center(90)
    puts
  end
end

interactive_menu
