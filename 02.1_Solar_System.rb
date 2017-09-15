### Solar System
require "awesome_print"

## Setup Classes
class SolarSystem
  AGE = 4_600
  attr_reader :planets

  def initialize(planets_array)
    @planets = planets_array
  end

  def add_planet(planet)
    @planets << planet
  end

  def planet_list
    display = Array.new

    @planets.each_index do |i|
      display << "#{i + 1}. #{planets[i].name}\n"
    end

    return display
  end

end # End of Class SolarSystem

class Planet
  EARTH_YEAR = 365.2564

  attr_accessor :user_name, :user_days, :user_age, :user_distance, :user_mass, :user_moons, :user_life
  attr_reader :name, :earth_days, :earth_age, :distance_from_the_sun, :earth_mass, :has_moons, :known_life, :rel_age

  def initialize(name, year, age, distance, mass, moons, life)
    @name = name
    @earth_days = year
    @earth_age = age
    @distance_from_the_sun = distance
    @earth_mass = mass
    @has_moons = moons
    @known_life = life
  end

  def rel_age
    return (SolarSystem::AGE - @earth_age.to_i) * Planet::EARTH_YEAR / @earth_days.to_f
  end

  def prettify
    bullet = "\n  - "
    output = "\nPlanet: #{@name}#{bullet}#{@earth_days} Earth days per year#{bullet}#{earth_age} million Earth years old (#{rel_age.to_i}  #{@name} years)#{bullet}#{@distance_from_the_sun}AU from its sun#{bullet}#{@earth_mass} times the weight of Earth"
    if @has_moons
      output += "#{bullet}has moons!"
    else
      output += "#{bullet}doesn't have any moons :("
    end
    if @known_life
      output += "#{bullet}has life!"
    end
    return output
  end

end # End of Class Planet


## SETUP METHODS
def user_prompt
  print "(or \"add\" or \"exit\"): "
  user_input = gets.chomp.downcase
  return user_input
end

def user_planet_input #no input checks
  puts "Please answer the following:"

  print "Planet name: "
  user_name = gets.chomp.capitalize

  print "Please enter its year length (in Earth days): "
  user_days = gets.chomp

  print "Please enter its age (in millions of Earth years): "
  user_age = gets.chomp

  print "Please enter the distance from its sun (in AU): "
  user_distance = gets.chomp

  print "Please enter the mass in relation to Earth: "
  user_mass = gets.chomp

  print "Does your planet have moons? "
  user_moons = gets.chomp
  case user_moons
  when "yes","y","true"
    user_moons = true
  else
    user_moons = false
  end
  print "Does your planet have known life? "
  user_life = gets.chomp.downcase
  case user_life
  when "yes","y","true"
    user_life = true
  else
    user_life = false
  end

  # return Planet.new(@user_name, @user_days, @user_age, @user_distance, @user_mass, @user_moons, @user_life)
  return [user_name, user_days, user_age, user_distance, user_mass, user_moons, user_life]
end


## DEFINE PLANETS & TEST
planet_1 = Planet.new("Mercury", 87.969, 3_000, 0.387, 0.0553, false, false)
planet_2 = Planet.new("Venus", 224.7, 1_000, 0.723, 0.815, false, false)
planet_3 = Planet.new("Earth", Planet::EARTH_YEAR, 500, 1, 1, true, true)
planet_4 = Planet.new("Mars", 687, 1.52, 1_200, 0.107, true, false)
planet_5 = Planet.new("Jupiter", 4_332.59, 3_900, 5.2, 317.8, true, false)
planet_6 = Planet.new("Saturn", 10_759, 400, 9.58, 95.2, true, false)

this_system = SolarSystem.new([planet_1, planet_2, planet_3, planet_4, planet_5, planet_6])

## USER INTERACTION
puts "========================================\n\n"
puts "WELCOME TO OUR SOLAR SYSTEM\n\n"
puts "You can read about the following planets:\n"
puts this_system.planet_list
puts "\n========================================\n"
puts "(Enter \"add\" to add a planet yourself)"
puts "(Enter \"exit\" to quit this program)"
print "\nSelect a planet you would like to know more about: "

selection = gets.chomp.downcase

valid = false

until selection == "exit"
  valid = false

  this_system.planets.each_index do |i|
    while (i + 1).to_s == selection || this_system.planets[i].name.downcase == selection
      valid = true
      puts this_system.planets[i].prettify
      print "\nPick another planet "
      selection = user_prompt
    end
  end

  if !valid && selection != "add"
    print "Invalid selection, try again "
    selection = user_prompt
  end

  if selection == "add"
    puts "OK, Let's add a planet!"
    valid = false

    user_planet_array = user_planet_input
    this_system.add_planet (Planet.new(user_planet_array[0],user_planet_array[1],user_planet_array[2],user_planet_array[3],user_planet_array[4],user_planet_array[5],user_planet_array[6]))

    puts "\nGreat, you have just added:"
    puts this_system.planets[-1].prettify
    puts "\n"
    puts this_system.planet_list

    puts "\nPick another planet "
    selection = user_prompt

  end
end

puts "Thank you for visiting this Solar System!"
