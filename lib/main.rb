# lib/main.rb
require_relative "planet"
require_relative "solar_system"

def main
  gorgonzola = Planet.new("Gorgonzola", "yellow", 2.986e24, 1.682e10, "Only planet accesible by the Space-Q-L8R space escalator")
  scamble_dimp_iv = Planet.new("Scamble-Dimp IV", "gross bleu", 3.142e31, 4.001e10, "Worst planet in sector")
  puts "\n", gorgonzola.summary
  puts "\n", scamble_dimp_iv.summary, "\n"
end

def sun
  gorgonzola = Planet.new("Gorgonzola", "yellow", 2.986e24, 1.682e10, "Only planet accesible by the Space-Q-L8R space escalator")
  scamble_dimp_iv = Planet.new("Scamble-Dimp IV", "gross bleu", 3.142e31, 4.001e10, "Worst planet in sector")
  b_6_critney = Planet.new("B-6-Critney", "clear", 1.234e4, 678e9, "Probably made of jello")
  mini_star = SolarSystem.new("Mini Star")
  planets = [gorgonzola, scamble_dimp_iv, b_6_critney]
  planets.each {|p| mini_star.add_planet(p)}
  puts "\n", mini_star.list_planets, "\n"
end

# main
sun
