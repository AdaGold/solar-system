# Solar System

## At a Glance

- Build a model of a solar system to practice classes
- Individual, [stage 1](https://github.com/Ada-Developers-Academy/pedagogy/blob/master/rule-of-three.md#stage-1) project
- Due before class, <DATE>

## Intro

Let's make a planetary system!

Our customer needs to be able to learn about a solar system. By the end of our Solar System project, our customer will be able to interact with the program and choose which pieces of information they can see at a time, specifically by choosing which planet.

In wave 1, this project will encourage us to work with hard-coded data, which allows our code to be more simple and readable with a small amount of data. In wave 2, this project will shift our code away from the hard-coded data and instead to use classes. Using classes will allow our code to be more extensible. In wave 3, we will use that work from wave 2 to allow a user to interact with the program, view all planets, and create a new planet.



## Learning Goals

- Practice creating custom classes
- Use a hash to initialize an object
- Create an object which contains a collection of other objects
- Practice creating instance methods


## Wave 1
The learning goal for this wave is to practice working with individual instances of a single class.

### Instructions

1. Create a class called `Planet`. Each instance of this class will keep track of information about a single planet.

    Pay attention to the details of the class name `Planet`:

    - Class names always start with a capital letter
    - Class names are usually a noun or noun-phrase
    - Because each instance is only one planet, we use a singular noun (`Planet` instead of `Planets`)

1. Add a constructor to your `Planet` class. Your constructor should take at least these 5 parameters:
    - `name`
    - `color`
    - `mass_kg`
    - `distance_from_sun_km`
    - `fun_fact`

    Each parameter should be saved in an instance variable with the same name (e.g. `@color` for `color`). These instance variables should be _readable_ from outside the class, but not _writable_.

    Once you're done, you should be able to write code like this:

    ```ruby
    earth = Planet.new('Earth', 'blue-green', 5.972e24, 1.496e8, 'Only planet known to support life')

    puts earth.name
    # => Earth
    puts earth.fun_fact
    # => Only planet known to support life

    earth.color = 'pink'
    # => NoMethodError: undefined method `color=' for #<Planet:0x00007fcfba04c130>
    # => Did you mean?  color
    ```

1. Below your `Planet` class, add a method called `main` that will exercise your code. This method should create two different instances of `Planet` and print out some of their attributes. You will need to invoke `main` as the last line of your program.

1. Add an instance method to `Planet` called `summary`. This method should _return_ (not `puts`) a string containing a nicely-formatted description of the planet. Exercise your `summary` method in the `main` method.

    **Question:** Why do we `puts` in `main` but not in `Planet#summary`?

1. **OPTIONAL:** Add error checking to your constructor.
    - Both `mass_kg` and `distance_from_sun_km` must be numbers that are greater than zero.
    - What should your program do if they aren't?
    - How will you make sure this behavior works?

1. **OPTIONAL:** Rewrite your `main` method as a series of minitest tests.

## Primary Requirements
- Create a `SolarSystem` class with an `@planets` instance variable.
- Create an initialize method which should take a collection of planet names and store them in an `@planets` instance variable.
- Create a method that adds a planet to the list (not using user input).
- Create a method which will return, **not print**, a list of the planets as a String in this style:

```bash
1.  Mercury
2.  Venus
3.  Earth
4.  Mars
5.  Jupiter
6.  Hoth
```
- Write code to test your SolarSystem
- Instead of Strings for planets, modify SolarSystem's `initialize` method to take a list of hashes where each planet is sent as a hash with at least 5 attributes. For example, your code _could_ now look like this:
```ruby
planet_a = { name: "Planet A", attrA: "A", attrB: "B" }
planet_b = { name: "Planet B", attrA: "C", attrB: "D" }
my_solar_system = SolarSystem.new( [ planet_a, planet_b ] )
```

## Optional Enhancements
- Give each planet a `year_length` attribute which is the length of time the planet takes to go around its star.  
- Give each planet a `distance_from_the_sun` attribute
- (This becomes a requirement in Wave 3.) Write a program that asks for user input to query the planets:
  - First, ask the user to select a planet they'd like to learn about.
  - Present the user with a list of planets from which they can choose. Something like:
    - `1. Mercury, 2. Venus, 3. Earth, 4. Secret Earth, 5. Mars, 6. Jupiter, ... 13. Exit`
  - Provide the user with well formatted information about the planet (diameter, mass, number of moons, primary export, etc.)
  - Then ask the user for another planet.

# Wave 2
The learning goal for this wave is to work on building multiple classes, and composing these classes together.

## Primary Requirements
- Create a `Planet` class which will represent a planet.
    - Add an `initialize` method which takes several arguments and uses them to set the class' instance variables.
    - Create a method that **returns** the Planet's attributes in an easy to read fashion.
    - Create reader methods to give a user access to read the instance variables.
- Make your `SolarSystem` class take an array of `Planet`s instead of hashes.
    - When printing the planet list or planet details, it should call the corresponding method in `Planet`.

## Optionals
-  (This becomes a requirement in Wave 3.) Create a method, outside any class, which creates a planet from user input.

# Wave 3
The learning goal for this wave is to build a UI.

## Primary Requirements
- Create an interface where the user can interact with the solar system and be able to select a planet and view information about it.  
- Allow your user to add their own planet.  

## Optional Enhancements
- Ensure that the each planet has a `@distance_from_the_sun` attribute. Using this data, add a method to determine the distance from any other planet (assuming planets are in a straight line from the sun)
- Give your solar system an age (in earth years).
- Define a method that returns the local year of the planet based on it's rotation since the beginning of the solar system

## What Instructors Are Looking For
Checkout the [feedback template](feedback.md) for how instructors will evaluate your project.
