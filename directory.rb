def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit enter twice"
  # Create an empty array
  students = []
  # get the first name
  name = gets.chomp
  #while name is not empty, repeat this code.
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
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
  filtered_students = students.reject { |some| some[:name].chr != @letter }
  filtered_students = filtered_students.reject { |student| student[:name].length >= 12 }
    
  puts "Showing all students that begin with the letter #{@letter}"
    
  until @i >= filtered_students.length
    puts "#{@i + 1}. #{filtered_students[@i][:name]} (#{filtered_students[@i][:cohort]} cohort)"
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
