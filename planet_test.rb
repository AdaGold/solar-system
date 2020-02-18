require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative 'planet'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "summary" do
  it "will throw an error if given a negative number for mass" do
    # Arrange, Act and Assert
    expect {earth = Planet.new('Earth', 'blue-green', -5.972e24, 1.496e8,
      'Only planet known to support life')}.must_raise ArgumentError
  end
end
