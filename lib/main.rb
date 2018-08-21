# lib/main.rb
# this is called the "driver code"

require "awesome_print"
require_relative "planet"
require_relative "solar_system"
require "data/planets"
require "csv"

# Page formatting:
SCREEN_WIDTH = 125

def main

  # This stuff initializes planet and solar system
  # Do I want this to be user-driven?
  mini_star = SolarSystem.new("Mini-Star")
  import_planets_to_solar_system(mini_star)

  header(mini_star)
  footer
  menu(mini_star)
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

def import_planets_to_solar_system(mini_star)
  # Creates Planet objects and adds them to the SolarSystem
  CSV.read()
  imported_planets.each {|p| mini_star.add_planet(p)}
end

def list_planets(mini_star)
  # Display a list of all the Planets in the SolarSystem
  puts "\n", mini_star.list_planets
end

def planet_details(mini_star)
  # Ask for name of 1 Planet
  # Display summary of that Planet's attributes
  puts "\nSearch for planet details by planet's exact name (case-insensitive) >"
  print "Search term: > "
  query = gets.chomp.upcase
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

def add_planet(mini_star)
# Ask the user for details about the Planet
# Create a new instance of Planet with that info
# Add it to the SolarSystem
  puts "\nADD A PLANET\n"
  print "\tName > "
  new_name = gets.chomp.capitalize
  print "\tColor > "
  new_color = gets.chomp.downcase
  print "\tMass (kg) > "
  new_mass = gets.chomp.to_f
  print "\tDistance from sun (km) > "
  new_dist = gets.chomp.to_f
  print "\tFun fact > "
  new_fact = gets.chomp.capitalize

  new_planet = Planet.new(new_name, new_color, new_mass, new_dist, new_fact)
  mini_star.add_planet(new_planet) # this is really important--don't remove!
  puts "\nPlanet added:", new_planet, "\n", new_planet.summary
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
# can I do data validation for planet mass and distance from sun?
# make it possible to search for a part of string (planet name)
# Refactor the valid names thing to be its own method
# which did you mean? let user choose a different planet than the default first planet
# make sure printing ALL happens in main.rb
# remove argument errors
# allow entering mass and distance in scientific notation
# write spec tests for edge cases that I'm ruling out
# write spec tests for SolarSystem class``
# Wave 3: https://github.com/sjlee3157/Solar-System/blob/master/README.md
# Grading rubric: https://github.com/sjlee3157/Solar-System/blob/master/feedback.md

# imported_planets = []
# imported_planets << Planet.new("Gorgonzola", "yellow", 2.986e24, 1.682e10,
#                                "Only planet accesible by the Space-Q-L8R" \
#                                " space escalator")
# imported_planets << Planet.new("Scamble-Dimp IV", "gross bleu", 3.142e31,
#                                 4.001e10, "Worst planet in sector")
# imported_planets << Planet.new("B-6-Critney", "clear", 1.234e4, 6.78e9,
#                                "Probably made of jello")
# imported_planets << Planet.new("Gorgonzola", "shmello", 1.111e11, 1.111e11,
#                                "Shmorgonzola!")
# imported_planets << Planet.new("Planet Attitude", "all black", 6.6e6, 6.6e6,
#                                "Didn't ask to be born")
# imported_planets << Planet.new("B-6-Critney", "clear", 1.234e4, 6.78e9,
#                                "Probably made of jello")
# imported_planets.each {|p| mini_star.add_planet(p)}
