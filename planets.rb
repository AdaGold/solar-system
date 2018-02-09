class SolarSystem

  attr_accessor :planets

  def initialize
    @planets = Array.new
  end

  def add_new_planet(new_planet)
    @planets.push(new_planet)
  end

  def list_planets
    string = ""
    @planets.each do |planet|
      string += "#{@planets.index(planet) + 1}. #{planet}\n"
    end
    return string
  end
end

kates = SolarSystem.new

kates.add_new_planet("Some Planet")
kates.add_new_planet("Hoth")
kates.add_new_planet("Earth")
kates.add_new_planet("GAH Planet")

puts kates.list_planets
