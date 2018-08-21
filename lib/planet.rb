# lib/planet.rb

class Planet

  attr_reader :name, :color, :mass_kg, :distance_from_sun_km, :fun_fact

  def initialize(name, color, mass_kg, distance_from_sun_km, fun_fact)
    @name = name
    @color = color
    @mass_kg = mass_kg
    @distance_from_sun_km = distance_from_sun_km
    @fun_fact = fun_fact

    raise ArgumentError, "Distance from sun must be a number > 0" unless @mass_kg > 0 #&& @mass_kg.to_f.is_a?(Float)
    raise ArgumentError, "Mass must be a number > 0" unless @distance_from_sun_km > 0 #&& @distance_from_sun_km.to_f.is_a?(Float)
  end

  def summary
    return sprintf("Name: #{@name}\nColor: #{@color}\nMass (kg): %.3e\nDist. from Sun (km): %.3e\nFun Fact: #{@fun_fact}", @mass_kg, @distance_from_sun_km)
  end

end
