---@meta

---@class BeamNGVehicle: ShapeBase
---@field addFlexmesh                  fun(self: self, mesh: file-path): uint
---@field addPhysicsTriangle           fun(self: self, maybeNodeA: number, maybeNodeB: number, maybeNodeC: number)
---@field addProp                      fun(self: self, rigidMesh: file-path): uint
---@field addResourceSearchPath        fun(self: self, path: file-path)
---@field addTrigger                   fun(self: self, something: string): number
---@field applyClusterVelocityScaleAdd fun(self: self, unknown: number, scale: number, addX: number, addY: number, addZ: number) Scales the existing velocity of the vehicle, then adds more. Uniformly across all nodes, so no immediate forces.
---@field autoplace                    fun(self: self): boolean Also repairs
---@field changeMaterial               function
---@field queueLuaCommand              fun(self: self, luaCode: string)
-- TODO: complete

--- Constructor
---@return BeamNGVehicle
function BeamNGVehicle() end
