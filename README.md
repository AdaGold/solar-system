# Solar System
Let's make a planetary system!

## Learning Goals
### Wave 1
- Create a custom **class**
- Create and use an **initialize** method in your class
- Create and use **instance variables** in your class
- Create a method to list your planets

### Wave 2
- Again create custom class which accepts a hash to initialize it's attributes.  

### Wave 3
- Use an **array** to store a list of objects
- Create an object which stores a list of other objects.  


## Baseline
- Create a `SolarSystem` class with an `@planets` instance variable.
- The initialize method should take a collection of planet names and store them in `@planets`
- Create a method to add a planet to the list.
- Create a method which will return a list of the planets in this style:

```bash
1.  Mercury
2.  Venus
3.  Earth
4.  Mars
5.  Jupiter
6.  Hoth
```



# Wave 1
## Primary Requirements
- Get creative! Instead of Strings for planets, give SolarSystem a list of hashes where each planet is sent as a hash with at least 5 attributes.  

## Optional Enhancements
- Give each planet a rate of solar rotation
- Give each planet a `distance_from_the_sun` attribute
- Write a program that asks for user input to query the planets:
  - First, ask the user to select a planet they'd like to learn about.
  - Use your method to present the user with a list of planets from which they can choose. Something like:
    - `1. Mercury, 2. Venus, 3. Earth, 4. Secret Earth, 5. Mars, 6. Jupiter, ... 13. Exit`
  - Provide the user with well formatted information about the planet (diameter, mass, number of moons, primary export, etc.)
  - Then ask the user for another planet.

# Wave 2
## Primary Requirements
- Create a `Planet` class which will represent a planet.
    - Add an `initialize` method which takes a hash and uses the hash to set the class' instance variables.  
    - Create a method that **returns** the Planet's attributes in an easy to read fashion.
    - Create accessor methods to the instance variables.

# Wave 3
- Modify your `SolarSystem` class to use the Planet class instead of a hash.
- Create an interface where the user can select a planet and be presented information about the planet.  
- Allow your user to add their own planet.  

## Optional Enhancements
- Ensure that the each planet has a `@distance_from_the_sun` attribute. Using this data, add a method to determine the distance from any other planet (assuming planets are in a straight line from the sun)
- Give your solar system a formation year (in earth years).
- Define a method that returns the local year of the planet based on it's rotation since the beginning of the solar system
