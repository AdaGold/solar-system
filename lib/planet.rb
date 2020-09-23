# Wave 1
class Planet

  attr_reader :name, :color, :mass_kg, :distance_from_sun_km, :fun_fact

  def initialize(name , color , mass_kg , distance_from_sun_km , fun_fact)
    @name = name
    @color = color
    @mass_kg = mass_kg
    @distance_from_sun_km = distance_from_sun_km
    @fun_fact = fun_fact
  end

  def summary
    return "Planet #{@name} is #{@color} in color, with a mass of #{@mass_kg} kg. It is #{@distance_from_sun_km} km from the sun. Fun fact: #{@fun_fact}."
  end

end








