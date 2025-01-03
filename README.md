# rovers

## Problem
A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This plateau, which is curiously rectangular,
must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain to 
send back to Earth.A rover's position and location is represented by a combination of x and y co-ordinates and a letter 
representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation. 
An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North. In order to 
control a rover, NASA sends a simple string of letters. The possible letters are 'L', 'R' and 'M'. 'L' and 'R' makes the
rover spin 90 degrees left or right respectively, without moving from its current spot. 'M' means move forward one grid 
point, and maintain the same heading.
Assume that the square directly North from (x, y) is (x, y+1). 

## Input
The system expects a .txt file, its name must be `input_rover.txt`, it must be in the project folder before execution.

## Output
The system returns the coordinates where the robot stopped and which direction it is looking.

## Requirements
* Docker

## Running
Replace the values in the `input_rover.txt` with the desired parameters.
Then run the program using the following commands:

Build container
```sh 
docker compose build
```

Running
```sh
docker compose run rover
```

## Tests
Run the following command:
```sh
docker compose run rover rspec
```

If you need check the tests coverage:
```sh
docker compose run rover bash -c "rm -rf coverage && rspec"
```

After that, open the file coverage/index.html
```sh
open coverage/index.html
```
