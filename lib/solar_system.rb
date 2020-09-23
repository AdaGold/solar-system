require_relative 'planet.rb'
# Wave 2
class SolarSystem
  attr_reader :star_name, :planets

  def initialize(star_name)
    @star_name = star_name
    @planets = []
  end

  def add_planet(planet_instance)
    @planets.push(planet_instance)
  end

  def list_planets
    i = 1
    list = "Planets orbiting #{@star_name}:\n"
    @planets.each do |planet|
      list += "#{i}. #{planet.name}\n"
      i += 1
    end
    return list
  end

  def find_planet_by_name(planet_name)
    planet_found = @planets.find do |planet|
      planet.name.capitalize == planet_name.capitalize
    end
    return planet_found
  end

end

