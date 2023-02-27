---@meta

--- Parameters that fine-tune the behavior of the AI.
---@class AIParameters
---@field turnForceCoef number Coefficient for curve spring forces (default `2`)
---@field awarenessForceCoef number Coefficient for vehicle awareness displacement (default `0.25`)
---@field edgeDist number Minimum distance from the edge of the road, in meters (default `0`)
---@field trafficWaitTime number Traffic delay after stopping at an intersection, in seconds (default `2`)
---@field enableElectrics boolean Whether the AI is allowed to automatically use electrics such as hazard lights (default `true`)
---@field driveStyle ai-drive-style
---@field staticFrictionCoefMult number (default and at most `0.95`)
---@field lookAheadKv number (default `0.65`)

--- State of the AI.
---@class AIState
---@field cutOffDrivability number
---@field debugMode 'all'|'off'
---@field driveInLaneFlag 'off'|'on' Whether the AI should follow (preferrably the legal) road lanes.
---@field extAggression number
---@field extAvoidCars 'auto'|'on'|'off'
---@field manualTargetName scene-name?,
---@field mode ai-mode
---@field routeSpeed number? Target speed in m/s, the meaning of this speed is determined by `speedMode`
---@field speedMode ai-speed-mode The way that `routeSpeed` is interpreted
---@field targetObjectID id|-1|nil The target vehicle that is for example being chased, or `-1`.

--- Configuration for how the AI should drive a specific waypoint path. One of
--- `path` and `wpTargetList` must be specified.
---@class AIPathOptions
---@field path scene-name[]? A sequence of waypoint names that form a path by themselves to be followed in the order provided.
---@field wpTargetList scene-name[]? A sequence of waypoint names to be used as succesive targets. Between any two consequitive waypoints a shortest path route will be followed.
---@field script table? Another option besides `path` and `wpTargetList`, but isn't actually used
---@field wpSpeed table<scene-name, number>? Overrides for the route speed when driving to a given waypoint.
---@field noOfLaps integer? Sets that the path is looped and driven multiple times, as often as specified
---@field routeSpeed number? Target speed in m/s, the meaning of this speed is determined by `routeSpeedMode`
---@field routeSpeedMode ai-speed-mode? The way that `routeSpeed` is interpreted
---@field driveInLane 'on'|'off'|nil Whether the AI should follow (preferrably the legal) road lanes. Off if not specified.
---@field aggression number? How much "at the limit" the AI drives, in the range 0.3 - 1.
---@field avoidCars 'on'|'off'|nil Whether the AI should try avoiding other cars.
---@field resetLearning boolean? Off by default
---@field driveStyle ai-drive-style? Does nothing (implementation is empty)
---@field staticFrictionCoefMult number? Default and at most `0.95`
---@field lookAheadKv number? At least `0.1`, default is `0.65`

-- TODO: Create proper class definition
---@alias AIPlan table

--- Wraps a script ai script.
---@class ScriptAIScriptObj
---@field path ScriptAIScript

--- A script for the script AI to follow. Mainly an array of `ScriptAINode`s.
---@class ScriptAIScript
---@field timeOffset number? An offset for all timestamps in the script; positive values decrease the time to the start or potentially cause some nodes to be skipped.
---@field startDelay number? An offset for all timestamps in the script; positive values cause a later start
---@field loopCount integer? How many times to loop the script, `1` by default.

--- A node in the script AI script route.
---@class ScriptAINode: xyz
---@field t number The time in seconds since the start of the route
---@field dir xyz The forwards of this node, as a direction vector
---@field up xyz The upwards orientation of this node, as a direction vector

--- State that the script AI is currently in.
---@class ScirptAIState
---@field status 'recording'|'following' What the script AI is currently doing
---@field time number The time in seconds since the script (recording / following) started
---@field scriptTime number? How much time should have passed ideally to be at the current location
---@field endScriptTime number? The estimated (target) time when to finish the script path (once)
---@field posError number? The distance by which the script path is currently missed
---@field targetPos vec3? The current driving target
---@field startDelay number? The offset for the start of the script, in seconds, if configured



--- Controls the behavior of the AI for a specific vehicle.
---@class AI
---@field targetObjectId id|-1 The id of the target vehicle used by some modes like "chase", if any.
local AI = { }



--- Toggles that the AI drives within the road lanes.
---@param mode boolean|'on'|'off' The mode to set
function AI:driveInLane(mode) end

function AI:stateChanged() end

function AI:reset() end

--- Sets the AI mode.
---@param mode ai-mode? The mode to set
function AI:setMode(mode) end

--- If the current AI mode is not `traffic`, it it set to it, otherwise to `stop`.
function AI:toggleTrafficMode() end

--- Sets whether the AI looks out for other vehicles.
---@param mode boolean|'on'|'off'|'auto' Whether to avoid cars. If `'auto'` it is set to on exactly if the mode is not `"manual"`.
function AI:setAvoidCars(mode) end

--- Sets the target waypoint (not target vehicle, use `targetObjectID`).
---@param wp scene-name The waypoint to drive to
function AI:setTarget(wp) end

---@param path scene-name[]
function AI:setPath(path) end

--- Sets the speed target for the AI. If and how this speed is interpreted
--- depends on the speed mode set.
---@param speed number? Speed in m/s
function AI:setSpeed(speed) end

--- Sets the speed mode for the AI. The target speed can be set using `setSpeed()`.
---@param mode ai-speed-mode The speed mode to set
function AI:setSpeedMode(mode) end

--- Fine-tunes the AI's behavior.
---@param params AIParameters The parameters to set
function AI:setParameters(params) end

--- Dumps the current state of the parameters into the console.
function AI:dumpParameters() end

--- Sets the AI debug mode.
---@param mode 'trajectory'|'route'|'speeds'|'off' The mode to set
function AI:setVehicleDebugMode(mode) end

--- Sets the state of the AI.
---@param state AIState The state to set
function AI:setState(state) end

--- Returns the state of the AI.
---@return AIState state The current AI state
function AI:getState() end

---@param focusPos vec3
function AI:debugDraw(focusPos) end

--- Sets the AI to manual mode driving a specific list of waypoints.
---@param options AIPathOptions Configures which and how the path should be driven
function AI:driveUsingPath(options) end

--- Sets the AI aggression mode.
---@param mode 'rubberband'? The mode to set. Rubberband will increase the aggressiveness when _closer_ to the player.
function AI:setAggressionMode(mode) end

function AI:setAggression(aggression) end

--- Sets the target vehicle by id, used by some AI modes like chase and flee.
---@param id id|-1 The id of the target vehicle to set
function AI:setTargetObjectID(id) end

--- Toggles logging of AI data.
---@param file file-path? The file to log to, if starting. Otherwise this value is ignored.
function AI:startStopDataLog(file) end

---@param plan AIPlan
---@param dist number
---@param signedDisp number
---@param startNode uint?
---@param endNode uint?
---@param commitToLane boolean?
function AI:laneChange(plan, dist, signedDisp, startNode, endNode, commitToLane) end

---@param plan AIPlan
---@param dist number
function AI:setStopPoint(plan, dist) end

--- Dumps information about the AI's current route into the console.
function AI:dumpCurrentRoute() end

--- Sets the AI mode to `span`.
---@param cutOffDrivability number? The preferred minimum drivability of the roads to drive
function AI:spanMap(cutOffDrivability) end

--- Sets the AI's preferred minimum drivability rating for roads to select.
---@param cutOffDrivability number? The minimum drivability to set
function AI:setCutOffDrivability(cutOffDrivability) end

--- Does nothing.
function AI:resetLearning() end

--- Returns whether the AI is currently controlling the vehicle.
---@return boolean driving Whether the AI is currently controlling the vehicle
function AI:isDriving() end

--- Starts script AI recording, clearing any currently recorded script.
function AI:startRecording() end

--- Stops the current script AI recording
---@return ScriptAIScriptObj script The generated script
function AI:stopRecording() end

--- Sets the AI to script AI mode and starts following the given script.
---@param script ScriptAIScript|ScriptAIScriptObj The script to follow
---@param timeOffset number A time offset for every node in the script
---@param loopCounter number How many times to repeat the route
---@param loopType script-ai-loop-type When to reset when looping
function AI:startFollowing(script, timeOffset, loopCounter, loopType) end

--- Stops script AI execution immediately and sets the AI mode to `disabled`.
---@param centerSteering boolean? Whether to center the steering wheel or to leave it currently is
---@param engageParkingbrake boolean? Whether to engage the parking brake
function AI:stopFollowing(centerSteering, engageParkingbrake) end

--- Stops script AI execution immediately and sets the AI mode to `disabled`.
---@param centerSteering boolean? Whether to center the steering wheel or to leave it currently is
---@param engageParkingbrake boolean? Whether to engage the parking brake
function AI:scriptStop(centerSteering, engageParkingbrake) end

--- Returns the current state of the script AI execution.
---@return ScirptAIState state The current script AI state
function AI:scriptState() end
