require "pry"
require_relative "planet"

# wave 2
class SolarSystem
  attr_reader :star_name, :planets

  def initialize(star_name)
    @star_name = star_name
    @planets = []
  end

  def add_planet(planet_instance)   
    @planets.push(planet_instance)
  end 

  def list_planets
    list = "Planets orbiting #{@star_name}\n"
    counter = 0
    @planets.each do |planet|
      counter += 1 
      list += "#{counter}. #{planet.name}\n"
    end 
    
    return list
  end  

  def find_planet_by_name(name)
    lowercase_name = name.downcase 
    planets = @planets.select { |planet| planet.name.downcase == lowercase_name }
    if planets.first == nil
      raise ArgumentError.new("Planet not found")
    end 
    return planets.first
  end 

end