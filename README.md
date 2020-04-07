
<h1 align="center">Roax</h1>

<div align="center">
	An object orientation module for organized game development on the ROBLOX platform.
</div>

<div>&nbsp;</div>

## About
Roax is a Object Orientation module for ROBLOX, and streamlines object-oriented development on the platform. This is possible because of the modular consistancy that Roax encourages and assists in doing.

Roax is very simple to use, as long as you have prior knowledge on object-oriented programming, and using Lua on the ROBLOX platform. It's helpful to know how to utilize Rojo, as Roax is fully-compatible with Rojo's framework.

## Using Roax
### Installation
To install Roax's framework, just run the code below

```lua
local Http = game:GetService("HttpService") Http.HttpEnabled= true loadstring(Http:GetAsync("https://raw.githubusercontent.com/Accutrix/Roax/Install.lua"))()
```
### Creating Classes
 Roax was made for streamlined object-oriented programming meaning creating classes couldn't be easier! Roax classes are modules that must return a function. This function is known as the execution function, because it is run with the Roax module as the first parameter. Using this, any previously created custom classes can also be accessed. To properly create a class, the "Object" and "Class" objects must be utilized. 
 ### Using classes
 Roax has many ways to use classes. You'll first want to get the class from the Roax module, which can be done with the  following
 ```lua
 -- example "Game" class utilization
 local Game = Roax.Game
```
Now that we have the Game class variable defined, we can create an object using it's constructor function. To access the constructor function, we can go by with two ways. The first would be to do `Game.new("MyGame")` and index it's "new" index. The other way would be to just call `Game` as a function, which would look like `Game("MyGame")`. 
 ### Core classes
  #### Class
  The Class object is used primarily for it's constructor function, which takes 2 parameters. The first is the table with all the class's data. The second is the class's constructor function, which is not needed if it's in the "new" index of the class's table.
  #### Object
  The Object object (*don't get confused!*) is also primarily used for it's constructor function, which takes 4 parameters. The first parameter is the class's name. The second is a table of *properties* and their default values. The third is a table of *methods* and their functions (must be with the ":" operator for the internal *self* parameter). The fourth parameter is a function, which will be called whenever the object is called as a function (this is optional).

## Implementations
Roax allows for you to create custom classes, here's what a "Game" object would look like.
```lua
local Class
local Object

local Game = { } -- The table for the Game class

function Game:Start()
	print(self.Name .. " - starting") -- Will result in "Game - Starting" if the "Game" object's Name property is still "Game"
end

function Game.new() -- The constructor function (it can be something else other than ".new", as long as it's listed as the second parameter of the Class constructor function)
	local CreatedGame = Object.new("Game", { -- The second paramater of the Object constructor function: a table of properties
		Name = "Game" -- "Name" is a property that's deafult value will be "Game"
		Players = { }; -- "Players" is a property of the created "Game" object that is a table
		Map = Instance.new("Model"); -- "Map" is a property of the created "Game" object that is an Instance
	}, { -- The third parameter of the Object constructor function: a table of methods
		Start = Game["Start"];
	})
end

return function(Roax) -- Modules are returned a function wi
	Class = Roax.Class
	Object = Roax.Object
	return Class.new(Game)
end
```
Here's how we'd add the "Game" module to Roax's class directory 
```lua
local GameModule = script:WaitForChild("Game")
local Game = Roax:AddClass("Game", require(GameModule)(Roax))
```
Now that we have the Game class defined in a local variable, we can use it to create objects!
```lua
local MyGame = Game.new("MyGame")
```
If you'd want to go about calling `Game` as a function, you'd want to do this.
```lua
local MyGame = Game("MyGame")
```

## Community

* [Discord]("https://discord.io/accutrix")
