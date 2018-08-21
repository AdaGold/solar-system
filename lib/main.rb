# lib/main.rb
require_relative "planet"

def main
  gorgonzola = Planet.new("Gorgonzola", "yellow", 2.986e24, 1.682e10, "Only planet accesible by the Space-Q-L8R space escalator")
  scamble_dimp_iv = Planet.new("Scamble-Dimp IV", "gross bleu", 3.142e31, 4.001e10, "Worst planet in sector")
  puts "\n", gorgonzola.summary
  puts "\n", scamble_dimp_iv.summary, "\n"

  return scamble_dimp_iv
end

main


puts main.color
b_6_critney = Planet.new("B-6-Critney", "clear", 1.234e4, 678e9, "Made of jello")
puts b_6_critney.color
