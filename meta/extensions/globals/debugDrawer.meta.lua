---@meta

---@class DebugDrawer: SimObject
debugDrawer = { }


function debugDrawer:clearTargetRenderView() end
function debugDrawer:drawAxisGizmo() end
function debugDrawer:drawBox(min, max, color) end
function debugDrawer:drawCircle(pos, radOrOther, radOrOther2, color) end
function debugDrawer:drawCylinder(pos, height, radius, color) end
function debugDrawer:drawDot(pos, maybeSize, color) end
function debugDrawer:drawLine(a, b, color) end
function debugDrawer:drawLineInstance(a, b, maybeWidth, color) end
function debugDrawer:drawQuadSolid(a, b, c, d, color) end
function debugDrawer:drawSphere(pos, radius, color) end
function debugDrawer:drawSquarePrism() end
function debugDrawer:drawText(pos, text, color) end
function debugDrawer:drawTextAdvanced(pos, text, textColor, someFlag, someOtherFlag, maybeBackgroundI) end
function debugDrawer:drawTri(a, b, c, color) end
function debugDrawer:drawTriSolid(a, b, c, color) end
function debugDrawer:renderGroundModelDebug(debugtype, gmName, col, distance, tileSize, focusPos, depthScale) end
function debugDrawer:renderStaticColDebug(debugtype, gmName, col, distance, tileSize, focusPos, depthScale) end
function debugDrawer:setSolidTriCulling() end
function debugDrawer:setTargetRenderView(renderViewName) end
function debugDrawer:toggleDrawing() end
function debugDrawer:toggleFreeze() end
