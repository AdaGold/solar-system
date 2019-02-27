require "terminal-table"
require "colorize"

class SolarSystem
  attr_reader :star_name, :planets

  def initialize(star_name)
    @star_name = star_name
    @planets = []
  end

  def add_planet(planet)
    @planets << planet
  end

  def list_planets
    rows = @planets.map do |planet|
      [@planets.index(planet) + 1, planet.name]
    end
    planet_table = Terminal::Table.new :rows => rows, :title => "Planets orbiting #{@star_name}".light_magenta
    return planet_table
  end

  def find_planet_by_name(planet_name)
    found_planets = @planets.select do |planet|
      planet.name.downcase == planet_name.downcase
    end
    if found_planets.length == 0
      puts "\nNo planet was found in this solar system with the name #{planet_name}."
    elsif found_planets.length > 1
      puts "\nMore than one planet was found with the name #{planet_name}."
    else
      puts "\nOne planet found with the name #{planet_name}."
    end
    return found_planets
  end

  def distance_between(planet_one, planet_two)
    if planet_one.distance_from_sun_km && planet_two.distance_from_sun_km
      return (planet_one.distance_from_sun_km - planet_two.distance_from_sun_km).abs
    else
      return nil
    end
  end
end
