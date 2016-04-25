MARS ROVER CHALLENGE
---



Assumptions
---
- Rovers can occupy the same position
- Rovers can not go over the edge of the plateau

Design
---

This design is composed of a *Grid*, *Orientator* and *Rover* class. There are also *Controller* class that parses the input as formatted by the brief, and tells the different classes how to interact, behaving as factories.

  *Orientator class*

  *  The responsibility of this class is to understanding bearings and directions. I saw it as an object that the rover would have - like a navigator. It is something that could be recycled and injected into a another moving object.

  * I decided not to hardcode the cardinal points into the Orientator class, in order to adhere to the Open-Close Principle. The cardinal points, with their corresponding bearing, can be injected into the class in hash form. These could be stored as a constant in a separate file, which would be useful if a range of different classes depended on them within a system. This means these commands can be easily altered. You could for example add :NW, :NE etc, or change :N to :North easily.

  * I decided that bearings in radians should be the primary attribute of  this class, because this is something that can be mapped to a wide variety of scenarios, rather than storing the more superficial cardinal point - like :North, :East - which can now be changed(as discussed above). It also allows for a range of trig functions to be used. In other scenarios, bearings in radians is more likely to be readable to other classes.

  This is in comparison to an initial draft which contained the following:


  `CARDINAL_POINTS = {
  North: [0,+1],
  South: [0,-1],
  West: [-1, 0],
  East: [+1,0]
  }`

   The above meant that, to add more/change the cardinal points, either:
    *a)* If the hash was injected in, a lot of logic would have to be contained within this hash, that arguably, should be part of the orientator class. The orientator would have to assume a lot about this hash - understanding how to interact with array values.
    *b)* Or it would be hard coded into the class.

    There are less obvious  ways to add other cardinal points like :North_West ; the data is not as malleable.

  -  Turning commands: "left", "right", are injected in the same way as the cardinal_points, to adhere to the Open Close Principle.

  *Rover class*

  -  The responsibility of the rover class is to move, turn, land and have a position. It relies on the direction_vector provided by the orientator, injected in, to know in which direction to move.

  - It also has a grid injected in because it needs to be able to know the boundaries of the grid/surface it is on.



  *Grid class*
   * The grid class models the plateau (named grid for ease of spelling!). It is initialized with a 2 coordinates - the second of which defaults to [0,0] if not entered. (The controller allows this default to occur).

   * There are private methods which clarify what the lower boundary and upper boundary of the x and y values. Given that the brief specifies that the inputted coordinate would be the upper-right corner, these are potentially unnecessary for an MVP. There could be a method which ensures that the positive values are inputted for the upper-right coordinate on initialization, and the other coordinate is always set to [0,0].
   My approach does, however, allow for flexibility/recyclability. If the grid was part of larger grid, for example, and the second coordinate was (-5,-5), it would still function. And, there is an option to set the second coordinate.



  Improvements
   ---

   -  I would like to work on refactoring and simplifying the controller methods - particularly the rover controller; they are currently too long. Also, because the logic of how the input relates to commands "L" means rover.turn(:l), it does not adhere very well to the Open Closed principle.
   - Change the design so that rovers cannot occupy the same space
