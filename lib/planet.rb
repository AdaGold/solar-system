require "terminal-table"
require "colorize"

class Planet
  attr_reader :mass_kg, :distance_from_sun_km, :color, :name, :fun_fact

  def initialize(name, color, mass_kg, distance_from_sun_km, fun_fact)
    @name = name
    @color = color
    @fun_fact = fun_fact
    if mass_kg <= 0
      raise ArgumentError, "Mass must be greater than zero"
    else
      @mass_kg = mass_kg
    end
    if distance_from_sun_km <= 0
      raise ArgumentError, "distance must be greater than zero"
    else
      @distance_from_sun_km = distance_from_sun_km
    end
  end

  def summary
    rows = [["Planet".light_green, @name], ["Color".light_green, @color], ["Mass in kg".light_green, @mass_kg], ["Distance from the sun".light_green, @distance_from_sun_km], ["Fun Fact".light_green, @fun_fact]]
    planet_table = Terminal::Table.new :rows => rows, :title => "PLANET SUMMARY".green, :style => {:all_separators => true}
    return planet_table
  end
end
