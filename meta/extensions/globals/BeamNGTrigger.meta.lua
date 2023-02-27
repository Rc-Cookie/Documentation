---@meta

--- A trigger object.
---@class BeamNGTrigger: GameBase
---@field triggerType 0|1 Sphere | Box
---@field triggerMode 0|1|2 Center | Contains | Overlaps
---@field triggerTestType 0|1 Race corners | Bounding box
---@field luaFunction string
---@field tickPeriod number
---@field debug boolean
---@field debugInEditor boolean?
---@field ticking boolean
---@field triggerColor ColorI Editor only
---@field cameraOnEnter scene-name Camera to switch to on enter
---@field defaultOnLeave boolean? Back to default camera when exiting?
---@field stopName string? Optional, for bus stops
---@field type 'busstop'|string? Optional, e.g. for bus stops

--- Constructor
---@return BeamNGTrigger
function BeamNGTrigger() end
