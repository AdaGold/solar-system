require_relative "planet.rb"
require_relative "solar_system.rb"

def main

  #Added planets' info to each planet instance
  solar_system = SolarSystem.new("Sun")

  earth = Planet.new("Earth", "blue-green", 5.972e24, 1.496e8, "Only planet known to support life")
  solar_system.add_planet(earth)

  mercury = Planet.new("Mercury", "dark grey", 4.867e24, 5.791e7, "Mercury is the smallest plannet in our solar system")
  solar_system.add_planet(mercury)

  neptune = Planet.new("Neptune", "purple", 1.024e26, 4.495e9, "It is four times wider than Earth")
  solar_system.add_planet(neptune)

  saturn = Planet.new("Saturn", "yellowish-brown", 5.683e26, 1.434e9, "Saturn is the second largest planet in our solar system")
  solar_system.add_planet(saturn)

  venus = Planet.new("Venus", "opal", 4.867e24, 1.082e8, "It has intense heat and volcanic activity")
  solar_system.add_planet(venus)

  ######## Prompt User's inputs########

  puts "Welcome to Solar System program!"
  puts "What would you like to do?"
  puts "[list planets] [planet details] [add planet] [exit]"
  user_input = gets.chomp

  until user_input.downcase == "exit"
    case user_input.downcase
    when "list planets"
      puts solar_system.list_planets
    when "planet details"
      puts "Which planet would you like to learn about?"
      planet_details_input = gets.chomp
      found_planet = solar_system.find_planet_by_name(planet_details_input.downcase)
      puts found_planet.summary
    when "add planet"
      solar_system.user_added_planet
      puts solar_system.list_planets
    end

    puts "What would you like to do next?"
    puts "[list planets] [planet details] [add planet] [exit]"
    user_input = gets.chomp
  end
end

main
