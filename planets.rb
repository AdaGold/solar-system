class SolarSystem

  attr_accessor :planets

  def initialize(planets = ["Some Planet", "Hoth", "Earth", "GAH"])
    @planets = planets
  end

  # method to add new planets
  def add_new_planet(new_planet)
    @planets.push(new_planet)
  end
  # method that returns a list of strings
  def list_planets
    list = ""
    @planets.each do |planet|
      list += "#{@planets.index(planet) + 1}. #{planet}\n"
    end
    return list
  end
end

kates = SolarSystem.new

kates.add_new_planet("Out-of-this-World")

puts kates.list_planets
