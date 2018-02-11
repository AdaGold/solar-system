# Create an interface where the user can interact
# with the solar system and be able to select a
# planet and view information about it.
# Allow your user to add their own planet.

# Planet Class
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
    list = "Name: #{@name}\nAge: #{@age}\nSize: #{@size}\nVisitor Count: #{@visitor_count}\nInhabitants: #{@inhabitants}\n"
    return list
  end
end

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
       list += "#{counter}. #{planet.name}\n"
    #   list += "#{planet.name.index + 1}. #{planet.name}\n"
    end
    return list
  end
end

planets_array = []
#### test new planets
katmai = {
  name: "Katmai National Park",
  age: 38,
  size: "16,564.09 km",
  visitor_count: "37,818",
  inhabitants: "Bears"
}

grand_canyon = {
  name: "Grand Canyon National Park",
  age: 99,
  size: "5,969,811",
  visitor_count: "9days",
  inhabitants: "Bison"
}

katmai = Planet.new(katmai)
grand_canyon = Planet.new(grand_canyon)

planets_array = [katmai, grand_canyon]

national_parks = SolarSystem.new(planets_array)

# puts national_parks.list_planets
#
# puts grand_canyon.list_attributes
####

puts "Welcome to the National Park Universe!"

puts "Would you like to look at the charcaterists of a planet already in the solar system, or would out like to create a new planet?"
puts national_parks.list_planets


puts "Would you like to make your own planet?"
