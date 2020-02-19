class SolarSystem
  attr_reader :star_name, :planets

  def initialize(star_name)
    @star_name = star_name
    @planets = Array.new
  end

  def add_planet(planet)
    @planets << planet
  end

  def find_planet_by_name(planet_string)
    return @planets.find { |planet| planet.name.downcase == planet_string.downcase }
  end

  def list_planets
    planets_list = "Planets orbiting #{@star_name}:"
    @planets.each_with_index do |planet, i|
      planets_list += "\n#{i+1}. #{planet.name}"
    end
    planets_list
  end
end