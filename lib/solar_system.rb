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

  def find_planet_by_name(string)
    unless string.is_a? String then raise ArgumentError, "Search term must be a String" end

    @planets_by_name = @planets.map{ |p| p.name.upcase }
    query = string.upcase

    unless @planets_by_name.include? (query) then raise ArgumentError, "Invalid planet (planet not found in this solar system)" end

    indices = []
    @planets_by_name.each_with_index { |p,i| if p == query then indices << i end }
    return found_planets = indices.map{ |i| @planets[i]}

  end

  # def distance_between(planet1, planet2)
  #   unless planet1.is_a? Planets && planet2)
  #   return #distance between them
  # end

end
