---@meta

---@class ShapeBase: GameBase
---@field dumpMeshVisibilty fun(self: self)
---@field getEyePoint       fun(self: self): vec3 Not camera!
---@field getEyeTransform   fun(self: self): MatrixF
---@field getEyeTransformF  function
---@field getEyeVector      fun(self: self): vec3
---@field getLookAtPoint    fun(self: self): id,number,number,number | nil
---@field getModelFile      fun(self: self): file-path|''
---@field getTargetCount    fun(self: self): number
---@field getTargetName     fun(self: self, index: uint): string 0-indexed
---@field getVelocity       fun(self: self): vec3 0 while paused

--- Constructor
---@return ShapeBase
function ShapeBase() end
