# Create an interface where the user can interact
# with the solar system and be able to select a
# planet and view information about it.
# Allow your user to add their own planet.

# Planet Class
class Planet
  attr_accessor :name, :age, :distance_from_sun, :year_length, :inhabitants

  # create a planet methods
  def initialize(planet_attributes)
    @name = planet_attributes[:name]
    @age = planet_attributes[:age]
    @distance_from_sun = planet_attributes[:distance_from_sun]
    @year_length = planet_attributes[:year_length]
    @inhabitants = planet_attributes[:inhabitants]
  end

  # list planet attributes method
  def list_attributes
    list = "Name: #{@name}, Age: #{@age}, Distance From Sun: #{@distance_from_sun}, Year Length: #{@year_length}, Inhabitants: #{@inhabitants}"
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
kate = {
  name: "Something",
  age: 45,
  distance_from_sun: "6789mi",
  year_length: "789days",
  inhabitants: "Cone Heads"
}

random = {
  name: "Random",
  age: 4,
  distance_from_sun: "85mi",
  year_length: "9days",
  inhabitants: "Bradlies"
}

kate = Planet.new(kate)
random = Planet.new(random)

planets_array = [kate, random]

kates = SolarSystem.new(planets_array)

# puts kates.list_planets
#
# puts random.list_attributes
####


puts "Which planet would you like to look at? Please select one of the following
planets in the solar system: "

puts "Would you like to make your own planet?"
