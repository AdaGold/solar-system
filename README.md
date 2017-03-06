# Solar System
Let's make a planetary system!

## Learning Goals

- Practice creating custom classes
- Use a hash to initialize an object
- Create an object which contains a collection of other objects
- Practice creating instance methods


# Wave 1
## Primary Requirements
- Create a `SolarSystem` class with an `@planets` instance variable.
- Create an initialize method which should take a collection of planet names and store them in an `@planets` instance variable.
- Create a method to add a planet to the list.
- Create a method which will return **not print** a list of the planets as a String in this style:

```bash
1.  Mercury
2.  Venus
3.  Earth
4.  Mars
5.  Jupiter
6.  Hoth
```
- Write code to test your SolarSystem
- Instead of Strings for planets, modify SolarSystem's `initialize` method to take a list of hashes where each planet is sent as a hash with at least 5 attributes.  

## Optional Enhancements
- Give each planet a `year_length` attribute which is the length of time the planet takes to go around it's star.  
- Give each planet a `distance_from_the_sun` attribute
- Write a program that asks for user input to query the planets:
  - First, ask the user to select a planet they'd like to learn about.
  - Present the user with a list of planets from which they can choose. Something like:
    - `1. Mercury, 2. Venus, 3. Earth, 4. Secret Earth, 5. Mars, 6. Jupiter, ... 13. Exit`
  - Provide the user with well formatted information about the planet (diameter, mass, number of moons, primary export, etc.)
  - Then ask the user for another planet.

# Wave 2
## Primary Requirements
- Create a `Planet` class which will represent a planet.
    - Add an `initialize` method which takes a hash and uses the hash to set the class' instance variables.  
    - Create a method that **returns** the Planet's attributes in an easy to read fashion.
    - Create reader methods to give a user access to read the instance variables.

## Optionals
-  Create a method, outside any class, which creates a planet from user input.

# Wave 3
## Primary Requirements
- Create an interface where the user can select a planet and be presented information about the solar system and select a planet to view more information about.  
- Allow your user to add their own planet.  

## Optional Enhancements
- Ensure that the each planet has a `@distance_from_the_sun` attribute. Using this data, add a method to determine the distance from any other planet (assuming planets are in a straight line from the sun)
- Give your solar system an age (in earth years).
- Define a method that returns the local year of the planet based on it's rotation since the beginning of the solar system
