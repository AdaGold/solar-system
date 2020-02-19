class SolarSystem

  attr_reader :star_name, :planets

  # CODE REVIEW 3/8: Implements SolarSystem class. The initialize creates an empty list of planets
  def initialize(star_name)
    @star_name = star_name
    @planets = []
  end

  # CODE REVIEW 4/8: the add_planet takes an instance of Planet and adds it to the list
  def add_planet(new_planet)
    @planets << new_planet
  end

  # CODE REVIEW 5/8: the list_planets returns a string
  def list_planets
    list = "Planets orbiting #{star_name}\n"
    # Note: We can use planets, @planets, or self.planets
    planets.each do |planet|
      list += "- #{planet.name}\n"
    end
    return list
  end

  # CODE REVIEW 6/8: the find_planet_by_name returns the correct instance of Planet
  def find_planet_by_name(query)
    # Note: We can use planets, @planets, or self.planets
    first_found_planet = planets.find do |planet|
      planet.name.upcase == query.upcase
    end
    return first_found_planet
    # We return the first found planet, even if there's another matching one.
    # If there is no found planet, then we will return nil.
  end

end