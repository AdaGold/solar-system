class Planet
  attr_accessor :name, :distance_from_the_sun, :moon_count, :orbit, :ring_count

  def initialize(hash) #this is so I can add as hashes.
    @name = hash[:name] #@name is my attribute, :name is my
    #@solar_rotation = hash[:rate]
    @distance_from_the_sun = hash[:distance_from_the_sun]
    @moon_count = hash[:moon_count]
    @orbit = hash[:orbit]
    @ring_count = hash[:ring_count]
    #@atmosphere = []
  end

  def describe
    puts "You chose #{@name}, which is #{@distance_from_the_sun} from the sun.  #{@name.capitalize} has #{@moon_count} moon(s), takes #{@orbit} to orbit the sun, and has #{@ring_count} rings."
  end

end


class SolarSystem
  attr_accessor :planets, :name, :formation_year

  def initialize(planets, name, formation_year)
    @planets = planets
    @name = name
    @formation_year = formation_year
  end

  def add_planet(new_planet)
    @planets << new_planet
  end

  def add_many_planets(many_planets)
    @planets = @planets + many_planets    #this adds more arrays to existing array
  end

  def new_name(new_solar)
    @name = new_solar
  end

end

new_planets = [
Planet.new(name: "Earth", distance_from_the_sun: "150 million km", moon_count: "1", orbit: "365 days", ring_count: "0"),          #[{oxygen: "22%", nitrogen: "78%""}])
Planet.new(name: "Mercury", distance_from_the_sun: "57 million km", moon_count: "0", orbit: "88 days", ring_count: "0"),         #   [{oxygen: "22%", nitrogen: "78%""}])"hydrogen, helium, and oxygen")
Planet.new(name: "Jupiter", distance_from_the_sun: "779 million km", moon_count: "67", orbit: "4_332 days", ring_count: "4"),    #[{oxygen: "22%", nitrogen: "78%""}]))
Planet.new(name: "Neptune", distance_from_the_sun: "4.5 billion km", moon_count: "67", orbit: "60_190 days", ring_count: "5")    #[{oxygen: "22%", nitrogen: "78%""}]))
]
test_planet = Planet.new(name: "Mars", distance_from_the_sun: "7 million km", moon_count: "4", orbit: "24 days", ring_count: "0")

solar_system = SolarSystem.new(new_planets, "Adriana's Galaxy", "1 billion bc")
#puts solar_system.inspect #this ispects my new solar system and inside are all my planets.  prints out raw value of my solar system

solar_system.add_planet(test_planet)
#puts
#puts solar_system.inspect

solar_system.add_many_planets(new_planets)
#puts
#puts solar_system.inspect
puts solar_system.name
solar_system.new_name("Milky Way") #used method instead of forcing it

#solar_system.name = "Milky Way" #this changes the name to milky way
puts solar_system.name
puts solar_system.formation_year


puts "Let's learn about some planets."
solar_system.planets.each_with_index do |p, i|
  print (i + 1).to_s + ". " + p.name + " "
end
puts
#puts "You can choose between Earth, Mercury, Jupiter, and Neptune."
puts "What number planet would you like to learn about?"

choice = gets.chomp.to_i
if choice <= solar_system.planets.length
  puts solar_system.planets[choice - 1].describe
else
  puts "Not a valid number."

end



  #
  # if choice == "earth"
  #   puts new_planets[0].describe
  # elsif choice == "mercury"
  #   puts new_planets[1].describe
  # elsif choice == "jupiter"
  #   puts new_planets[2].describe
  # elsif choice == "neptune"
  #   puts new_planets[3].describe
  # else
  #   puts "Error!"
  # end
