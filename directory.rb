@students = []
@cohort_list = [:january, :february, :march, :april, :june,
:july, :august, :september, :october, :november, :december]
                 
def input_students
  puts "Please enter the name of the students, hobbies, cohort, ect.".center(100)
  puts "To finish, just hit enter twice".center(100)
  name = STDIN.gets.chomp
  # ask unitl name is empty
  while !name.empty? do
    puts "Please enter students cohort month".center(100)
    while true do
      cohort = gets.strip
      cohort = "november" if cohort.empty?
      puts "You are adding #{name} to cohort #{cohort}, is this correct? Enter Y/N".center(100)
      confirm = gets.strip
        if confirm == "Y"
          cohort = cohort
          break
        elsif confirm == "N"
          puts "Enter a cohort".center(100)
        else
          puts "Enter Y/N".center(100)
        end
    end
      
  puts "Please enter students hobbies".center(100)
  hobbies = gets.strip
  
  puts "Please enter students country of birth".center(100)
  country_of_birth = gets.strip
  # add input to student array
  @students << { name: name, cohort: cohort.to_sym, hobbies: hobbies, country_of_birth: country_of_birth }
    
  
  if @students.length <= 1 
    puts "Now we have #{@students.count} student".center(100)
  else
    puts "Now we have #{@students.count} students".center(100)
  end
   
  name = gets.strip
  end
  # add a default value for cohort if invalid input or typo
  @students = @students.each {|cohort| [cohort[:cohort]].include?([@cohort_list]) ? cohort[:cohort] : cohort[:cohort] = :november }
  @students
end

def print_cohorts
  grouped_cohorts = Hash.new()
  
  @students.each do |student|
    month = @cohort_list.find_index(student[:cohort])
    if @cohort_list[month] == student[:cohort]
      @cohort_month = student[:cohort]
      if grouped_cohorts[@cohort_month] == nil
        grouped_cohorts[@cohort_month] = []
      end
           
      grouped_cohorts[@cohort_month].push(student[:name])
    end
    end
  puts "All students in the #{@cohort_month} cohort: ".center(100)
  puts grouped_cohorts[@cohort_month].join("").center(100)
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print_
  @i = 0
  if
    @students.reject { |name| name[:name].length >= 12 }
    until @i >= @students.length
      group1 = @students[@i]
      puts "#{@i + 1}. #{group1[:name]} (cohort: #{group1[:cohort]}, hobbies: #{group1[:hobbies]}, country: #{group1[:country_of_birth]})".center(100)
      @i += 1
    end
  end
end

def print_by_letter
  @i = 0
    puts "Please enter a letter to see all students begining with that letter".center(100)
    @letter = gets.chomp
 
    @students.reject { |some| some[:name].chr != @letter || some[:name].length >= 12 }
    puts "Showing all students that begin with the letter #{@letter}".center(100)
    
    @students.map do |initials|
      if initials[:name].chr != @letter
        puts "No students found with the letter #{@letter}".center(100)
      else
        until @i >= @students.length
          student = @students[@i]
          puts "#{@i + 1}. #{student[:name]} (cohort: #{student[:cohort]}, hobbies: #{student[:hobbies]}, country: #{student[:country_of_birth]})".center(100)
          @i += 1
        end
      end
    end
end

def print_footer
  if @students.length <= 1
    puts "Overall, we have #{@i} great student".center(100)
    puts "-------------".center(100)
  else
    puts "Overall, we have #{@i} great students".center(100)
    puts "-------------".center(100)
  end
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Show students by specfic letter"
    puts "4. Show students by cohort"
    puts "5. Save the list to students.csv"
    puts "9. exit"
end

def save_students
   file = File.open("students.csv", "w")
   @students.each do |student|
       student_data = [student[:name], student[:cohort]]
       csv_line = student_data.join(",")
       file.puts csv_line
   end
   file.close
end

def process(selection)
    case selection
    when "1"
        input_students
    when "2"
      print_header
      print_
      print_footer
    when "3"
      print_by_letter
      print_footer
      when "4"
      print_cohorts
    when "5"
        save_students
    when "9"
      exit
    else
        puts "I don't know what you mean, try again"
    end
end
    
def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end
      
      
#nothing happes until we call the methods
# students = input_students
# print_header
# print(students)
# print_footer(students)
# print_cohorts(students)
interactive_menu