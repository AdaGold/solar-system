class SolarSystem

  attr_reader :star_name, :planets

  def initialize(star_name)
    @star_name = star_name
    @planets = []
  end

  def add_planet(new_planet)
    @planets << new_planet
  end

  def list_planets
    list = "Planets orbiting #{star_name}\n"
    planets.each do |planet|
      list += "- #{planet.name}\n"
    end
    return list
  end

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