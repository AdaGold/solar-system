#################################
class SolarSystem
#create read-write access / "getter and setter"
  attr_accessor :all_planets

#initialize method to take a collection of planet names and store them in an @planets instance variable
  def initialize(input_array)
    @all_planets = input_array
  end # end of initialize method

  #If the user wants to learn about a planet, this method will return the planet attributes
  def display_planet_list
    puts "Here are the current planets in our solar system:"
    @all_planets.each do |planet_info|
        puts planet_info.name
    end
  end

  def return_planet_detail(chosen_planet)
    @all_planets.each do |planet_info|
      if planet_info.name == chosen_planet
        puts "Info for the planet: #{planet_info.name}"
        puts "Year-Length: #{planet_info.year_length}"
        puts "Primary Export: #{planet_info.primary_export}"
      end
    end #end of do
  end #end of method

  def add_planet_to_solar_system(new_planet_name)
    @all_planets << new_planet_name
    puts "The solar system now includes:"
    display_planet_list
  end # end of add_planet method

end #end of Class SolarSystem
#################################

#################################
class Planet

  attr_reader :name, :year_length, :primary_export

  def initialize(name, year_length, primary_export)
    @name = name
    @year_length = year_length
    @primary_export = primary_export
    store_planet_details
  end # end of initialize method

  def display_planet_details
    puts "Name: #{@name}, Primary Export: #{@primary_export}, Year-Length: #{@year_length}"
  end

end #end of Planet class
#################################

#WAVE 3- Make an interface for user to interact with solar system
# Present list of current planets in the solar SolarSystem. This 3-planet list is  already-provided.
#A new instance of a planet is created with attributes.
planet_a =  Planet.new("Mercury",  10, "coal")
planet_b = Planet.new("Tatooine", 5, "dust")
planet_c = Planet.new("Endor", 3, "Ewok pelts")
planet_alphabet_array = [planet_a, planet_b, planet_c]

#Where do I want to create the method to create a list for the user?
#SOLAR SYSTEM- store this list in an array
mysolarsystem = SolarSystem.new(planet_alphabet_array)

# ASk user if they want more details about any of the planets already in the SolarSystem
#prompt them here
# You can write this method outside the class
# Asks user to select a planet to learn about and then provides a list to choose from.
puts "Let's learn about our solar system!"
# puts list_my_preset_planets(input_array)
mysolarsystem.display_planet_list

puts "What would you like to do?:"
puts "1. Learn about a planet currently in the solar system (choose 1)"
puts "2. Add a planet to the solar system (choose 2)"
choice = gets.chomp.to_i

if choice == 1
  puts "What planet would you like to learn about today?"
    chosen_planet = gets.chomp
    mysolarsystem.return_planet_detail(chosen_planet)
elsif choice == 2
  # Ask user if they want to add any planets and attributes to the solar system, then provide a new list of the solar system
  puts "What is the name of the planet you would like to add to the solar system?"
  added_planet_name = gets.chomp
  puts "What is the year-length of this planet?"
  added_planet_year_length = gets.chomp.to_f
  puts "What is the chief export of this planet?"
  added_planet_chief_export = gets.chomp
    #if we don't want to ask the user for this information now (year-length and chief export), then I can put in dummy default values that can be changed at a later point. It seems like  like good arguments

  #creates an instance of the Planet class called new_planet using the user-inputted arguments.
  new_planet = Planet.new(added_planet_name, added_planet_year_length, added_planet_chief_export)
  mysolarsystem.add_planet_to_solar_system(new_planet)

else
  "You did not enter a valid entry. Please type 1 or 2."
end

#QUESTIONS!
# why does the following export the planet names in this format: "#<Planet:0x007faf4316a1d0>"
#puts mysolarsystem.all_planets
