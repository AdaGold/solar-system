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
    # There are many ways we could implement this method.
    # Note that there are a lot of different syntaxes
    #   that are valid, too. We listed some in the comments.

    return "The planet #{name} is the color #{color}. It has a mass of #{mass_kg} kg. It is #{distance_from_sun_km} km away from the sun. #{fun_fact}."

    # return "The planet #{@name} is the color #{@color}. It has a mass of #{@mass_kg} kg. It is #{@distance_from_sun_km} km away from the sun. #{@fun_fact}."

    # return "The planet #{self.name} is the color #{self.color}. It has a mass of #{self.mass_kg} kg. It is #{self.distance_from_sun_km} km away from the sun. #{self.fun_fact}."
  end

end