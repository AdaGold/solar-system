require_relative "planet"
require_relative "solar_system"
require "terminal-table"
require "colorize"

def get_user_input(planet_attribute)
  puts "\nEnter the #{planet_attribute} of the planet: "
  return gets.chomp
end

def ensure_input_over_zero(attribute_string)
  attribute = 0
  until attribute > 0
    attribute = get_user_input(attribute_string).to_i
  end
  return attribute
end

def user_add_planet(solar_system)
  name = get_user_input("name").to_s
  color = get_user_input("color").to_s
  mass = ensure_input_over_zero("mass in kg").to_i
  distance_from_sun = ensure_input_over_zero("distance from the sun in km").to_i
  fun_fact = get_user_input("fun fact").to_s
  new_planet = Planet.new(name, color, mass, distance_from_sun, fun_fact)
  solar_system.add_planet(new_planet)
end

def user_print_planet_info(solar_system)
  puts "Please enter the name of the planet you want to search for"
  planet_inquiry = gets.chomp.to_s.downcase
  found_planet = solar_system.find_planet_by_name(planet_inquiry)

  found_planet.each do |planet|
    puts planet.summary
  end
end

def create_options_table
  rows = [
    ["Display list of planets", "'list', or 'l'"],
    ["Get Details about a specific planet", "'details', or 'd'"],
    ["Add a new planet to database", "'add', or 'a'"],
    ["Quit program", "'quit', 'exit', or 'q'"],
  ]
  options_table = Terminal::Table.new :rows => rows, :headings => ["OPTIONS".light_blue, "COMMANDS".light_blue], :style => {:all_separators => true}

  return options_table
end

def main
  frogstar = SolarSystem.new("Frogstar")

  pluto = Planet.new("Pluto", "Blue", 1.23e24, 2.35e9, "Im not a real planet")
  magrathea = Planet.new("Magrathea", "pink", 5.972e24, 1.496e8, "Legendary planet that became wealthy \nby creating luxury planets for the \nGalaxy's mercantire elite.")
  earth = Planet.new("Earth", "Blue-Green", 5.972e24, 1.496e8, "The greatest super computer, \ndesigned to ask the question of Life, \nThe Universe, and everything.")
  milliways = Planet.new("Milliways", "Aqua", 8.562e28, 2.345e4, "Home to the legendary drink, \nPan Galactic Gargle Blaster!")

  frogstar.add_planet(milliways)
  frogstar.add_planet(magrathea)
  frogstar.add_planet(pluto)
  frogstar.add_planet(earth)

  active = true
  while active
    puts create_options_table
    action = gets.chomp.to_s.downcase

    if ["list", "l"].include?(action)
      puts frogstar.list_planets
    elsif ["quit", "exit", "q"].include?(action)
      break
    elsif ["details", "d"].include?(action)
      user_print_planet_info(frogstar)
    elsif ["add", "a"].include?(action)
      user_add_planet(frogstar)
    end
  end
end

main
