# lib/main.rb
# this is called the "driver code"

require "awesome_print"
require_relative "planet"
require_relative "solar_system"

def main
  gorgonzola = Planet.new("Gorgonzola", "yellow", 2.986e24, 1.682e10, "Only planet accesible by the Space-Q-L8R space escalator")
  scamble_dimp_iv = Planet.new("Scamble-Dimp IV", "gross bleu", 3.142e31, 4.001e10, "Worst planet in sector")
  puts "\n", gorgonzola.summary
  puts "\n", scamble_dimp_iv.summary, "\n"
end

def sun
  mini_star = SolarSystem.new("Mini Star")

  gorgonzola = Planet.new("Gorgonzola", "yellow", 2.986e24, 1.682e10, "Only planet accesible by the Space-Q-L8R space escalator")
  scamble_dimp_iv = Planet.new("Scamble-Dimp IV", "gross bleu", 3.142e31, 4.001e10, "Worst planet in sector")
  b_6_critney = Planet.new("B-6-Critney", "clear", 1.234e4, 678e9, "Probably made of jello")
  shmorgonzola = Planet.new("Gorgonzola", "shmello", 1.111e11, 1.111e11, "Shmee!")

  planets = [gorgonzola, scamble_dimp_iv, b_6_critney, gorgonzola, shmorgonzola]
  planets.each {|p| mini_star.add_planet(p)}
  list = mini_star.list_planets
  puts "\n", list, "\n"

  found_planets = mini_star.find_planet_by_name('goRgonZOla')
  puts "\nFOUND PLANET(S):\n"
  found_planets.each { |p| puts p }
  puts "\n"
  found_planets.each { |p| puts p.summary, "\n"}
  puts "\n"

end

sun
