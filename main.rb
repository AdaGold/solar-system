# main.rb
require_relative 'planet'
require_relative 'solar_system.rb'


def main
  solar_system = SolarSystem.new('Sol')

  mercury = Planet.new("Mercury", "grey", 3.3011e23, 5.79e7, "is named after a Roman God")
  solar_system.add_planet(mercury)

  venus = Planet.new("Venus", "yellowish-white", 4.87e24, 1.082e8, "may have had oceans in the past")
  solar_system.add_planet(venus)

  earth = Planet.new('Earth', 'blue-green', 5.972e24, 1.496e8, 'is the only planet known to support life')
  solar_system.add_planet(earth)

  mars = Planet.new('Mars', 'reddish', 6.42e23, 2.279e8, 'has a large amount of underground ice')
  solar_system.add_planet(mars)

  jupiter = Planet.new('Jupiter', 'white-orange', 1.8982e27, 7.786e8, 'has at least 79 moons')
  solar_system.add_planet(jupiter)

  saturn = Planet.new('Saturn', 'pale-gold', 5.6834e26, 1.433e9, 'has a ring system made of ice, rock, and dust')
  solar_system.add_planet(saturn)

  uranus = Planet.new('Uranus', 'pale-blue', 8.68e25, 2.873e9, 'is visible to the naked eye')
  solar_system.add_planet(uranus)

  neptune = Planet.new('Neptune', 'pale-blue', 1.03e26, 4.495e9, 'is the farthest planet from the Sun that we know of in our solar system')
  solar_system.add_planet(neptune)

  list = solar_system.list_planets

  # Method to add planet from user input
  def add_planet_from_user
    print "What is the name of the planet you would like to add? "
    name = gets.chomp.capitalize

    print "What color is the planet? "
    color = gets.chomp.downcase

    print "What is the mass of the planet in kilograms? "
    mass = gets.chomp.to_i

    print "How far away is the planet from the sun in kilometers? "
    distance = gets.chomp.to_i

    print "Let's add a fun fact about the planet! Complete the sentence. #{name}.."
    fact = gets.chomp.downcase

    new_planet = Planet.new(name, color, mass, distance, fact)
    return new_planet
  end

# Method for getting valid user input for control loop
  def get_valid_user_choice ###
    print "\nWhat would you like to do next? \n(Enter 'list planets', 'planet details', 'add planet', or 'exit'.) "
    @user_choice = gets.chomp.downcase

    until @user_choice == "list planets" || @user_choice == "exit" || @user_choice == "planet details" || @user_choice == "add planet"
      puts "Please enter a valid choice: list planets, planet details, add planet, or exit."
      @user_choice = gets.chomp.downcase
    end
  end

  puts "Welcome to our Solar System model!"

# Control loop with user interaction options
  loop do
    get_valid_user_choice

    # Make separate method?
    case @user_choice
    when "list planets"
      puts solar_system.list_planets
    when "planet details"
      puts solar_system.find_planet_by_name.summary
    when "add planet"
      solar_system.add_planet(add_planet_from_user)
    when "exit"
      puts "Goodbye! See you next time!"
      exit
    end
  end


  found_planet = solar_system.find_planet_by_name('Earth')

  # found_planet is an instance of class Planet
  # puts found_planet
  # => #<Planet:0x00007fe7c2868ee8>

  puts found_planet.summary
  # => Earth is a blue-green planet ...
end

main
