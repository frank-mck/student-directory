def input_students
  puts "Please enter the name of the students and cohort"
  puts "To finish, just hit enter 3 times"
  # Create an empty array
  students = []
  # get the first name
  name = gets.strip
  # ask students which cohort
  puts "Please enter students cohort"
  cohort = gets.strip
  #Default value is given if not
  cohort = "november" if cohort.empty?
  #ask for students hobbies
  puts "Please enter students hobbies"
  hobbies = gets.strip
  #ask for students country
  puts "Please enter students country of birth"
  country_of_birth = gets.strip
  
  #while name is not empty, repeat this code.
  while !name.empty? do
    students << { name: name, cohort: cohort.to_sym, hobbies: hobbies, country_of_birth: country_of_birth }
   if students.length <= 1
       puts "Now we have #{students.count} student"
   else
       puts "Now we have #{students.count} students"
   end
    # get another name from the user
    name = gets.strip
    # if we have been given a name, ask students for hobbies, country ect, again
    if !name.empty?
      puts "Please enter students cohort"
      cohort = gets.strip
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

def cohorts(students)
#     cohort_list = ["january", "february", "march", "april", "june", "july", "august", "september", "october", "november", "december"]
#   i = 0
   
#   while i < students.length
#   names = students.map { |name| name[:name] }
#   cohorts = students.map { |cohort| cohort[:cohort] }
   
   students.sort_by! { |cohort| cohort[:cohort] }
#   group = []
   
#   while i < cohort_list.length do
#       name = students[i][:name]
#       cohort = students[i][:cohort]
#       group << {"All students in #{cohort} cohort: #{name}"}
       
#       i += 1
#   end
#   group
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
  if names.length <= 1
    puts "Overall, we have #{@i} great student"
  else
    puts "Overall, we have #{@i} great students"
  end
end
#nothing happes until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
cohorts(students)
