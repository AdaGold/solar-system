class Planet
  attr_accessor :name, :age, :distance_from_sun, :year_length, :inhabitants

  def initialize(name, age, distance_from_sun, year_length, inhabitants)
    @name = name
    @age = age
    @distance_from_sun = distance_from_sun
    @year_length = year_length
    @inhabitants = inhabitants
  end

  def list_attributes
    list = "
      Name: #{@name}\n
      Age: #{@age}\n
      Distance From Sun: #{@distance_from_sun}\n
      Year Length: #{@year_length}\n
      Inhabitants: #{@inhabitants}
    "
    return list
  end
end

kate = Planet.new("Something", 45, "6789mi", "789days", "Cone Heads")

puts kate.list_attributes
