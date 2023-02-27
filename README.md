# Unofficial BeamNG.drive Lua API Documentation

An unofficial (very much unfinished) documentation collection of the Lua code shipped with BeamNG.drive, designed for [this VS Code Lua extension](https://marketplace.visualstudio.com/items?itemName=sumneko.lua). Created by trial and error via the console, by inpecting the existing lua files and from web sources. I added comments if I know myself what the functions and classes do, but even just having a somewhat complete list of the available functions makes using the API a lot easier.

I am not part of BeamNG in any way and am not in contact with them, so nothing I have written in my documentation is 100% prooven. Some functionallity can be examined pretty well by looking into the source code, but particularly C-side objects and functions can only be tested from the console. If I have written actual text to the functions that usually means that I'm pretty sure what the function does, if not, I probably don't know.

I seriously wonder whether BeamNG has some kind of internal documentation for their code, or if they just "have to know" their codebase.

## Structure

I've tried to stick as close to the BeamNG directory structure as possible, splitting the code into `common` (code available for both game engine and vehicle VMs), `ge` (code only available to the game engine VM) and `vehicle` (code available only to the vehicle VMs). I personally usually create stuff running in the game engine VM, so you will find a lot more documentation for that.

## Bind the documentation to the Lua extension

To bind the documentation to your project, download the documentation and add the two directories that you need for your project as library paths for the Lua extension. This can be done using the `"Lua.workspace.library"` setting. I don't think you can reference different libraries for different parts of your project, so you'll either need two different VS Code instances, or will have to bind both the `ge` and the `vehicle` directory if your project has code for both VM types.

## API overview

Even with some documentation it can be hard to find some starting point and get an overview to what's possible. Here is what I know myself so far:

### Multiple VMs

The core of BeamNG is written in C/C++. This code also runs Lua VMs, mut not just one. There is

 - one "main" VM that runs on the game engine thread. This thread has access to the scene and can modify it, and runs all the time, even on the main screen. This VM (and all the other VMs with it) can be restarted using `CTRL+L`. Additionally, there exits
 - one Lua VM per spawned vehicle. These VMs can control the vehicle functionallities, and can obtain much more in-depth information about the vehicle itself. They do not have proper access to the rest of the scene though. Each vehicle VM can be reloaded individually using `CTRL+R`.

Remember, the VMs are basically different processes, they don't share variables, and neither do they share all libraries (also not the vehicle VMs between each other). There are three scopes for code in BeamNG:

 - Code in the `lua/common` directory is available to both the game engine and the vehicle VMs.
 - Code in the `lua/ge` directory is game engine VM exclusive.
 - Code in the `lua/vehicle` directory is only accessible to vehicle VMs.

The VMs can communicate with each other, _but not synchronized_. That means that it is impossible to simply read a variable from another VM. The best workaround for this is using callbacks instead. The main functions for communication are:

 - `BeamNGVehicle:queueLuaCommand(luaCode)` is available in the game engine VM and executes the given code some time in the future inside the vehicle's VM.
 - `queueGameEngineLua(luaCode)` is available in the vehicle VMs and executed the given code some time in the future inside the game engine VM.

By combining the two you can create callbacks. Don't think however that you can wait on one VM for the queued code to be executed on the other, it doesn't work and will freeze the game.

### Generic Lua

Important globals and classes:

 - `vec3` is used to represent 3d vectors. They are created using `vec3(x,y,z)` and have operator overloading, they are widely used.
 - `quat` is the main quaternion representation, created using `quat(x,y,z,w)` although you will likely not create them yourself.
 - `Point4F` is a point with x, y, z and w component and used for all kinds of stuff
 - `Box3` represents axis-aligned bounding boxes.
 - `ColorF` and `ColorI` represent colors in float (0-1) and integer (0-255) range.
 - `jsonReadFile(file)` is can be quite helpful since most data is stored in JSON format.
 - `dump(any...)` prints anything into the console, expanding tables recursively. `dumps()` does the same but into a string instead of the console, if you need it.

There are some more classes, and particularly there are some duplicate classes for some reason. For example, there also exists a `QuatF` class which also represents quaterions.

BeamNG widely uses a module system with "extensions", modules that can be loaded and unloaded at runtime. An extension can be created by simply creating a module object in a lua file, adding functions to it and finally returing it at the end of the script. Using `extensions.load(extensionPath)` extensions can then be loaded (by require path). Some modules are also loaded automatically by BeamNG. After loaded, they can also be accessed by global variable, by replacing every slash in the path with an underscore, for example the module in the file `scenario/myCode.lua` can, once loaded, be accessed globally as `scenario_myCode`.

A tricky thing is finding out how the callback functions are actually named. The documentation class `Extension` lists all known callback functions. There are _a lot_ of callback functions, but here are some examples that might be interesting:

 - `onUpdate(realDt,simDt,rawDt)` is called every frame
 - `onBeamNGTrigger(eventInfo)` is called every time a vehicle enters or exists a BeamNGTrigger, which can be created from the world editor.

If you want to execute lua code when the game starts (or your mod gets activated) you can create a file `scripts/<modDirName>/modScript.lua`. This code will get executed automatically, you may use it to register other modules if you need them to be active all the time.

### Game Engine Lua

Objects that exist in the scene have a relatively complex inheritance structure, which builds up on the structure from _Torque3d_, the game engine that BeamNG uses:

 - `SimObject` is the base class of all objects (even some abstract classes that aren't actually in the scene)
 - `SceneObject` inherits from `SimObject` and represents an object in the scene. Every object in the BeamNG world, vehicles, props, roads, buildings, triggers... are scene objects.
 - `BeamNGVehicle` is the type of object that has a JBeam structure. This not only includes normal vehicles, but also props. Every BeamNGVehicle has its own Lua VM.

Besides these classes, there are a lot more, basically every type of object that can be created from the world editor (`F11`) has its own class.

Important globals and classes include:

 - `scenetree`: Gives read-access to the scene, to find objects anywhere.
 - `FS`: The virtual file system of BeamNG, adds reading and writing functions to the limited functions from the `io` object.
 - `be`: Access to the core game engine
 - `be:getPlayerVehicle(playerNo)`: Returns the player's vehicle

### Vehicle Lua

Important globals and classes:

 - `obj`: Represents the vehicle that the VM belongs to
 - `ai`: AI controls
 - `electrics`: Controls for vehicle functions such as pedal inputs
 - `drivetrain`
 - `wheels`
 - `powertrain`

### Good to know

 - `.cs` files are _not_ C# files, despite having the same suffix. They are actually _TorqueScript_ files, a language from the Torque3d engine.
 - Actually _a lot_ of BeamNG seems to be coded in Lua. So there is a good chance that whatever you want to do is accessible from Lua, or simply impossible with the current state. For example, the AI system is 100% written in Lua.

## Background

I recently started getting interested into BeamNG.drive modding. I've never used Lua before, so I had a bit of a difficult time getting into it at all. Luckily, Lua isn't that hard.

What I found really difficult is finding even the most basic API functions, as the BeamNG API is really poorly documented. There are a few webpages which contain actual documentation, and some pages which just list existing globals (but no information on what they do). Unfortunately, these pages are very incomplete, partially outdated, and mainly basically nothing in comparison to the size of the API.

I found that the Lua extension I used with VS Code actually supports documenting via comments, and particularly, it allows you to mark files as purely documentation. Since then I have started documenting all the API I come accross. I personally always enjoyed having good documentation also for my own code if the editor also shows it to me with autocomplete. Besides, I usually code in languages like Java or C# and am a big fan of statically typed languages, and I miss this in Lua. By documenting the code in such a way the language server can also add type information, greatly improving the autocompletion functionallity.

---

I am happy about anyone that would like to collaborate on this project :)
