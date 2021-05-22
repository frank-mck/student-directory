@students = []
@cohort_list = [:january, :february, :march, :april, :june,
:july, :august, :september, :october, :november, :december]
  
  def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Show students by specfic letter"
    puts "4. Show students by cohort"
    puts "5. Save students"
    puts "6. Load students"
    puts "9. exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
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
    when "6"
      load_students
    when "9"
      exit
    else
        puts "I don't know what you mean, try again"
    end
end
                 
def input_students
  puts "Please enter the name of the students, hobbies, cohort, ect.".center(100)
  puts "To finish, just hit enter twice".center(100)
  name = STDIN.gets.chomp
  while !name.empty? do
    puts "Please enter students cohort month".center(100)
    while true do
      cohort = STDIN.gets.chomp
      puts "You are adding #{name} to cohort #{cohort}, is this correct? Enter Y/N".center(100)
      confirm = STDIN.gets.chomp
        if confirm == "Y"
          break
        elsif confirm == "N"
          puts "Enter a cohort".center(100)
        else
          puts "Enter Y/N".center(100)
        end
    end
  puts "Please enter students hobbies".center(100)
  hobbies = STDIN.gets.chomp
  puts "Please enter students country of birth".center(100)
  country_of_birth = STDIN.gets.chomp
  @students << { name: name, cohort: cohort, hobbies: hobbies, country_of_birth: country_of_birth }
    
  if @students.length <= 1 
    puts "Now we have #{@students.count} student".center(100)
  else
    puts "Now we have #{@students.count} students".center(100)
  end
  name = STDIN.gets.chomp
  end
  # add a default value for cohort if invalid input or typo
  @students = @students.each {|cohort| @cohort_list.find_index(cohort[:cohort].to_sym) == nil ? cohort[:cohort] = :november : cohort[:cohort]}
  @students
end

def print_cohorts
  @grouped_cohorts = Hash.new()
  @students.each do |student|
    month = @cohort_list.find_index(student[:cohort].to_sym)
    if @cohort_list[month] == student[:cohort]
      @cohort_month = student[:cohort]
      if @grouped_cohorts[@cohort_month] == nil
        @grouped_cohorts[@cohort_month] = []
      end
           
      @grouped_cohorts[@cohort_month].push(student[:name])
    end
    end
    @it = 0
    while @it <= 10 do
      puts "Students in #{@cohort_list[@it]} cohort: ".center(100)
      if @grouped_cohorts[@cohort_list[@it]] == nil
        puts "0 students".center(100)
        puts " "
      else
        puts @grouped_cohorts[@cohort_list[@it]].join(", ").center(100)
        puts " "
      end
      @it += 1
    end
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print_
  @i = 0
    @students.reject { |name| name[:name].length >= 12 }
    @students.each { |student| 
    puts "#{@i + 1}. #{student[:name]} (cohort: #{student[:cohort]}, hobbies: #{student[:hobbies]}, country: #{student[:country_of_birth]})".center(100); @i += 1 }
end

def print_by_letter
  @i = 0
  puts "Please enter a letter to see all students begining with that letter".center(100)
  @letter = STDIN.gets.chomp
  filtered_students = @students.reject { |some| some[:name].chr != @letter || some[:name].length >= 12 }
  filtered_students.map do |initials|
    if initials[:name].chr != @letter
      puts "No students found with the letter #{@letter}".center(100)
    else
      puts "Showing all students that begin with the letter #{@letter}".center(100)
    end
    filtered_students.each {|student| 
      puts "#{@i + 1}. #{student[:name]} (cohort: #{student[:cohort]}, hobbies: #{student[:hobbies]}, country: #{student[:country_of_birth]})".center(100); @i += 1 }
  end
end

def print_footer
    puts "Overall, we have #{@i} great student#{@i > 1 ? "s" : ""}".center(100)
    puts "-------------".center(100)
end

def save_students
    file = File.open("students.csv", "w")
    @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobbies], student[:country_of_birth]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
    file.close
end

def load_students(filename = "students.csv")
    file = File.open(filename, "r")
    file.readlines.each do |line|
      name, cohort, hobbies, country_of_birth = line.chomp.split(",")
      @students << {name: name, cohort: cohort.to_sym, hobbies: hobbies, country_of_birth: country_of_birth }
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if filename.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} dosent exist."
    exit
  end
end

interactive_menu