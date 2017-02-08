# Solar System
Let's make a planetary system!

## Learning Goals
### Wave 1
- Create a custom **class**
- Create and use an **initialize** method in your class
- Create and use **instance variables** in your class

## Baseline
- Create a `Planet` class with a name attribute.
- You should be able to instantiate a new `Planet` object with an associated name.

# Wave 1
## Primary Requirements
- Get creative! Give each instance of `Planet` at least five attributes. These could be diameters, mass, moons... whatever!
- Allow these attributes to be set using a hash in `initialize`.
- You should be able to create many different planets with different properties, like Mercury, Venus, Earth, Mars, Jupiter, etc.

## Optional Enhancements
- Give each planet a rate of solar rotation
- Give each planet a `@distance_from_the_sun` attribute
- Write a program that asks for user input to query the planets:
  - First, ask the user to select a planet they'd like to learn about.
  - Present the user with a list of planets from which they can choose. Something like:
    - `1. Mercury, 2. Venus, 3. Earth, 4. Secret Earth, 5. Mars, 6. Jupiter, ... 13. Exit`
  - Provide the user with well formatted information about the planet (diameter, mass, number of moons, primary export, etc.)
  - Then ask the user for another planet.
