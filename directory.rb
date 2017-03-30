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
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "5. Show students by Cohort"
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
  when "5"
    print_by_cohort
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
  puts "Which file do you want to save to? (Enter for default)"
  user_file = STDIN.gets.chomp
    if user_file == ""
      user_file = "students.csv"
    end
  file = File.open("#{user_file}", "w")
  @students.each do |student|
    student_data = [student[:name], student[:age], student[:hobbies], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  puts
  puts "***** Students successfully saved to #{user_file} *****"
  puts
  file.close
end

def append_students(name, age, hobbies, cohort)
  @students << {name: name, age: age, hobbies: hobbies, cohort: cohort.to_sym}
end

def load_students
  puts "Which file do you want to load from? (Enter for default)"
  user_file = STDIN.gets.chomp
    if user_file == ""
      user_file = "students.csv"
    else
      File.exists?(user_file)
       if true; puts; puts "***** Sorry, #{user_file} doesn't exist *****"; puts; interactive_menu
       end
    end
  file = File.open("#{user_file}", "r")
  file.readlines.each do |line|
    name, age, hobbies, cohort = line.chomp.split(',')
  append_students(name, age, hobbies, cohort)
  end
  puts
  puts "***** #{user_file} loaded successfully *****"
  puts
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
  puts "***** Student successfully added *****"

  while !name.empty? do
    append_students(name, age, hobbies, cohort)
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    input_students
  end
end

# def age_check
#   numbers = "0123456789"
#   age = STDIN.gets.chomp
#     while !age.include?(numbers)
#      puts "Please enter a valid number"
#      age = STDIN.gets.chomp.to_s
#     end
#    age
# end

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
def print_by_cohort
  month = @students.group_by {|input| input[:cohort]}
    puts "\n"*2
    puts "Students listed by cohort".center(80)
    puts "--------------------------".center(80)
      month.map do |key, value|
        puts
        puts "#{key}".center(80)
        puts "------------".center(80)
        for index in 0..value.size-1 do
      print "#{index+1} #{value[index][:name].center(30)} | Age: #{value[index][:age].center(5)} | Likes: #{value[index][:hobbies].center(20)}"
      puts
    end
    puts
  end
end

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
  if filename.nil?
    filename = "students.csv"
    puts "There are #{@students.count} students on file"
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else puts "Sorry, #{filename} doesn't exist."
  exit
  end
end


try_load_students
interactive_menu
