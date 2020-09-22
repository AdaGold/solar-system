require_relative 'planet.rb'

def main
  earth = Planet.new('Earth', 'blue-green', 5.972e24, 1.496e8, 'Only planet known to support life')
  p earth.summary
end

main


