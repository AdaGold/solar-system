# lib/main.rb
require_relative "planet"

def main
  gorgonzola = Planet.new("Gorgonzola", "yellow", 2.986e24, 1.682e10, "Only planet accesible by the Space-Q-L8R space escalator")
  scamble_dimp_iv = Planet.new("Scamble-Dimp IV", "gross bleu", 3.142e31, 4.001e10, "Worst planet in sector")

  puts "\n"
  puts gorgonzola.summary
  puts "\n"
  puts scamble_dimp_iv.summary
  puts "\n"
end

main
