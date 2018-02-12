# Create an interface where the user can interact
# with the solar system and be able to select a
# planet and view information about it.
# Allow your user to add their own planet.

# mixins
class String
  # mixin to allow to check for numeric strings
  def numeric?
    Float(self) != nil rescue false
  end
  # mixin to allow first letter of each word in a string to be capitalized
  def each_first_letters
    self.split.map(&:capitalize).join(' ')
  end
end

### Start Solar System class
class SolarSystem
  attr_accessor :planets

  # create new solar system
  def initialize(planets_array)
    @planets = planets_array
  end

  # returns a list of strings
  def list_planets
    counter = 0
    list = ""
    @planets.each do |planet|
      counter += 1
       list += "#{counter}. #{planet.name.each_first_letters}\n"
    end

    list += "#{counter + 1}. **CREATE NEW PLANET**"
    return list
  end

  # adds a new to the solar system
  def add new_planet
    @planets << new_planet
  end
end
### End Solar System class

### Start Planet Class
class Planet
  attr_accessor :name, :age, :size, :visitor_count, :inhabitants

  # create a planet methods
  def initialize(planet_attributes)
    @name = planet_attributes[:name]
    @age = planet_attributes[:age]
    @size = planet_attributes[:size]
    @visitor_count = planet_attributes[:visitor_count]
    @inhabitants = planet_attributes[:inhabitants]
  end

  # list planet attributes method
  def list_attributes
    list = "Age: #{@age} Earth years old\nSize: #{@size}\nVisitor Count: #{@visitor_count}\nInhabitants: #{@inhabitants}\n"
    return list
  end
end

# method to create a new planet
def create_planet
  new_planet ={}

  print "\nWhat is the name of the planet? "
  new_planet[:name] = gets.chomp.downcase

  print "How old is #{new_planet[:name].each_first_letters} in Earth years? "
  new_planet[:age] = gets.chomp.to_i

  print "What is the size of #{new_planet[:name].each_first_letters}? "
  new_planet[:size] = gets.chomp

  print "How many visitors does #{new_planet[:name].each_first_letters} get? "
  new_planet[:visitor_count] = gets.chomp

  print "Who or what are #{new_planet[:name].each_first_letters} inhabitants? "
  new_planet[:inhabitants] = gets.chomp

  new_planet = Planet.new(new_planet)

  return new_planet
end
### End Planet Class

# Exisiting Planets
katmai = Planet.new({
  name: "katmai national park",
  age: 38,
  size: "16,564.09 sq km",
  visitor_count: "37,818",
  inhabitants: "Bears"
})

grand_canyon = Planet.new({
  name: "grand canyon national park",
  age: 99,
  size: "1,901.972 sq mi",
  visitor_count: "5,969,811",
  inhabitants: "Bison"
})

# creates an array of exisiting planets
planets_array = [katmai, grand_canyon]

# create national park solar system
national_parks = SolarSystem.new(planets_array)

### Start User interface
quit = false

  puts "Welcome to the National Park Universe!"

while !quit
  print "\nWould you like to look at the characteristics of a planet already in the"
  puts " National Park solar system, or would out like to create a new planet?"
  puts "Here are the planets currently in the solar system!"
  puts national_parks.list_planets

  print "\nPlease make a selection: "
  input = gets.chomp

  # evaluates user input
  while input.to_i > planets_array.count + 1 || !input.numeric?
    print "That is an invalid selection. Please try again: "
    input = gets.chomp
  end

  input = input.to_i # converts input to integer once string "input" is numeric

  # if input is to create a new planet
  if input == planets_array.count + 1
    new_planet = create_planet
    national_parks.add(new_planet)
    print "\nA new planet called #{new_planet.name.each_first_letters} has been"
    puts " created and saved to the solar system"
  # else list characteristics of chosen planet
  else
    puts "\nHere's the information for #{planets_array[input - 1].name.each_first_letters}"
    puts planets_array[input - 1].list_attributes
  end

  ###  starts quit program process
  print "\n\nWould you like another look at the National Park solar system? (y/n) "
  quit_input = gets.chomp.downcase

  case quit_input
  when "y", "yes", "yep", "yea"
    quit = false
  when "n", "nope", "nah"
    print "Thank you for using the visiting the National Park Universe program! Good bye!"
    quit = true
  else
    while !["y", "yes", "yep", "yea", "n", "nope", "nah"].include?(quit_input)
      print "Would you like to try another calulation? (y/n) "
      quit_input = gets.chomp.downcase
    end
  end
end
