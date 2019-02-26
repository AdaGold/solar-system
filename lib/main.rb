require_relative "planet.rb"
require_relative "solar_system.rb"

def main
  solar_system = SolarSystem.new("Sun")

  mercury = Planet.new("Mercury", "dark grey", 4.867e24, 5.791e7, "Mercury is the smallest plannet in our solar system")
  solar_system.add_planet(mercury)

  saturn = Planet.new("Saturn", "yellowish-brown", 5.683e26, 1.434e9, "Saturn is the second largest planet in our solar system")
  solar_system.add_planet(saturn)

  earth = Planet.new("Earth", "blue-green", 5.972e24, 1.496e8, "Only planet known to support life")
  solar_system.add_planet(earth)

  list = solar_system.list_planets

  puts list

  found_planet = solar_system.find_planet_by_name("sATURN")
  puts found_planet
  puts found_planet.summary
end

main
