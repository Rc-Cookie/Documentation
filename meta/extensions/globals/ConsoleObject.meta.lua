---@meta ConsoleObject

--- The base class of all Torque3D objects.
---@class ConsoleObject: Object
---@field getFieldInfo       fun(field: string): FieldInfo
---@field getFieldList       fun(): LightFieldInfo[]
---@field getFields          fun(): LightFieldInfo[]
---@field getFieldsForEditor fun(): FieldInfo[]

--- Some info about a field of an type adjustable from the editor.
---@class LightFieldInfo
---@field doc string? Type documentation
---@field id uint
---@field type string

--- Information about a field of a type adjustable from the editor.
---@class FieldInfo: LightFieldInfo
---@field elementCount uint
---@field fieldDocs string
---@field groupName string Corresponds to inspector folding regions
---@field hideInInspector boolean
---@field isDataBlock boolean
---@field name string Name of the field this field info is about
---@field typeName string Extended type name
