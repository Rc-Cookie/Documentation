---@meta

---@class SimObject: ConsoleObject
---@field clone              fun(self: self): self
---@field delete             fun(self: self)
---@field dump               fun(self: self) Print into console
---@field dumpGroupHierarchy fun(self: self)
---@field name               scene-name
---@field getName            fun(self: self): scene-name
---@field setName            fun(self: self, name: string)
---@field getClassName       fun(self: self): string
---@field getDeclarationLine fun(self: self): uint|-1
---@field getGroup           fun(self: self): SimGroup
---@field getID              fun(self: self): id
---@field getId              fun(self: self): id Identical to `getID`
---@field isChildOfGroup     fun(self: self, group: SimGroup): boolean
---@field hidden             boolean?
---@field isHidden           fun(self: self): boolean
---@field registerObject     fun(self: self, name: scene-name): self
---@field setHidden          fun(self: self, hidden: boolean)
---@field isSubClassOf       fun(self: self, class: string): boolean Does not work for testing against ConsoleObject
---@field serialize          fun(self: self, formatted: boolean, someInt: integer|-1): string Converts to JSON

--- Constructor
---@return SimObject
function SimObject() end
