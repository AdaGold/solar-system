require_relative 'solar_system'
require_relative 'planet'

def main(planet)
  puts planet.summary
end

solar_system = SolarSystem.new('Sol')

EARTH = Planet.new('Earth', 'blue-green', 5.972e24, 1.496e8, 
'the only planet known to support life')
PLUTO = Planet.new('Pluto', 'varied, grey-orange', 1.30900e22, 5.906e9, 
'Named after the Roman god of the underworld')
MERCURY = Planet.new('Mercury', 'yellow-blue', 3.285e23, 5.791e7, 
'Mercury is the fasest planet. Completing a full circle around the sun in 88 days')
VENUS = Planet.new('Venus', 'yellow', 4.867e24, 1.089e8, 
'Venus is the hottest planet in our solar system')
MARS = Planet.new('Mars', 'red', 6.39e23, 1.496e8, 
'it is suspected that billions of years ago Mars was much warmer and had water')
JUPITER = Planet.new('Jupiter', 'white and red', 1.898e27, 7.779e8, 
'Jupiter is almost twice as large as any other planet in the solar system')
SATURN = Planet.new('Saturn', 'yellow', 5.683e26, 1.433e9, 
'Saturn has the largest and most complex rings of any planet in our solar system')
URANUS = Planet.new('Uranus', 'light blue', 8.681e25, 2.877e9, 
'Uranus rotates at an almost 90-degree angle from the plane of its orbit')
NEPTUNE = Planet.new('Neptune', 'blue', 1.024e26, 4.503e9, 
'Neptune was the first planet located through mathematical calculations')

solar_system.add_planet(EARTH)
solar_system.add_planet(PLUTO)
solar_system.add_planet(MERCURY)
solar_system.add_planet(VENUS)
solar_system.add_planet(MARS)
solar_system.add_planet(JUPITER)
solar_system.add_planet(SATURN)
solar_system.add_planet(URANUS)
solar_system.add_planet(NEPTUNE)


list = solar_system.list_planets
puts list

found_planet = solar_system.find_planet_by_name('pluto')
p found_planet.summary