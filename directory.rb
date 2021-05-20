def input_students
  students = []
  puts "Please enter the name of the students, hobbies, cohort, ect.".center(100)
  puts "To finish, just hit enter twice".center(100)
  name = gets.strip
  
  while !name.empty? do
    puts "Please enter students cohort".center(100)
  
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
  students << { name: name, cohort: cohort.to_sym, hobbies: hobbies, country_of_birth: country_of_birth }
    
    if students.length <= 1
      puts "Now we have #{students.count} student".center(100)
    else
      puts "Now we have #{students.count} students".center(100)
    end
   
    name = gets.strip
  end
  students
end

def cohorts(students)
  cohort_list = [:january, :february, :march, :april, :june,
    :july, :august, :september, :october, :november, :december]
  grouped_cohorts = Hash.new()
  
  students.each do |student|
    month = cohort_list.find_index(student[:cohort])
    if cohort_list[month] == student[:cohort]
      cohort_month = student[:cohort]
      if grouped_cohorts[cohort_month] == nil
        grouped_cohorts[cohort_month] = []
      end
           
      grouped_cohorts[cohort_month].push(student[:name])
    end
    puts "All students in the #{cohort_month} cohort: ".center(100)
    puts grouped_cohorts[cohort_month].join("").center(100)
    end
end

def print_header
  puts "Would you like to see a list of students starting with a specific letter? Enter Y/N".center(100)
  while true do
    @letter = gets.chomp
    if @letter == "Y"
      puts "Please enter a letter to see all students begining with that letter".center(100)
      @letter = gets.chomp
      puts "Showing all students that begin with #{@letter}".center(100)
      break
    elsif @letter == "N"
      break
    end
  end
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print(students)
  @i = 0
  
  if @letter == "Y"
    filtered_students = students.reject { |some| some[:name].chr != @letter || some[:name].length >= 12 }
    puts "Showing all students that begin with the letter #{@letter}".center(100)
    until @i >= filtered_students.length
      student = filtered_students[@i]
      puts "#{@i + 1}. #{student[:name]} (#{student[:cohort]} cohort, hobbies: #{student[:hobbies]}, country: #{student[:country_of_birth]})".center(100)
      @i += 1
    end
  else
    all_students = students.reject { |name| name[:name].length >= 12 }
      
    until @i >= all_students.length
      group1 = all_students[@i]
      puts "#{@i + 1}. #{group1[:name]} (#{group1[:cohort]} cohort, hobbies: #{group1[:hobbies]}, country: #{group1[:country_of_birth]})".center(100)
      @i += 1
    end
  end
end

def print_footer(names)
  if names.length <= 1
    puts "Overall, we have #{@i} great student".center(100)
    puts "-------------".center(100)
  else
    puts "Overall, we have #{@i} great students".center(100)
    puts "-------------".center(100)
  end
end
#nothing happes until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
cohorts(students)
