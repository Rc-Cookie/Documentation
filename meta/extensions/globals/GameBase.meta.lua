---@meta

--- Adds material information
---@class GameBase: SceneObject
---@field getFirstMaterialName fun(self: self): string?
---@field getMaterialNames     fun(self: self): string[]
---@field getMeshMaterialNames fun(self: self): string[]
---@field isRenderEnabled      fun(self: self): boolean

--- Constructor
---@return GameBase
function GameBase() end
