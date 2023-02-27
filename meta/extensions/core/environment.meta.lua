---@meta core_environment

--- Access to environment controls.
---@class Core.Environment
---@field groundModels table<string, Environment.GroundModel>
---@field loadedGroundModelFiles file-path[]
core_environment = { }

--- Cycles though different time of day presets; noon, evening and midnight.
function core_environment.cycleTimeOfDay() end

function core_environment.dumpGroundModels() end

---@return file-path file
function core_environment.getAmbientScaleGradientFile() end

---@return number cloudCover Fraction of sky covered by clouds
function core_environment.getCloudCover() end

---@param cloudObj id The `CloudLayer` object to get the cloud cover for
---@return number? cloudCover Fraction of sky covered by clouds
function core_environment.getCloudCoverByID(cloudObj) end

---@param cloudObj id The `CloudLayer` object to get the cloud exposure for
---@return number? exposure Brightness scale
function core_environment.getCloudExposureByID(cloudObj) end

---@param cloudObj id The `CloudLayer` object to get the cloud cover for
---@return number? height Abstract number controling height and curvature of the dome mesh. For comparison, WCUSA has a value of 4.
function core_environment.getCloudHeightByID(cloudObj) end

---@param cloudObj id The `CloudLayer` object to get the cloud cover for
---@return number? speed Speed factor for cloud movement.
function core_environment.getCloudWindByID(cloudObj) end

---@return file-path file
function core_environment.getColorizeGradientFile() end

---@return number height
function core_environment.getFogAtmosphereHeight() end

---@return number density
function core_environment.getFogDensity() end

---@return number offset
function core_environment.getFogDensityOffset() end

---@return file-path file
function core_environment.getFogScaleGradientFile() end

---@return number gravity In m/s², remember that the acceleration is downwards, so negative if objects fall to the ground
function core_environment.getGravity() end

---@return file-path file
function core_environment.getNightFogGradientFile() end

---@return file-path file
function core_environment.getNightGradientFile() end

---@return unknown?
function core_environment.getPrecipitation() end

---@return number shadowDistance
function core_environment.getShadowDistance() end

---@return number weight
function core_environment.getShadowLogWeight() end

---@return number softness
function core_environment.getShadowSoftness() end

---@return number brightness
function core_environment.getSkyBrightness() end

---@return Environment.State state
function core_environment.getState() end

---@return file-path file
function core_environment.getSunScaleGradientFile() end

---@return number temperature
function core_environment.getTemperatureK() end

---@return Environment.TimeOfDay timeOfDay
function core_environment.getTimeOfDay() end

---@return number speed (Also just of clouds)
function core_environment.getWindSpeed() end

function core_environment.onClientEndMission() end

function core_environment.onClientPostStartMission() end

function core_environment.onClientPreStartMission() end

function core_environment.onEditorEnabled() end

function core_environment.onFilesChanged() end

function core_environment.onInit() end

function core_environment.onUpdate(dt, modDt, rawDt) end

function core_environment.reloadGroundModels() end

function core_environment.requestState() end

function core_environment.reset() end

function core_environment.reset_init() end


---@param file file-path
function core_environment.setAmbientScaleGradientFile(file) end

---@param cloudCover number
function core_environment.setCloudCover(cloudCover) end

---@param cloudObj id The `CloudLayer` object to get the cloud cover for
---@param cloudCover number
function core_environment.setCloudCoverByID(cloudObj, cloudCover) end

---@param cloudObj id The `CloudLayer` object to get the cloud cover for
---@param exposure number
function core_environment.setCloudExposureByID(cloudObj, exposure) end

---@param cloudObj id The `CloudLayer` object to get the cloud cover for
---@param height number Abstract number, no unit
function core_environment.setCloudHeightByID(cloudObj, height) end

---@param cloudObj id The `CloudLayer` object to get the cloud cover for
---@param speed number
function core_environment.setCloudWindByID(cloudObj, speed) end

---@param file file-path
function core_environment.setColorizeGradientFileById(file) end

---@param height number
function core_environment.setFogAtmosphereHeight(height) end

---@param density number
function core_environment.setFogDensity(density) end

---@param offset number
function core_environment.setFogDensityOffset(offset) end

---@param file file-path
function core_environment.setFogScaleGradientFile(file) end

---@param gravity number Acceleration in m/s², remember that downwards acceleration is negative
function core_environment.setGravity(gravity) end

---@param file file-path
function core_environment.setNightFogGradientFile(file) end

---@param file file-path
function core_environment.setNightGradientFile(file) end

function core_environment.setPrecipitation(...) end

---@param distance number This adjusts the shadow render distance, but not the resolution, thus the quality gets worse with greater distance
function core_environment.setShadowDistance(distance) end

---@param weight number Somehow shifts the shadow cascades; 0 means infinityly large steps, 1 means infinitely short steps
function core_environment.setShadowLogWeight(weight) end

---@param softness number 1 means extremely blury shadows, 0 means pixel-sharp shadows
function core_environment.setShadowSoftness(softness) end

---@param brightness number
function core_environment.setSkyBrightness(brightness) end

---@param state Environment.State
function core_environment.setState(state) end

---@param file file-path
function core_environment.setSunScaleGradientFile(file) end

---@param timeOfDay Environment.TimeOfDay
function core_environment.setTimeOfDay(timeOfDay) end

---@param speed number Cloud speed factor
function core_environment.setWindSpeed(speed) end



---@class Environment.GroundModel
---@field cdata   userdata
---@field isAlias boolean
---@field parent  string|'none'

---@class Environment.State
---@field cloudCover   number
---@field dayScale     number
---@field gravity      number
---@field nightScale   number
---@field startTime    number
---@field temperatureC number
---@field time         number
---@field windSpeed    number

---@class Environment.TimeOfDay
---@field azimuthOverride number
---@field dayLength       number Length of a whole day-night-cycle, if unscaled
---@field dayScale        number Time scale at daytime (only if playing) for `dayLength`
---@field nightScale      number Time scale at night (only if playing) for `dayLength`
---@field startTime       number Initial time when level gets loaded
---@field time            number Time of day from 0 to 1, 0 and 1 being noon
---@field play            boolean? Does time change over time?
