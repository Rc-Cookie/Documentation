---@meta

--- Calculates a raycast.
---@param origin vec3 The ray origin
---@param direction vec3 The direction of the ray
---@param maxLength number The maximum length for a collision
---@param someFlag boolean?
---@return number length The distance to the hit, or a value >= `maxLength`
function castRayStatic(origin, direction, maxLength, someFlag) end
