
class SolarSystem
  attr_reader :star_name, :planet

  def initialize(star_name)
    @star_name = star_name
    @planets = []
  end

  def add_planet(planet_instance)
    @planets << planet_instance
  end

  def list_planets
    conclusion_statement = "Planets orbiting #{star_name}:\n"

    i = 1
    planet_list = ""
    @planets.each do |planet|
      planet_list += "#{i}.#{planet.name} \n"
      i += 1
    end

    return conclusion_statement + planet_list
  end
end

# earth = Planet.new("Earth", "blue-green", 5.972e24, 1.496e8, "Only planet known to support life")
