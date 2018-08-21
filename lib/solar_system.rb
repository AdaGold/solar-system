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

  def find_planet_by_name(query)
  # returns first Planet that matches your search
    raise ArgumentError, "Search term must be a String" unless query.is_a? String

    @planets_by_name = @planets.map{ |p| p.name.upcase }
    query = query.upcase

    raise ArgumentError, "Invalid planet (planet not found in this solar system)" unless @planets_by_name.include? (query)

    if @planets_by_name.count{|p|p == query} > 1
      puts find_planet_duplicates_with_warning(find_all_planet_duplicates_by_name(query)) # PRINT FROM MAIN.RB ONLY
    end
    return found_planet = @planets[@planets_by_name.index(query)]
  end

  def find_all_planet_duplicates_by_name(query)
  # returns a Hash of all duplicates
  @planets_by_name = @planets.map{ |p| p.name.upcase } # I THOUGHT I DIDNT NEED THIS
    indices = []
    @planets_by_name.each_with_index { |p,i| if p == query then indices << i end }
    return found_duplicate_planets = indices.map{ |i| { :index => i, :planet => @planets[i]} }
  end

  def find_planet_duplicates_with_warning(found_duplicate_planets)
    message = "\n" + "-"*10 + " Warning! Your search returned multiple planets with the same name " + "-"*10 + "\n"
    found_duplicate_planets.each { |h| message << "Index~\t#{h[:index]}\tPlanet~\t#{h[:planet]}\tPlanet Name~\t#{h[:planet].name}\n" }
    message << "-"*7 + " We are defaulting your results to the first planet found by the search: " + "-"*7 + "\n"
    message << "-"*23 + " #{found_duplicate_planets.first[:planet]} " + "-"*34 + "\n"
    return message
  end

  def distance_between(planet1, planet2)
    planet1 = find_planet_by_name(planet1)
    planet2 = find_planet_by_name(planet2)

    return (planet1.distance_from_sun_km - planet2.distance_from_sun_km).abs
  end

end
