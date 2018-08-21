# lib/solar_system.rb

class SolarSystem

  attr_reader :star_name, :planets, :planets_by_name

  def initialize(star_name)
    @star_name = star_name
    @planets = []
    @planets_by_name = []
  end

  def add_planet(planet)
    # don't do this
    raise ArgumentError, "Argument must be instance of Planet class" unless planet.is_a? Planet
    @planets << planet
    @planets_by_name = @planets.map{ |p| p.name.upcase }
    return planet
  end

  def list_planets
    list = "Planets orbiting #{@star_name}:\n"
    @planets.each_with_index {|p, i| list << "#{i+1}. #{p.name}\n" }
    return list
  end

  def find_planet_by_name(query)
  # returns first Planet object that matches your search
    query.upcase!
    raise ArgumentError, "Search term must be a String" unless query.is_a? String
    raise ArgumentError, "Invalid planet (planet not found in this solar system)" unless @planets_by_name.include? (query)
    return @planets[@planets_by_name.index(query)]
  end

  def has_duplicate_names?(query)
    # returns Boolean
    query.upcase!
    raise ArgumentError, "Search term must be a String" unless query.is_a? String
    return @planets_by_name.count{|p|p == query} > 1
  end

  def find_all_planet_duplicates_by_name(query)
  # returns a Hash of all duplicates
    query.upcase!
    indices = []
    @planets_by_name.each_with_index do |p,i|
      if p == query
        indices << i
      end
    end
    found_duplicate_planets = indices.map{ |i| { :index => i, :planet => @planets[i]} }
    return found_duplicate_planets
  end

  def list_planet_duplicates_with_warning(query)
  # returns String to display Hash of all duplicates along with warning message
    message = "\n" + "-"*5 + " Warning! Your search \"#{query.downcase}\" returned multiple planets with the same name " + "-"*5 + "\n"
    self.find_all_planet_duplicates_by_name(query).each { |h| message << "Index:\t#{h[:index]}\tObject ID:\t#{h[:planet]}\tPlanet Name:\t#{h[:planet].name}\n" }
    message << "-"*9 + " We are defaulting your results to the first planet found by the search: " + "-"*9 + "\n"
    message << "-"*31 + " #{self.find_all_planet_duplicates_by_name(query).first[:planet]} " + "-"*30 + "\n"
    return message
  end

  def distance_between(query1, query2)
  # returns a String to display the value of the distance and the names of the planets
    planet1 = find_planet_by_name(query1)
    planet2 = find_planet_by_name(query2)
    distance_between = (planet1.distance_from_sun_km - planet2.distance_from_sun_km).abs
    return "\nDISTANCE BETWEEN #{planet1.name} AND #{planet2.name}: %.3e" %distance_between
  end

end
