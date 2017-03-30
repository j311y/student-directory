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

@months = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December,]
@students = []
# prints the header text
def print_header
  puts "The students of Villains Academy".center(90)
  puts "--------------------------------".center(90)
end

def select_cohort
  cohort = gets.chomp.downcase.capitalize.to_sym
    while !@months.include?(cohort)
      puts "That is not a valid Month. Try again:"
      cohort = gets.chomp.downcase.capitalize.to_sym
    end
  cohort
end

def input_students
  puts "Please enter student name or to quit press enter now"
  name = gets.delete("\n").capitalize
    name.empty? ? Exit : name
  puts "Which cohort are they part of?"
  puts "(Enter 'Month' or 'Unknown')"
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
    puts "Next student name or leave blank to quit"
    name = gets.chomp.capitalize
      name.empty? ? Exit : name
    puts "Their cohort: "
    cohort = select_cohort
    puts "Age: "
    age = gets.chomp
    puts "Hobbies: "
    hobbies = gets.chomp
  end

  @students
end
# prints the students and their personal information
def print(students)
    index = 0
    until index == students.count
      puts "#{index+1}. #{students[index][:name].center(30)} | Age: #{students[index][:age].center(5)} | Likes: #{students[index][:hobbies].center(20)} | #{students[index][:cohort]} cohort"
      index += 1
    end
end

def print_by_cohort(students)
  month = students.group_by {|input| input[:cohort]}
    puts "\n"*2
    puts "Students listed by cohort".center(90)
    puts "--------------------------".center(90)
      month.map do |key, value|
        puts
        puts "#{key}".center(90)
        puts "------------".center(90)
        for index in 0..value.size-1 do
      puts "#{index+1}. #{value[index][:name].center(30)} | Age: #{value[index][:age].center(5)} | Likes: #{value[index][:hobbies].center(20)} |"
    end
  end
end


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

def output
  students = input_students
  if @students.count > 0
    print_header
    print(students)
    print_by_cohort(students)
    print_footer(students)
  else
    puts
    puts "We dont have any students!".center(90)
    puts
  end
end

output
