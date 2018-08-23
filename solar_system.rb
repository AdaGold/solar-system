class SolarSystem

  attr_reader :star_name, :planets

  #The constructor should take one parameter, star_name, and save it in an instance variable.
  def initialize(star_name)
    @star_name = star_name
    @planets = []
  end


  # Create a method SolarSystem#add_planet, which will take an instance of Planet as a parameter and add it to the list of planets.
  def add_planet(planet)
    @planets << planet
  end


  # Create a method SolarSystem#list_planets, which will return (not puts) a string containing a list of all the planets in the system.
  def list_planets
    list_planets = "Planets orbiting #{star_name} \n"

    @planets.each_with_index do |planet, index|
      list_planets = "#{list_planets}" + "#{index + 1}. #{planet.name}\n"
    end

    return list_planets
  end


  # Search for planet by name and return Planet instance
  def find_planet_by_name
    puts "What planet would you like to know more about? "
    search = "undefined" ###

    # User input validation for available planets
    until @planets.include? (search.capitalize) do
      print "Please enter a known planet in our solar system: "
      search = gets.chomp.downcase

    # Iterate over @planets to match input to Planet instance
    @planets.each do |planet|
      if search != planet.name.downcase
        next
      elsif search == planet.name.downcase
        found_planet = planet
      end

      return found_planet
    end

    end
  end

end
