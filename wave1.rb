class SolarSystem

  attr_accessor :planets

  def initialize(planets = [{}])
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

# creates planets with attributes
out_of_this_world = {
  name: "Out-of-this-World",
  color: "blue"
}
another_planet = {
  name: "NTP",
  color: "green"
}

# creates a new SolarSystem with created planets
kates = SolarSystem.new([out_of_this_world, another_planet])

# adds newly found planet to SolarSystem
nunu_planet = {
  name: "Remulak", 
  color: "off-white"
}

kates.add_new_planet(nunu_planet)

# prints a list of the planets
puts kates.list_planets
