---@meta

--- Id of a player, 0-indexed. The default player is player 0.
---@alias player-id uint

--- Lists known callback functions on extension modules.
---@class Extension: table
---@field onPreLoad          fun()?
---@field onExtensionLoaded  fun()?
---@field onFreeroamLoaded   fun(level: file-path)?
---@field onUpdate           fun(dtReal: number, dtSim: number, dtRaw: number)?
---@field onSpawnCCallback   fun(obj: id)?
---@field onVehicleSpawned   fun(id: id, vehicle: BeamNGVehicle)?
---@field onVehicleSwitched  fun(old: id|-1, new: id|-1, player: player-id)? Called when a player switches the controlled vehicle.
---@field onAiModeChange     fun(vehicle: id, mode: ai-mode)? Called when the main AI mode was changed for a given vehicle.
---@field trackAISingleVeh   fun(vehicle: id)? Called when some property of the AI settings changed for a given vehicle.
---@field onVehicleDestroyed fun(vehicle: id)? Called when a vehicle is destroyed
---@field onDespawnObject    fun(object: id, someFlag: boolean)?

-- Very much unfinished.
