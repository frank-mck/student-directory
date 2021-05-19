def input_students
  puts "Please enter the name of the students and cohort"
  puts "To finish, just hit enter 3 times"
  # Create an empty array
  students = []
  # get the first name
  name = gets.strip
  
  puts "Please enter students cohort"
  cohort = gets.strip
  cohort = "november" if cohort.empty?
  
  puts "Please enter students hobbies"
  hobbies = gets.strip
  
  puts "Please enter students country of birth"
  country_of_birth = gets.strip
  
  #while name is not empty, repeat this code.
  while !name.empty? do
    students << {name: name, cohort: cohort.to_sym, hobbies: hobbies, country_of_birth: country_of_birth }
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.strip
    
    if !name.empty?
    # get another hobbies from the user
    puts "Please enter students hobbies"
    hobbies = gets.strip
    # enter another coutry of birth from the user
    puts "Please enter students country of birth"
    country_of_birth = gets.strip
    end
  end
  # return the array of students
  students
end

def print_header
  puts "Enter a letter to show all students that begin with that letter"
  @letter = gets.chomp
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  @i = 0
  filtered_students = students.reject { |some| some[:name].chr != @letter || some[:name].length >= 12 }
  
  puts "Showing all students that begin with the letter #{@letter}"
    
  until @i >= filtered_students.length
    student = filtered_students[@i]
    
  cohort = "november" if cohort.nil?
    
    puts "#{@i + 1}. #{student[:name]} (#{student[:cohort]} cohort, hobbies: #{student[:hobbies]}, country: #{student[:country_of_birth]})"
    @i += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{@i} great students"
end
#nothing happes until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
