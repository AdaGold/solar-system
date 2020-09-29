require_relative "planet"
require_relative "solar_system"

def main

  # wave 2
  # solar_system = SolarSystem.new("Sol")

  # mercury = Planet.new("Mercury", "gray", 3.285e23, 6.8773e7, "it's the the smallest planet in the Solar System")

  # venus = Planet.new("Venus", "white", 4.867e24, 1.078e8, "one day on Venus is longer than a year
  #     on Earth")  

  # earth = Planet.new("Earth", "blue-green", 5.972e24, 1.496e8, "it's the only planet known to support life")
  
  # mars = Planet.new("Mars", "red", 6.39e23, 2.109e8, "it would take more than six Mars to fill the volume of Earth")

  # jupiter = Planet.new("Jupiter", "yellow", 1.898e27, 7.678e8, "as a gas giant, Jupiter doesn’t have a true surface")

  # saturn = Planet.new("Saturn", "yellow", 5.683e26, 1.493e9, "it's the second largest planet in our solar system")

  # uranus = Planet.new("Uranus", "blue", 8.681e25, 2.959e9, "it's known as the sideways planet because it rotates on its side")

  # neptune = Planet.new("Neptune", "blue", 1.024e26, 4.476e9, "it's the only planet in our solar system not visible to the naked eye")
  
  # solar_system.add_planet(mercury)
  # solar_system.add_planet(venus)
  # solar_system.add_planet(earth)
  # solar_system.add_planet(mars)
  # solar_system.add_planet(jupiter)
  # solar_system.add_planet(saturn)
  # solar_system.add_planet(uranus)
  # solar_system.add_planet(neptune)

  # list = solar_system.list_planets
  # puts list


  # found_planet = solar_system.find_planet_by_name('orange')
  # print found_planet
  # puts found_planet == earth

  # wave 3
  
  solar_system = SolarSystem.new("Sol")

  mercury = Planet.new("Mercury", "gray", 3.285e23, 6.8773e7, "it's the the smallest planet in the Solar System")

  venus = Planet.new("Venus", "white", 4.867e24, 1.078e8, "one day on Venus is longer than a year
    on Earth")  

  earth = Planet.new("Earth", "blue-green", 5.972e24, 1.496e8, "it's the only planet known to support life")

  solar_system.add_planet(mercury)
  solar_system.add_planet(venus)
  solar_system.add_planet(earth)

  user_input = 0
 
  until user_input == "exit"
    print "What do you want to do next? List planets, planet details, add planet, or exit? ==> "
    user_input = gets.chomp.downcase 
    if user_input == "list planets"
      list = solar_system.list_planets
      puts list
    elsif user_input == "planet details"
      print "Which planet do you want to learn about? ==> "
      planet_input = gets.chomp.downcase
      find_planet = solar_system.find_planet_by_name(planet_input)
      print find_planet.summary
    elsif user_input == "add planet"
      print "Enter a planet name ==> "
      new_planet_name = gets.chomp.downcase
      print "Enter a planet color ==> "
      new_planet_color = gets.chomp.downcase
      print "Enter the planet's mass in kg ==> "
      new_planet_mass = gets.chomp.downcase
      print "Enter the planet's distance from the sun in km ==> "
      new_planet_distance = gets.chomp.downcase 
      print "Enter a fun fact ==> "
      new_planet_fun_fact = gets.chomp.downcase
      
      new_planet = Planet.new(new_planet_name, new_planet_color, new_planet_mass, new_planet_distance, new_planet_fun_fact)
      solar_system.add_planet(new_planet)
    end 
  end 

end


main