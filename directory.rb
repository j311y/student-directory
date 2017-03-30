@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
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

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:age], student[:hobbies], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def append_students(name, age, hobbies, cohort)
  @students << {name: name, age: age, hobbies: hobbies, cohort: cohort.to_sym}
end

def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, age, hobbies, cohort = line.chomp.split(',')
  append_students(name, age, hobbies, cohort)
  end
  file.close
end

def input_students
  puts "Please enter student name or 'Enter' to return to menu"
  name = STDIN.gets.delete("\n").capitalize
    name.empty? ? interactive_menu : name
  puts "Which cohort are they part of?"
  puts "(Enter a month)"
  cohort = select_cohort
  puts "Please enter their age"
  age = STDIN.gets.delete("\n")
  puts "What are their hobbies?"
  hobbies = STDIN.gets.delete("\n")

  while !name.empty? do
    append_students(name, age, hobbies, cohort)
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    puts "Next student name or 'Enter to return to menu':"
    name = STDIN.gets.chomp.capitalize
        name.empty? ? interactive_menu : name
    puts "Their cohort: "
    cohort = select_cohort
    puts "Age: "
    age = STDIN.gets.chomp
    puts "Hobbies: "
    hobbies = STDIN.gets.chomp
  end
end

def select_cohort
  months = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December,]
  cohort = STDIN.gets.chomp.downcase.capitalize.to_sym
    while !months.include?(cohort)
      puts "That is not a valid Month. Try again:"
      cohort = STDIN.gets.chomp.downcase.capitalize.to_sym
    end
  cohort
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

# unused method for organising students into cohorts
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

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else puts "Sorry, #{filename} doesn't exist."
  exit
  end
end

try_load_students
interactive_menu
