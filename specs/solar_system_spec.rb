require "minitest/autorun"
require "minitest/reporters"
require "minitest/skip_dsl"
require "minitest/pride"

require_relative "../lib/solar_system"
require_relative "../lib/planet"

describe "Solar System" do
  it "Initializes with star name with empty planet array" do
    solar_system = SolarSystem.new("sun")
    expect(solar_system.star_name).must_equal "sun"
    expect(solar_system.planets).must_equal []
  end

  # it "Initialize a Planet with appropriate info"
end
