require_relative 'planet.rb'
require_relative 'solar_system'


def main
  mercury = Planet.new('Mercury', 'dark-grey',2.9772e23, 1.295e8, 'The closest planet to the sun')
  venus = Planet.new('Venus', 'white',3.9772e23, 1.395e8, 'The second closest planet to the sun')
  earth = Planet.new('Earth', 'blue-green', 5.972e24, 1.496e8, 'The only planet known to support life')
  mars = Planet.new('Mars', 'red', 6.972e24, 2.496e8, 'We may live there one day')

  solar_system = SolarSystem.new('Solar')

  solar_system.add_planet(mercury)
  solar_system.add_planet(venus)
  solar_system.add_planet(earth)
  solar_system.add_planet(mars)

  list = solar_system.list_planets
  p list

  found_planet = solar_system.find_planet_by_name('Mercury')
  p found_planet.summary

end

main


