def input_students
  students = []
  puts "Please enter the name of the students and cohort".center(50)
  puts "To finish, just hit enter 3 times".center(50)
  name = gets.strip
  
  while !name.empty? do
    puts "Please enter students cohort".center(50)
  
    while true do
      cohort = gets.strip
      cohort = "november" if cohort.empty?
      puts "You are adding #{name} to cohort #{cohort}, is this correct? Enter Y/N"
      confirm = gets.strip
        if confirm == "Y"
          cohort = cohort
          break
        elsif confirm == "N"
          puts "Enter a cohort"
        else
          puts "Enter Y/N"
        end
    end
      
  puts "Please enter students hobbies".center(50)
  hobbies = gets.strip
  
  puts "Please enter students country of birth".center(50)
  country_of_birth = gets.strip
  students << { name: name, cohort: cohort.to_sym, hobbies: hobbies, country_of_birth: country_of_birth }
    
    if students.length <= 1
      puts "Now we have #{students.count} student".center(50)
    else
      puts "Now we have #{students.count} students".center(50)
    end
   
    name = gets.strip
  end
  students
end

def cohorts(students)
  cohort_list = {}

  students.map { |student| cohort_list[student[:cohort]] = student[:name] }
  cohort_list.map do |cohort| 
    puts "cohort #{cohort.join("")}"
  end

end

def print_header
  puts "Would you like to see a list of students starting with a specific letter? Enter Y/N".center(50)
  
  while true do
    @letter = gets.chomp
    if @letter == "Y"
      puts "Please enter a letter to see all students begining with that letter".center(50)
      @letter = gets.chomp
      break
    elsif @letter == "N"
      break
    end
  end
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print(students)
  @i = 0
  
  if @letter == "Y"
    filtered_students = students.reject { |some| some[:name].chr != @letter || some[:name].length >= 12 }
    puts "Showing all students that begin with the letter #{@letter}".center(50)
    until @i >= filtered_students.length
      student = filtered_students[@i]
      puts "#{@i + 1}. #{student[:name]} (#{student[:cohort]} cohort, hobbies: #{student[:hobbies]}, country: #{student[:country_of_birth]})".center(50)
      @i += 1
    end
  else
    all_students = students.reject { |name| name[:name].length >= 12 }
      
    until @i >= all_students.length
      group1 = all_students[@i]
      puts "#{@i + 1}. #{group1[:name]} (#{group1[:cohort]} cohort, hobbies: #{group1[:hobbies]}, country: #{group1[:country_of_birth]})".center(50)
      @i += 1
    end
  end
end

def print_footer(names)
  if names.length <= 1
    puts "Overall, we have #{@i} great student".center(50)
  else
    puts "Overall, we have #{@i} great students".center(50)
  end
end
#nothing happes until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
cohorts(students)
