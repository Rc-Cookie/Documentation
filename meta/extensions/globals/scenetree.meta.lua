---@meta scenetree

--- An id of an object in the scene tree, the id the object has in the world editor.
---@alias id uint

--- An id of an object in the scene tree, as a string.
---@alias id-str uint-str

--- A name of an object in the scene tree; the name the object has in the world editor. Each name is unique; no two object can have the same name and exist at the same time.
---@alias scene-name string



--- Gives access to the current scene and the objects within it.
---@class Scenetree: table
scenetree = { }

--- Finds and returns the object in the scene with the given name or id, if it exists. Alternatively you
--- can also simply use `scenetree.objectName` or `scenetree[objectName]`.
---@param objectName scene-name|id|id-str The unique name or id of the object to be found
---@return SceneObject obj The object with the given name or id, or `nil` if no object has the given name or id
function scenetree.findObject(objectName) end

--- Finds and returns the object in the scene with the specified id, if it exists.
---@param objectId id|id-str The unique id of the object to be found
---@return SceneObject obj The object with the given id, or `nil` if no object has the given id
function scenetree.findObjectById(objectId) end

--- Tests whether an object with the given name or id is present in the scene.
---@param objectId scene-name|id|id-str The name or id of the object to test for existance
---@return boolean exists Whether the object exists in the scene
function scenetree.objectExists(objectId) end

--- Tests whether an object with the given id is present in the scene.
---@param objectId id|id-str The id of the object to test for existance
---@return boolean exists Whether the object exists in the scene
function scenetree.objectExistsById(objectId) end

--- Finds and returns all object currently present in the scene which are of the given class.
--- An object gets only returned if its class is exactly the given class, if it is a subclass
--- of the specified class it will not be reported. For example, `findClassObjects('SceneObject')`
--- will, while all objects are in fact SceneObjects, return an empty array, because SceneObject
--- is abstract and all instances are instances of subclasses.
---@param className string The name of the class to find objects of
---@return (scene-name|id-str)[] objects All objects of the given class
function scenetree.findClassObjects(className) end

--- Returns a list of all objects currently in the scene.
---@return (scene-name|id-str)[] objects All objects currently in the scene
function scenetree.getAllObjects() end



--- Creates a new object in the scene.
---@param className string The type of object to be created
---@return SceneObject
function createObject(className) end
