# lib/planet.rb

class Planet

  attr_reader :name, :color, :mass_kg, :distance_from_sun_km, :fun_fact

  def initialize(name, color, mass_kg, distance_from_sun_km, fun_fact)
    @name = name
    @color = color
    @mass_kg = mass_kg
    @distance_from_sun_km = distance_from_sun_km
    @fun_fact = fun_fact
  end

  def summary
    return sprintf("Name: #{@name}\nColor: #{@color}\nMass (kg): %.3e\nDist. from Sun (km): %.3e\nFun Fact: #{@fun_fact}", @mass_kg, @distance_from_sun_km)
  end

end
