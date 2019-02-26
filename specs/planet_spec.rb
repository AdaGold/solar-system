require "minitest/autorun"
require "minitest/reporters"
require_relative "../lib/planet.rb"
Minitest::Reporters.use!

describe "planet" do
  it "Check if a new instance is an instance of class Planet " do
    earth = Planet.new("Earth", "blue-green", 5.972e24, 1.496e8, "Only planet known to support life")
    expect(earth).must_be_instance_of Planet
  end
end
