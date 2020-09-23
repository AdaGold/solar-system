# Wave 3

require_relative 'planet.rb'
require_relative 'solar_system'


def build_solar_system

  solar_system = SolarSystem.new('Solar')

  mercury = Planet.new('Mercury', 'dark-grey',2.9772e23, 1.295e8, 'The closest planet to the sun')
  venus = Planet.new('Venus', 'white',3.9772e23, 1.395e8, 'The second closest planet to the sun')
  earth = Planet.new('Earth', 'blue-green', 5.972e24, 1.496e8, 'The only planet known to support life')
  mars = Planet.new('Mars', 'red', 6.972e24, 2.496e8, 'We may live there one day')

  solar_system.add_planet(mercury)
  solar_system.add_planet(venus)
  solar_system.add_planet(earth)
  solar_system.add_planet(mars)

  return solar_system
end

def user_choice
  puts "Welcome, what would you like to do?"
  puts "Your choices are: list planets, planet details, add planet, or exit"
  print "Choice:"
  choice = gets.chomp.downcase

  return choice
end

def planet_details
  puts "Which planet would you like to learn about?\n"
  puts
  puts build_solar_system.list_planets
  print "\nPlanet:"
  planet_choice = gets.chomp.downcase

  return planet_choice
end

def add_user_planet
  puts "Let's add a planet! Enter the following information!"
  puts ""
  puts "What is the name of the planet?"
  name = gets.chomp.downcase
  puts "What color is the planet?"
  color = gets.chomp.downcase
  puts "What is the mass of the planet in kg?"
  mass_kg = gets.chomp.to_i
  puts "What is the distance from the sun in km?"
  distance_from_sun_km = gets.chomp.to_i
  puts "What is a fun fact about the planet?"
  fun_fact = gets.chomp

  new_planet = Planet.new(name, color, mass_kg, distance_from_sun_km, fun_fact)

  return new_planet
end

def main

  solar_system = build_solar_system

  option_list_choice = user_choice

  while option_list_choice != "exit"

    case option_list_choice
    when "list planets"
      puts solar_system.list_planets
    when "planet details"
      user_planet = planet_details
      found_planet = solar_system.find_planet_by_name(user_planet)
      if found_planet
        p found_planet.summary
      else
        puts " \"#{user_planet}\" could not be found."
      end
    when "add planet"
      new_planet = add_user_planet
      solar_system.add_planet(new_planet)
      puts "Great, #{new_planet.name} has been added to the solar system!"
      puts solar_system.list_planets
    else
      puts "The planet #{new_planet} is not on the list."
      option_list_choice = user_choice
      main
    end
    exit
  end
  return puts "\nThanks for stopping by!"
end

main
