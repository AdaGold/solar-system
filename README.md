# Solar System

## At a Glance

- Build a model of a solar system to practice working with classes
- Individual, [stage 1](https://github.com/Ada-Developers-Academy/pedagogy/blob/master/classroom/rule-of-three.md#stage-1) project
- Due before class, **Wednesday Sept 23rd**

## Learning Goals

- Create a class to tie together data and methods
- Create a class which manages a collection of other objects
- Write code that interacts with classes

## Project Structure

This project is broken up into three waves, each of which consists of a number of steps. You should `git commit` after you've completed each step!

## Wave 1

The learning goal for this wave is to practice working with individual instances of a single class.

### Instructions

1. In a file called `planet.rb`, create a class called `Planet`. Each instance of this class will keep track of information about a single planet.

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
    # Load Planet into pry:
    # $ pry -r ./planet.rb
    earth = Planet.new('Earth', 'blue-green', 5.972e24, 1.496e8, 'Only planet known to support life')

    puts earth.name
    # => Earth
    puts earth.fun_fact
    # => Only planet known to support life

    earth.color = 'pink'
    # => NoMethodError: undefined method `color=' for #<Planet:0x00007fcfba04c130>
    # => Did you mean?  color
    ```

1. Add another file, `main.rb`. This file should `require_relative` `planet.rb`, and contain one method called `main` that will exercise your code. This method should create two different instances of `Planet` and print out some of their attributes.

    `main.rb` should have this structure:

    ```ruby
    # main.rb
    require_relative 'planet'

    def main
      # ... do stuff with planets ...
    end

    main
    ```

    Note that we invoke `main` as the last line of your program.

1. Add an instance method to `Planet` called `summary`. This method should _return_ (not `puts`) a string containing a nicely-formatted description of the planet. Exercise your `summary` method in the `main` method.

    **Question:** Why do we `puts` in `main` but not in `Planet#summary`?

1. **OPTIONAL:** Add error checking to your constructor.
    - Both `mass_kg` and `distance_from_sun_km` must be numbers that are greater than zero.
    - What should your program do if they aren't?
    - How will you make sure this behavior works?

1. **OPTIONAL:** Add minitest tests for `Planet`.

## Wave 2

In this wave you will build a second class, `SolarSystem`, which is responsible for keeping track of a _collection_ of instances of `Planet`.

### Instructions

1. In a new file called `solar_system.rb`, create a new class called `SolarSystem`.
    - The constructor should take one parameter, `star_name`, and save it in an instance variable.
    - Each `SolarSystem` should have an instance variable called `@planets`, which will store an array of planets. When the `SolarSystem` is created, `@planets` should be set to an empty array.
    - Both `@star_name` and `@planets` should be _readable_ but not _writable_.

1. Create a method `SolarSystem#add_planet`, which will take an instance of `Planet` as a parameter and add it to the list of planets.

1. Create a method `SolarSystem#list_planets`, which will _return_ (not `puts`) a string containing a list of all the planets in the system. The string should be formatted in this style:

    ```bash
    Planets orbiting <star name>
    1.  Mercury
    2.  Venus
    3.  Earth
    4.  Mars
    5.  Jupiter
    ```

1. Update your driver code in `main.rb` to create an instance of `SolarSystem`, add all your `Planet`s to it, and then print the list. Here is an example with one `Planet`:

    ```ruby
    solar_system = SolarSystem.new('Sol')

    earth = Planet.new('Earth', ...)
    solar_system.add_planet(earth)

    list = solar_system.list_planets
    puts list
    # => Planets orbiting Sol
    # => 1.  Earth
    ```

    **NOTE:** When you first run your driver code, you may get an error like this:
    ```
    NameError: uninitialized constant SolarSystem
    ```

    What does this error mean? What do you need to do to fix it?

1. Create a method `SolarSystem#find_planet_by_name`, that takes the name of a planet as a string, and returns the corresponding instance of `Planet`. The lookup should be case-insensitive, so that `Earth`, `earth` and `eArTh` all return the same planet.

    Update your driver code to exercise this method:

    ```ruby
    found_planet = solar_system.find_planet_by_name('Earth')

    # found_planet is an instance of class Planet
    puts found_planet
    # => #<Planet:0x00007fe7c2868ee8>

    puts found_planet.summary
    # => Earth is a blue-green planet ...
    ```

    Questions for you to consider as you write this method:
    - What should your method do if there is no planet with the given name?
    - What should your method do if there are multiple planets with the given name?
    - Is there a built-in Ruby enumerable method that could help you here?

1. **OPTIONAL:** Create a method, `SolarSystem#distance_between`, that takes two planet names as parameters and returns the distance between them.

    You can assume that all the planets are lined up in a straight line.

1. **OPTIONAL:** Add minitest tests for `SolarSystem`.

## Wave 3

In this wave, you will build a command line interface (CLI) to allow a user to interact with your classes. This will _replace_ the driver code currently in the `main` method of `main.rb`.

### Instructions

1. Restructure `main` to do the following:
    1. Create a `SolarSystem` and add some `Planet`s
    1. Enter a control loop that repeatedly asks the user what to do next. The two options at this point are `list planets` and `exit`.

    Remember that you've already implemented listing planets - you should be able to call that method rather than recreating the logic here.

1. Add a `planet details` option to the control loop. When the user picks this option, the program should should call a separate method that will:
    1. Ask them for the name of the planet they wish to learn about
    1. Display details for that planet

    Again, you should reuse a method you've already built to handle formatting the planet information.

1. Add an `add planet` option to the control loop. When the user picks this option, the program should call a separate method that will:
    1. Ask the user for details about the planet
    1. Create a new instance of `Planet` with that info
    1. Add it to the `SolarSystem`

    The new planet should now appear in the list of planets, and the user should be able to see its details.

1. **OPTIONAL:** Add error handling to the control loop. What happens if the user enters a bad command, asks for details on a planet that doesn't exist, or enters an bad value for a new planet's mass?

1. **OPTIONAL:** Implement the optional `distance_between` method from wave 2, then add an option to the control loop to expose it to the user.

## What Instructors Are Looking For
Checkout the [feedback template](feedback.md) for how instructors will evaluate your project.
