# /specs/planet_spec.rb
gem 'minitest', '>= 5.0.0'
require 'minitest/pride'
require 'minitest/autorun'
require "minitest/skip_dsl"

require "main"
require "planet"

describe "Test Planet class" do
  # first, test that initialization works
  it "will read initialized variables correctly" do
    gorgonzola = Planet.new("Gorgonzola", "yellow", 2.986e24, 1.682e10, "Only planet accesible by the Space-Q-L8R space escalator")
    expect(gorgonzola.fun_fact).must_equal "Only planet accesible by the Space-Q-L8R space escalator"
  end

  it "will allow writing, but not reading, of initialized variables" do
    gorgonzola = Planet.new("Gorgonzola", "yellow", 2.986e24, 1.682e10, "Only planet accesible by the Space-Q-L8R space escalator")
    expect{gorgonzola.color = "green"}.must_raise NoMethodError
  end

  it "will raise ArgumentError for invalid mass and distance" do
    expect{planet = Planet.new("Name", "color", 99, "99", "Fun fact")}.must_raise ArgumentError
    expect{planet = Planet.new("Name", "color", "99", 99, "Fun fact")}.must_raise ArgumentError
    expect{planet = Planet.new("Name", "color", "99", "99", "Fun fact")}.must_raise ArgumentError
    expect{planet = Planet.new("Name", "color", 99, -1, "Fun fact")}.must_raise ArgumentError
    expect{planet = Planet.new("Name", "color", -1, 99, "Fun fact")}.must_raise ArgumentError
    expect{planet = Planet.new("Name", "color", 0, 0, "Fun fact")}.must_raise ArgumentError
  end

  it "will return a single string summary" do
    gorgonzola = Planet.new("Gorgonzola", "yellow", 2.986e24, 1.682e10, "Only planet accesible by the Space-Q-L8R space escalator")
    expect(gorgonzola.summary).must_be_instance_of String
    expect(gorgonzola.summary).must_include "yellow"
  end
end
