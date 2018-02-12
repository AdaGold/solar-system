# solar system program contains a SolarSystem class which can be composed of an array of instances of the Planet class
# user can create new planets and make them a part of any solar system
# user can interact with planets, requesting information about any of them
# user can also interact with a solar system as a whole, requesting the distance between two planets as well as their local year based on their year length and the solar system's age

# ==================
# class and method definitions
# ==================

# class Planet lets you create a planet with various attributes and access that information individually and all-together
# part of wave 2
class Planet
  attr_accessor :name, :order, :color, :temp, :water, :diameter, :moons, :year_length, :dist_from_sun

  # order refers to order from the sun
  # temperature is in degrees Celsius
  # diameter is in km
  # year length is in Earth days
  # distance from sun is in million km
  def initialize(name, order, color, temp, water, diameter, moons, year_length, dist_from_sun)
    @name = name
    @order = order
    @color = color
    @temp = temp
    @water = water
    @diameter = diameter
    @moons = moons
    @year_length = year_length
    @dist_from_sun = dist_from_sun
  end

  def planet_info
    return planet_information = "Name: #{@name} \nOrder: #{@order} \nColor: #{@color} \nAverage Temperature (C): #{@temp} \nContains Water: #{@water} \nDiameter (km): #{@diameter} \nNumber of Moons: #{@moons} \nYear length (Earth days): #{@year_length} \nDistance from the sun (million km): #{@dist_from_sun}"
  end

end

# class SolarSystem lets you create a solar system with two attributes, age and an array of planets of class Planet
# user can request a list of all planets in a system, add a new planet, get the local year of any given planet, and find the distance between any two planets
# part of wave 1
class SolarSystem
  attr_accessor :age, :planets

  def initialize(age, planets)
    # age in million Earth years
    @age = age
    @planets = planets
  end

  def add_planet=(new_planet)
    @planets << new_planet
  end

  def list_planets
    list_of_planets = ""
    @planets.each_with_index do |planet, index|
      list_of_planets += "#{index + 1}. #{planet.name}\n"
    end
    return list_of_planets
  end

  # part of wave 3 optional
  def get_local_year(planet)
    year_length = planet.year_length #planet.year_length in Earth days
    local_year = @age * 1_000_000 * 365 / year_length
    return local_year.to_i
  end

  # part of wave 3 optional
  def get_distance_between_planets(planet_a, planet_b)
    distance_between = (planet_a.dist_from_sun - planet_b.dist_from_sun).abs
    return "The distance between #{planet_a.name} and #{planet_b.name} is #{distance_between} million km."
  end

end

# create_planet method asks for user input to create a new planet of class Planet
# part of wave 2 optional & wave 3
def create_planet
  puts "Let's create a new planet. What do you want to call it?"
  name = gets.chomp
  puts "What order does #{name} come in?"
  order = gets.chomp.to_i
  puts "What color is #{name}?"
  color = gets.chomp
  puts "What is the average temperature (in degrees Celsius) on #{name}?"
  temp = gets.chomp.to_f
  puts "Dose #{name} contain water? Type yes or no."
  water = gets.chomp
  if water == "yes"
    water = true
  else
    water = false
  end
  puts "What is the diameter of #{name} in km?"
  diameter = gets.chomp.to_i
  puts "How many moons does #{name} have?"
  moons = gets.chomp.to_i
  puts "How long is one year on #{name} in Earth days?"
  year_length = gets.chomp.to_i
  puts "How far is #{name} from the sun in million km?"
  dist_from_sun = gets.chomp.to_f

  return Planet.new(name, order, color, temp, water, diameter, moons, year_length, dist_from_sun)

end

# ==================
# tests
# ==================

# objects of class Planet created and saved in array
mercury = Planet.new("Mercury", 1, "yellow", 427.0, true, 4_879, 0, 88, 57.91)
venus = Planet.new("Venus", 2, "brown", 462.0, false, 12_104, 0, 225, 108.2)
earth = Planet.new("Earth", 3, "blue", 58.3, true, 12_742, 1, 365 ,149.6)
mars = Planet.new("Mars", 4, "red", -60.0, true, 6_779, 2, 687, 227.9)
jupiter = Planet.new("Jupiter", 5, "brown-red", 145, false, 139_822, 69, 4380, 778.5)
hoth = Planet.new("Hoth", 6, "ice-blue", -61.0, true, 116_464, 62, 10_759, 1_429.0)
# modification from wave 1 to wave 2
# declaring the planets array remains the same; only difference is that each element in the array goes from a hash in wave 1 to an object of class Planet in wave 2
planets = [mercury, venus, earth, mars, jupiter, hoth]

# test class Planet planet_info method
# part of wave 2
puts hoth.planet_info

# solar system of class SolarSystem created and given an age
# age part of wave 3 optional
solar_system_a = SolarSystem.new(28.7, planets)

# test list_planets method
puts solar_system_a.list_planets

uranus = Planet.new("Uranus", 7, "blue", -216, false, 50_724, 27, 30_770, 2_871)

# test add_planet method
solar_system_a.add_planet = uranus

# test that list of planets in solar system is updated after adding new planet
puts solar_system_a.list_planets

# test get_local_year method
# part of wave 3 optional
puts solar_system_a.get_local_year(mars)

# test get_distance_between_planets method
# both outputs below should be the same
# part of wave 3 optional
puts solar_system_a.get_distance_between_planets(earth, hoth)
puts solar_system_a.get_distance_between_planets(hoth, earth)

# ==================
# user interaction
# ==================

# display information about any planet
def display_info(planet_selection)
  info_about_planet = "#{planet_selection.name} is a(n) #{planet_selection.color} planet. It comes in at \##{planet_selection.order} in the order of planets from the sun. #{planet_selection.name} has a diameter of #{planet_selection.diameter} km and has #{planet_selection.moons} moon(s). It has pleasant weather, averaging about #{planet_selection.temp} degrees Celsius throughout the year. Oh, by the way, one year on #{planet_selection.name} takes about #{planet_selection.year_length} Earth days. That's because it's #{planet_selection.dist_from_sun} million kilometers from the sun."
  if planet_selection.water
    info_about_planet += " Luckily, this planet does have water."
  else
    info_about_planet += " Unfortunately, this planet lacks water."
  end
  return info_about_planet
end

# ask user to select a planet to explore and allow user to select another
def planets_info(solar_system)
  puts "What planet would you like to learn about? Here are your options: "

  solar_system.planets.each_with_index do |planet, planet_order|
    puts "#{planet_order + 1}. #{planet.name}"
  end

  # enter the proper name of an existing planet within the solar system you are exploring, e.g., "Mercury", "Jupiter", not "mercury", "jupiter"
  planet_selection = gets.chomp
  planet_information = ""

  solar_system.planets.each do |planet|
    if planet_selection == planet.name
      planet_information = display_info(planet)
    end
  end

  if planet_information != ""
    puts planet_information
  else
    puts "That planet doesn't exist in our system."
  end

  choose_another(solar_system)
end

# asks user if they want to learn about another planet, if not, leaves the program
def choose_another(solar_system)
  puts "Would you like to learn about another planet? Enter 'yes' or 'no'."
  play_again = gets.chomp
  if play_again == "yes"
    planets_info(solar_system)
  else
    puts "Ok, goodbye!"
  end
end

# test solar system exploration user interface
planets_info(solar_system_a)

# test create_planet method and verify with Planet class method planet_info
neptune = create_planet
puts neptune.planet_info
# you can input the following information for testing purposes
# name : Neptune
# order: 8
# color: navy blue
# avg temp: -200
# water: yes
# diameter: 42_244
# moons: 14
# year length: 60_182
# distance from sun: 4_498
