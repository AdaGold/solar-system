# lib/main.rb
# this is called the "driver code"

require "awesome_print"
require_relative "planet"
require_relative "solar_system"
require "csv"

# Page formatting:
SCREEN_WIDTH = 125

def main

  # This stuff initializes planet and solar system
  # Do I want this to be user-driven?
  mini_star = SolarSystem.new("Mini-Star")
  import_planets_to_solar_system("../data/planets.csv", mini_star)

  header(mini_star)
  footer
  menu(mini_star)
end

def import_planets_to_solar_system(filename, mini_star)
  # Creates Planet objects and adds them to the SolarSystem
  # Add name to name Array
  imported_planets = CSV.read(filename, headers:true).map{ |row| row.to_h }
  mass_float = {"Mass (kg)" => 0.0}
  dist_float = {"Dist. from Sun (km)" => 0.0}
  imported_planets = imported_planets.map{ |h| h.merge(mass_float){ |k,v| v.to_f } }
  imported_planets = imported_planets.map{ |h| h.merge(dist_float){ |k,v| v.to_f } }
  imported_planets.each do |h|
    new_planet = Planet.new(h["Name"], h["Color"], h["Mass (kg)"],
                            h["Dist. from Sun (km)"], h["Fun Fact"])
    mini_star.add_planet(new_planet)
    mini_star.add_planet_name(new_planet)
  end
end

def menu(mini_star)
  # Display a menu of options
  # Ask the user to select what to do next
  puts "a (Add A Planet)\tl (List All Planets)\tp (Search Planet Details)\t" \
       "d (Distance Between 2 Planets)\tq (Quit)"
  print "Explore the universe > "
  user_choice = gets.chomp.downcase
  allowed = %w(l p d a q)

  until allowed.include?(user_choice)
    print "Explore the universe > "
    user_choice = gets.chomp.downcase
  end

  case user_choice
  when "l"
    list_planets(mini_star)
  when "p"
    planet_details(mini_star)
  when "d"
    distance_between_planets(mini_star)
  when "a"
    add_planet(mini_star)
  when "q"
    footer
    exit
  end

  footer
  menu(mini_star)

end

def list_planets(mini_star)
  # Display a list of all the Planets in the SolarSystem
  puts "\n", mini_star.list_planets
end

def add_planet(mini_star)
# Ask the user for details about the Planet
# Create a new instance of Planet with that info
# Add it to the SolarSystem
  puts "\nADD A PLANET\n"

  print "\tName > "
  new_name = gets.chomp.capitalize

  print "\tColor > "
  new_color = gets.chomp.downcase

  new_mass = prompt_for_valid_numbers("Mass (kg)")
  new_dist = prompt_for_valid_numbers("Distance from sun (km)")

  print "\tFun fact > "
  new_fact = gets.chomp.capitalize

  new_planet = Planet.new(new_name, new_color, new_mass, new_dist, new_fact)
  mini_star.add_planet(new_planet) # this is really important--don't remove!
  mini_star.add_planet_name(new_planet) # this is really important--don't remove!
  puts "\nPlanet added:", new_planet, "\n", new_planet.summary
end

def prompt_for_valid_numbers(which_prompt)
  print "\t" + which_prompt + " > "
  new_var = gets.chomp
  until new_var.to_f > 0 && new_var =~ /\A\d*(\.{1}\d+)?\z/
    puts which_prompt + " must be a number > 0"
    print "\t" + which_prompt + " > "
    new_var = gets.chomp
  end
  return new_var.to_f
end

def planet_details(mini_star)
  # Ask for name of 1 Planet
  # Display summary of that Planet's attributes
  puts "\nSearch for planet details by planet's exact name (case-insensitive) >"
  print "Search term: > "
  query = gets.chomp.upcase
  p mini_star.planets_by_name
  until mini_star.planets_by_name.include?(query)
    print "Search term: > "
    query = gets.chomp.upcase
  end

  if mini_star.has_duplicate_names?(query)
    puts mini_star.list_planet_duplicates_with_warning(query)
  end

  found_first_planet = mini_star.find_planet_by_name(query)
  puts "\nFOUND PLANET:", found_first_planet, "\n", found_first_planet.summary
end

def distance_between_planets(mini_star)
  # Ask for names of 2 Planets
  # Display distance between those 2 Planets
  puts "\nSearch for planet details by planet's exact name (case-insensitive) >"
  print "Planet 1 search term: > "
  query1 = gets.chomp.upcase
  until mini_star.planets_by_name.include?(query1)
    print "Planet 1 search term: > "
    query1 = gets.chomp.upcase
  end

  if mini_star.has_duplicate_names?(query1)
    puts mini_star.list_planet_duplicates_with_warning(query1)
  end

  print "Planet 2 search term: > "
  query2 = gets.chomp.upcase
  until mini_star.planets_by_name.include?(query2)
    print "Planet 2 search term: > "
    query2 = gets.chomp.upcase
  end

  if mini_star.has_duplicate_names?(query2)
    puts mini_star.list_planet_duplicates_with_warning(query2)
  end

  puts mini_star.distance_between(query1, query2)
end

def header(mini_star)
  puts ":" * SCREEN_WIDTH, "\n"
  puts "SOLAR SYSTEM".center(SCREEN_WIDTH)
  puts "You are exploring the " \
       "#{mini_star.star_name.upcase} star system".center(SCREEN_WIDTH)
end

def footer
  puts "\n", ":" * SCREEN_WIDTH
end

main

# To Do:
# type q, exit, or quit to quit at any time
# make it possible to search for a part of string (planet name)
# Refactor the valid names thing to be its own method
# which did you mean? let user choose a different planet than the default first planet
# make sure printing ALL happens in main.rb
# remove argument errors
# allow entering mass and distance in scientific notation
# write spec tests for edge cases that I'm ruling out
# write spec tests for SolarSystem class``
# https://github.com/sjlee3157/Solar-System/blob/master/README.md
# Grading rubric: https://github.com/sjlee3157/Solar-System/blob/master/feedback.md
