---@meta

---@alias parking-type
---| 0 # Public parking
---| 1 # Garage parking
---| 2 # Dealer parking
---| 3 # Dealer display drivable
---| 4 # Dealer display undrivable
---| 5 # Dealer delivery

--- A parking spot trigger. Does not actually inherit from BeamNGTrigger, but has the exact same fields and more.
---@class BeamNGParking: BeamNGTrigger
---@field parkingType parking-type

--- Constructor
---@return BeamNGParking
function BeamNGParking() end
