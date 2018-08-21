# lib/solar_system.rb

class SolarSystem

  attr_reader :star_name, :planets

  def initialize(star_name)
    @star_name = star_name
    @planets = []
  end

  def add_planet(planet)
    unless planet.is_a? Planet then raise ArgumentError, "Argument must be instance of Planet class" end
    @planets << planet
  end

  def list_planets
    list = "Planets orbiting #{@star_name}:\n"
    @planets.each_with_index {|p, i| list << "#{i+1}. #{p.name}\n" }
    return list
  end

end
