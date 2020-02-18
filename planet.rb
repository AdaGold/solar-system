class Planet
  attr_reader :name, :color, :mass_kg, :distance_from_sun_km, :fun_fact

  def initialize(name, color, mass_kg, distance_from_sun_km, fun_fact)
    @name = name
    @color = color
    @mass_kg = mass_kg
    @distance_from_sun_km = distance_from_sun_km
    @fun_fact = fun_fact

    if @mass_kg < 0 || @distance_from_sun_km < 0
      raise ArgumentError, "Mass and distance from the Sun can't be less than zero"
    end
  end

  def summary
    return "--------
This planet is called #{@name}. 
It's colored #{@color}, and it weights #{@mass_kg} kilos.
It's #{@distance_from_sun_km} km away from the Sun, and it's the #{@fun_fact.downcase}.
--------"
  end
end
