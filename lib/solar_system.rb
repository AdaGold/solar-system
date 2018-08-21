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

  # def list_planets
  #   return sprintf(%s %s"\n"Planets orbiting #{@star_name}\n1.\t
  # end

end
