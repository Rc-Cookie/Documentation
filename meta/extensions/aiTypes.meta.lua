--- Different behaviors for the AI
---@alias ai-mode
---| "'disabled'" # AI is off
---| "'traffic'" # AI drives around randomly and follows traffic laws
---| "'random'" # AI drives around randomly
---| "'span'" # AI drives around randomly but avoids driving the same road twice
---| "'manual'" # AI drives along manually set waypoints
---| "'chase'" # AI chases a specific target vehicle
---| "'follow'" # AI follows a specific target vehicle without touching it
---| "'flee'" # AI drives away from a specific target vehicle
---| "'stop'" # AI brakes safely, the switches the mode to `"disabled"`
---| "'script'" # Either records or follows a recorded script AI path

--- Different modes how the AI treats the `speed` setting
---@alias ai-speed-mode
---| "'set'" # AI drives with the set speed. It will not brake for corners, but may coast.
---| "'limit'" # AI drives not faster than the given speed, but may slow down due to road conditions / curves.
---| "'legal'" # AI follows road speed limits, the `routeSpeed` setting is ignored.
---| "'off'" # Like infinitely large limit.
---| "nil" # Like infinitely large limit.

---@alias ai-drive-style 'default'|'offroad'

--- Configures when to reset the vehicle when following a script ai path one or more times.
---@alias script-ai-loop-type
---| "'alwaysReset'" # Reset on every iteration
---| "'startReset'" # Reset only when starting the first iteration
---| "'dontReset'" # Never reset. This is not an official value, any value except the two others would have this effect.
