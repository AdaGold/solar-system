# lib/solar_system.rb

class SolarSystem

  attr_reader :star_name, :planets

  def initialize(star_name)
    @star_name = star_name
    @planets = []
  end

  def add_planet(planet)
    # don't do this
    raise ArgumentError, "Argument must be instance of Planet class" unless planet.is_a? Planet
    @planets << planet
  end

  def list_planets
    list = "Planets orbiting #{@star_name}:\n"
    @planets.each_with_index {|p, i| list << "#{i+1}. #{p.name}\n" }
    return list
  end

  def find_planet_by_name(string)
  # returns an Array of all duplicates
    raise ArgumentError, "Search term must be a String" unless string.is_a? String

    @planets_by_name = @planets.map{ |p| p.name.upcase }
    query = string.upcase

    raise ArgumentError, "Invalid planet (planet not found in this solar system)" unless @planets_by_name.include? (query)

    indices = []
    @planets_by_name.each_with_index { |p,i| if p == query then indices << i end }
    return found_planets = indices.map{ |i| @planets[i]}
  end

  def find_first_planet_name(string)
  # returns first Planet that matches your search
    raise ArgumentError, "Search term must be a String" unless string.is_a? String

    @planets_by_name = @planets.map{ |p| p.name.upcase }
    query = string.upcase

    unless @planets_by_name.include? (query) then raise ArgumentError, "Invalid planet (planet not found in this solar system)" end

    return found_planet = @planets[@planets_by_name.index(query)]
  end

  def distance_between(planet1, planet2)
    planet1 = find_first_planet_name(planet1)
    planet2 = find_first_planet_name(planet2)

    return (planet1.distance_from_sun_km - planet2.distance_from_sun_km).abs
  end

end
