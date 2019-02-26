require_relative "planet.rb"
require_relative "solar_system.rb"

def main
  solar_system = SolarSystem.new("Sun")

  mercury = Planet.new("Mercury", "dark grey", 4.867e24, 5.791e7, "Mercury is the smallest plannet in our solar system")
  solar_system.add_planet(mercury)

  saturn = Planet.new("Saturn", "yellowish-brown", 5.683e26, 1.434e9, "Saturn is the second largest planet in our solar system")
  solar_system.add_planet(saturn)

  list = solar_system.list_planets

  puts list
end

main
