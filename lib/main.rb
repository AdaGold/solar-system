# lib/main.rb
# this is called the "driver code"

require "awesome_print"
require_relative "planet"
require_relative "solar_system"

def main
  mini_star = SolarSystem.new("Mini Star")

  gorgonzola = Planet.new("Gorgonzola", "yellow", 2.986e24, 1.682e10, "Only planet accesible by the Space-Q-L8R space escalator")
  scamble_dimp_iv = Planet.new("Scamble-Dimp IV", "gross bleu", 3.142e31, 4.001e10, "Worst planet in sector")
  b_6_critney = Planet.new("B-6-Critney", "clear", 1.234e4, 6.78e9, "Probably made of jello")
  shmorgonzola = Planet.new("Gorgonzola", "shmello", 1.111e11, 1.111e11, "Shmee!")

  planets = [gorgonzola, scamble_dimp_iv, b_6_critney, gorgonzola, shmorgonzola]
  planets.each {|p| mini_star.add_planet(p)}
  list = mini_star.list_planets
  puts "\n", list

  found_first_planet = mini_star.find_planet_by_name("goRgonZOla")
  puts "\nFOUND PLANET:", found_first_planet
  puts found_first_planet.summary

  planet1 = "Scamble-Dimp IV"
  planet2 = "B-6-Critney"

  puts "\nDISTANCE BETWEEN #{mini_star.find_planet_by_name(planet1).name} and #{mini_star.find_planet_by_name(planet2).name}: %.3e" %mini_star.distance_between(planet1, planet2)
end

def planets
end

def exit
end

main

# To Do:
# remove argument errors
# write spec tests for edge cases that I'm ruling out
# write spec tests for SolarSystem class
# Wave 3: https://github.com/sjlee3157/Solar-System/blob/master/README.md
# Grading rubric: https://github.com/sjlee3157/Solar-System/blob/master/feedback.md
