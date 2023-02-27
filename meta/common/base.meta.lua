---@meta

--- An unsigned integer (aka a natural number).
---@alias uint integer

--- A string which contains the string representation of a number.
---@alias number-str string

--- A string which contains the string representation of an integer.
---@alias integer-str number-str

--- A string which contains the string representation of an unsigned integer.
---@alias uint-str integer-str

--- A UNIX timestamp, the seconds elapsed since the first of January, 1970.
---@alias timestamp uint

---@class cdata: ffi.cdata*

---@class Object: userdata
---@field ___type string The type of the object, formatted as `"class<clsName>"` where `clsName` gets replaced with the actual name, i.e. `"class<ConsoleObject>"`.



--- Creates a new table, optimized for a given enstiated size.
---@param arrCapacity uint The initial internal capacity for array items. Will be increased later as needed.
---@param mapCapacity uint The initial internal capacity for key-value pairs. Will be increased later as needed.
function table.new(arrCapacity, mapCapacity) end
