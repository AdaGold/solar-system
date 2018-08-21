# lib/planet.rb

# Planet class
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
    return "Planet~ #{@name}\nColor~ #{@color}\nMass (kg)~ #{@mass_kg}\nDist. from Sun (km)~ #{@distance_from_sun_km}\nFun Fact~ #{@fun_fact}"
  end

end
