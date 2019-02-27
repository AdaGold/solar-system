
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

  def find_planet_by_name(planet_name)
    @planets.find { |planet| planet.name.downcase == planet_name.downcase }
  end

  def user_added_planet
    puts "Please enter new planet's name"
    planet_name = gets.chomp
    puts "Please enter new planet's color"
    planet_color = gets.chomp
    puts "Please enter new planet's mass in kilograms"
    planet_mass = gets.chomp
    puts "Please enter the distance between this new planet and the sun"
    planet_distance = gets.chomp
    puts "Please enter new planet's fun_fact"
    fun_fact = gets.chomp

    user_planet = Planet.new(planet_name.capitalize, planet_color, planet_mass, planet_distance, fun_fact)

    add_planet(user_planet)
  end
end
