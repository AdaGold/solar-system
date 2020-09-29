require_relative "planet"
require_relative "solar_system"

def main

  solar_system = SolarSystem.new("Sol")

  mercury = Planet.new("Mercury", "gray", 3.285e23, 6.8773e7, "it's the the smallest planet in the Solar System")

  venus = Planet.new("Venus", "white", 4.867e24, 1.078e8, "one day on Venus is longer than a year
      on Earth")  

  earth = Planet.new("Earth", "blue-green", 5.972e24, 1.496e8, "it's the only planet known to support life")
  
  mars = Planet.new("Mars", "red", 6.39e23, 2.109e8, "it would take more than six Mars to fill the volume of Earth")

  jupiter = Planet.new("Jupiter", "yellow", 1.898e27, 7.678e8, "as a gas giant, Jupiter doesn’t have a true surface")

  saturn = Planet.new("Saturn", "yellow", 5.683e26, 1.493e9, "it's the second largest planet in our solar system")

  uranus = Planet.new("Uranus", "blue", 8.681e25, 2.959e9, "it's known as the sideways planet because it rotates on its side")

  neptune = Planet.new("Neptune", "blue", 1.024e26, 4.476e9, "it's the only planet in our solar system not visible to the naked eye")
  
  solar_system.add_planet(mercury)
  solar_system.add_planet(venus)
  solar_system.add_planet(earth)
  solar_system.add_planet(mars)
  solar_system.add_planet(jupiter)
  solar_system.add_planet(saturn)
  solar_system.add_planet(uranus)
  solar_system.add_planet(neptune)

  list = solar_system.list_planets
  puts list


  found_planet = solar_system.find_planet_by_name('orange')
  print found_planet
  puts found_planet == earth

end






main