require_relative 'solar_system'
require_relative 'planet'

def main
  earth = Planet.new('Earth', 'blue-green', 5.972e24, 1.496e8, 'it is the only planet known to support life')
  pluto = Planet.new('Pluto', 'varied, grey-orange', 1.30900e22, 5.906e9, 
  'it is named after the Roman god of the underworld')
  mercury = Planet.new('Mercury', 'yellow-blue', 3.285e23, 5.791e7, 
  'it is the fastest planet completing a full circle around the sun in 88 days')
  venus = Planet.new('Venus', 'yellow', 4.867e24, 1.089e8, 
  'Venus is the hottest planet in our solar system')
  mars = Planet.new('Mars', 'red', 6.39e23, 1.496e8, 
  'it is suspected that billions of years ago Mars was much warmer and had water')
  jupiter = Planet.new('Jupiter', 'white and red', 1.898e27, 7.779e8, 
  'Jupiter is almost twice as large as any other planet in the solar system')
  saturn = Planet.new('Saturn', 'yellow', 5.683e26, 1.433e9, 
  'Saturn has the largest and most complex rings of any planet in our solar system')
  uranus = Planet.new('Uranus', 'light blue', 8.681e25, 2.877e9, 
  'Uranus rotates at an almost 90-degree angle from the plane of its orbit')
  neptune = Planet.new('Neptune', 'blue', 1.024e26, 4.503e9, 
  'Neptune was the first planet located through mathematical calculations')

  solar_system = SolarSystem.new('Sol')

  solar_system.add_planet(earth)
  solar_system.add_planet(pluto)
  solar_system.add_planet(mercury)
  solar_system.add_planet(venus)
  solar_system.add_planet(mars)
  solar_system.add_planet(jupiter)
  solar_system.add_planet(saturn)
  solar_system.add_planet(uranus)
  solar_system.add_planet(neptune)

  def display_details(solar_system)
    puts "Name a planet you want to see details about."
    list = solar_system.list_planets
    puts list
    planet_input = gets.chomp.downcase
    found_planet = solar_system.find_planet_by_name(planet_input)
    # Handing invalid user input
    puts found_planet ? found_planet.summary : "Planet not found"
  end

  def add_planet(solar_system)
    print "What is the name of a planet you want to add? => "
    planet_name = gets.chomp.downcase
    print "What is a color of #{planet_name}? => "
    planet_color = gets.chomp.downcase
    print "What is a mass of #{planet_name}? => "
    planet_mass = gets.chomp.to_i
    print "What is its distance from the Sun in km? => "
    distance_from_sun_km = gets.chomp.to_i
    print "What is a fun fact about #{planet_name}? => "
    fun_fact = gets.chomp.downcase
    new_planet = Planet.new(planet_name, planet_color, planet_mass, distance_from_sun_km, 
    fun_fact)
    solar_system.add_planet(new_planet)
    puts new_planet.summary
  end
  
  puts "This program will help you learn more about planets in the Sol solar system."
  print "Choose one option:  'list planets', 'planet details', 'add planet', and 'exit' to exit the program. => "
  user_command = gets.chomp  
  until user_command == 'exit'
    case user_command
    when 'list planets'
      list = solar_system.list_planets
      puts list
    when 'planet details'
      display_details(solar_system)
    when 'add planet'
      add_planet(solar_system)
    end
    print "Choose one option:  'list planets', 'planet details', 'add planet', and 'exit' to exit the program. => "
    user_command = gets.chomp
  end
end

main