---@meta


--- An object with an `x` and `y` number field.
---@class xy
---@field x number The x component
---@field y number The y component

--- An object with an `x`, `y` and `z` number field.
---@class xyz: xy
---@field z number The z component

--- An object with an `x`, `y`, `z` and `w` number field.
---@class xyzw: xyz
---@field w number The w component



--- A float 3d vector.
---@class vec3: xyz, xyzGenerator, cdata
---@field normalize       fun(self: self): vec3 Normalizes this vector, so that it has a length of 1 pointing in the same direction
---@field normalized      fun(self: self): vec3 Returns a normalized version of this vector, a vector with length 1 pointing in the same direction
---@field length          fun(self: self): number Returns the length of the vector. Consider using `squaredLength` for better performance.
---@field lengthGuarded   fun(self: self): number Returns the length of this vector, but never `0`, instead a very small number.
---@field squaredLength   fun(self: self): number Returns the length of this vector, squared (avoiding a square root calculation)
---@field cosAngle        fun(self: self, to: vec3): number Returns the cosin value of the angle between this and the given vector.
---@field distanceToLine  fun(self: self, a: vec3, b: vec3): number Calculates the minimum distance from this vector to the line passing though the given two points. Cosider using `squaredDistanceToLine` for better performance.
---@field squaredDistanceToLine fun(self: self, a: vec3, b: vec3): number Returns the minimum distance from this vector to the line passing though the given two points, squared, avoiding a square root calculation.
---@field distanceToLineSegment fun(self: self, a: vec3, b: vec3): number Calculates the minimum distance from this vector to the line _between_ the two given points. Consider using `squaredDistanceToLineSegment` for better performance.
---@field squaredDistanceToLineSegment fun(self: self, a: vec3, b: vec3): number Returns the minimum distance from this vector to the line _between_ the two given points, squared, avoiding a square root calculation.
---@field xnormDistanceToLineSegment fun(self: self, a: vec3, b: vec3): xnorm: number, dist: number Calculates the xnorm distance of this point on the line _between_ the two given points and the distance to the line segment. Consider using `xnormSquaredDistanceToLineSegment` for better performance.
---@field xnormSquaredDistanceToLineSegment fun(self: self, a: vec3, b: vec3): xnorm: number, sqrDist: number Returns the xnorm distance of this point on the line _between_ the two given points and the distance to the line segment, squared, avoiding a square root calculation.
---@field triangleBarycentricNorm fun(self: self, a: vec3, b: vec3, c: vec3): number
---@field projectToOriginPlane fun(self: self, planeNormal: vec3): vec3 Returns a copy of this vector projected onto a plane described by the given normal vector.
---@field xnormPlaneWithLine fun(self: self, planeNormal: vec3, a: vec3, b: vec3): number Returns the normalized distance along the given line where the line hits the plane described by the vectors `self`, `a` and `b`.
---@field xnormSphereWithLine fun(self: self, radius: number, a: vec3, b: vec3): number Returns the normalized distance along the given line where the line hits the sphere with this vector as centerpoint.
---@field basisCoordinates fun(self: self, c1: vec3, c2: vec3, c3: vec3): vec3
---@field componentMul    fun(self: self, x: vec3) Returns the component-wise product of this and the given vector.
---@field getRotationTo   fun(self: self, x: vec3): quat Returns the rotation from this to the given vector. Both vectors have to be normalized.
---@field distance        fun(self: self, to: vec3): number Calculates the distance between this and the given vector. Consider using `squaredDistance` for better performance.
---@field rotated         fun(self: self, rot: quat): vec3 Returns a vector that represents this vector rotated by given unit quaternion.
---@field toTable         fun(self: self): number[] Returns this vector as number array.
---@field toDict          fun(self: self): xyz Returns this vector as a table with entries x, y and z.
---@field squaredDistance fun(self: self, to: vec3): number Returns the distance between this and the given vector, squared (avoiding a square root calculation).
---@field set             fun(self: self, x: number|vec3|xyzGenerator, y: number?, z: number?) Sets this vector to the given values. If `x` is a number, `y` and `z` have to be specified, too
---@field setMin          fun(self: self, x: vec3) Sets this vector to the component-wise minimum of this and the given vector.
---@field setMax          fun(self: self, x: vec3) Sets this vector to the component-wise maximum of this and the given vector.
---@field setAdd          fun(self: self, x: vec3) Adds the given vector onto this vector in-place.
---@field setSub          fun(self: self, x: vec3) Subtracts the given vector from this vector in-place.
---@field setScaled       fun(self: self, scale: number) Scales this vector component-wise in-place.
---@field setAdd2         fun(self: self, a: vec3, b: vec3) Adds the given vectors and writes the result into this vector object.
---@field setSub2         fun(self: self, a: vec3, b: vec3) Subtracts the given vectors and writes the result into this vector object.
---@field setScaled2      fun(self: self, x: vec3, scale: number) Scales the given vector component-wise and writes the result into this vector object.
---@field setComponentMul fun(self: self, x: vec3) Calculates the component-wise product of this and the given vector in-place.
---@field dot             fun(self: self, x: vec3): number Calculates the dot product between this and the given vector.
---@field cross           fun(self: self, x: vec3): vec3 Calculates the cross product between this and the given vector.
---@field setCross        fun(self: self, a: vec3, b: vec3) Calculates the cross product between the given vectors and writes the result into this vector object.
---@field xnormOnLine     fun(self: self, a: vec3, b: vec3): number Returns the normed position of this vector along the line from `a` to `b`. That is, `0` if this vector is the same as `a`, `1` if it's the same as `b`, `2` if it is twice the distance from `a` to `b` in that same direction. The offset orthogonally from the line is ignored.
---@field z0              fun(self: self): vec3 Returns a vector with the same x and y components, but the z component set to 0.
---@field perpendicular   fun(self: self): vec3 Returns a vector with the same length that is perpendicular to this vector, that is, the angle between this and the new vector is 90°.
---@field perpendicularN  fun(self: self): vec3 Returns a normed with length 1 that is perpendicular to this vector.
---@field resize          fun(self: self, length: number) Scales this vector in-place so that it has the same direction, but the given length.
---@field resized         fun(self: self, length: number): vec3 Returns a new vector that has the same direction as this vector, but the given length.
---@field getBlueNoise2d  fun(): self: self Modifies itself
---@field getBlueNoise3d  fun(): self: self Modifies itself
---@field getRandomPointInSphere fun(radius: number?): self: self Sets this vector to a random point inside a sphere with the given radius or 1. The initial value of this vector is ignored.
---@field getRandomPointInCircle fun(radius: number?): self: self Sets this vector to a random point inside a circle with the given radius or 1. The initial value of this vector is ignored.
---@field getBluePointInSphere fun(self: self, something: number): vec3 Modifies itself in the process
---@field getBluePointInCircle fun(self: self, something: number): vec3 Modifies itself in the process
---@operator add(any): vec3
---@operator sub(any): vec3
---@operator mul(number): vec3
---@operator div(number): vec3
---@operator unm: vec3



--- Creates a new vec3.
---@param x number The x component
---@param y number The y component
---@param z number The z component
---@return vec3
function vec3(x,y,z) end

--- Creates a new vec3.
---@param xyz number[]|xyz|xyzGenerator Object describing x, y and z components
---@return vec3
function vec3(xyz) end

--- Creates a new vec3 with all components being `0`.
---@return vec3
function vec3() end

---@param str string
---@return vec3
function vec3:fromString(str) end

--- Returns the point on the line from `p0` to `p1` with the given normed distance from `p0`.
--- That is, `0` means the point is `p0`, `1` means the point is `p1` and `0.5` returns the
--- point is the center between `p0` and `p1`.
---@param p0 vec3 The staring point of the line
---@param p1 vec3 The end point of the line
---@param xnorm number The normed distance along the line (may also be outside of [0,1])
---@return vec3 p The point the given normed distance along the line
function linePointFromXnorm(p0, p1, xnorm) end

---@class xyzGenerator: any
---@field xyz fun(): number, number, number

---@alias Point3F vec3



--- A float quaternion. Unit quaternions can be used to represent rotations.
---@class quat: xyzw, cdata
---@field toTable      fun(self: self): number[] Returns this quaterion as an array.
---@field toDict       fun(self: self): xyzw Returns this quaterion as table.
---@field set          fun(self: self, x: number|quat, y: number?, z: number?, w: number) Sets this quaterion to the given values. If `x` is a number, `y`, `z` and `w` have to be specified, too.
---@field norm         fun(self: self): number Calculates the euclidian norm (the distance from origin) of this quaterion. Consider using `squaredNorm` for better performance.
---@field squaredNorm  fun(self: self): number Returns the euclidian norm (the distance from origin) of this quaterion, squared, avoiding a square root calculation.
---@field normalize    fun(self: self) Normalizes this quaterion, that is, scales it so its norm is `1`.
---@field normalized   fun(self: self): quat Returns a copy of this quaterion which is normalized.
---@field inversed     fun(self: self): quat Returns a copy of this quaterion which is the inverse of this quaterion, that is, multiplying the two results in the identity quaterion. The inverse of a rotation quaterion represents the reverse rotation.
---@field dot          fun(self: self, x: quat): number Returns the dot product between this and the given quaterion
---@field distance     fun(self: self, x: quat): number Returns the euclidian distance between this and the given quaterion. Both quaterions have to be normed.
---@field nlerp        fun(self: self, to: quat, t: number): quat Returns a rotation linearly lerped between this and the given rotation, by progress `t`.
---@field slerp        fun(self: self, to: quat, t: number): quat Returns a rotation _spherically_ lerped between this and the given rotation, by progress `t`. That results in a "slow in and out" lerping.
---@field conjugated   fun(self: self): quat Returns the complex conjugate of this quaterion, that is `-xyz+w`.
---@field toEulerYZZ   fun(self: self): vec3 Converts this rotation to an euler axis rotation.
---@field toTouqueQuat fun(self: self): xyzw
---@field toRotationUp fun(self: self): y: vec3, z: vec3
---@operator unm: quat
---@operator add(quat): quat
---@operator sub(quat): quat
---@operator mul(vec3): vec3
---@operator mul(number|quat): quat
---@operator div(number|quat): quat


--- Creates a new quat.
---@param x number
---@param y number
---@param z number
---@param w number
---@return quat
function quat(x,y,z,w) end

--- Creates a new quat.
---@param xyzw number[]|xyzw
---@return quat
function quat(xyzw) end

--- Creates a new identity quat representing no rotation.
---@return quat
function quat() end

--- Returns a unit quaterion representing a rotation to the given direction.
---@param dir vec3 The direction for the rotation to point to
---@param up vec3? The upwards direction, or (0,0,1) if not specified
---@return quat rotation The specified rotation
function quatFromDir(dir, up) end

--- Seems to do the same as `quatFromDir` with a different calculation.
---@param lookAt vec3
---@param up vec3? (0,0,1) by default
---@return vec3
function lookAt(lookAt, up) end

--- Returns a quaterion representing a rotation around the given axis by the specified angle.
---@param axle xyz The axle to rotate around
---@param angleRad number The angle, in radians
---@return quat
function quatFromAxisAngle(axle, angleRad) end

--- Returns a quaterion representing the given euler rotation.
---@param x number The euler rotation around the x axis
---@param y number The euler rotation around the y axis
---@param z number The euler rotation around the z axis
---@return quat
function quatFromEuler(x,y,z) end



---@class QuatF: xyzw, Object
---@field fromAngleAxis fun(self: self, angleAxis: Point4F)
---@field getInverted   fun(self: self): QuatF
---@field getMatrix     fun(self: self): MatrixF
---@field mulP          fun(self: self, p: vec3): vec3
---@field setFromEuler  fun(self: self, euler: vec3)
---@field setFromMatrix fun(self: self, mat: MatrixF)
---@field toEuler       fun(self: self): vec3
---@field toTable       fun(self: self): number[]


---@class Point2F: xy, Object
---@field toTable fun(self: self): number[]

---@param x number
---@param y number
---@return Point2F
function Point2F(x,y) end

---@param str string
---@return Point2F
function Point2F.fromString(str) end

---@class Point4F: xyzw, Object
---@field toTable fun(self: self): number[]

---@param x number
---@param y number
---@param z number
---@param w number
---@return Point4F
function Point4F(x,y,z,w) end

---@param str string
---@return Point4F
function Point4F.fromString(str) end



---@class ColorF: Object
---@field r number
---@field g number
---@field b number
---@field a number
---@field toTable fun(self: self): number[]

---@return ColorF
function ColorF(r,g,b,a) end

---@param str string
---@return ColorF
function ColorF:fromString(str) end


---@class ColorI
---@field r integer
---@field g integer
---@field b integer
---@field a integer
---@field toTable fun(self: self): number[]

---@return ColorI
function ColorI(r,g,b,a) end

---@param str string
---@return ColorI
function ColorI:fromString(str) end



--- A 3x4 matrix.
---@class MatrixF: Object
---@field createOrientFromDir fun(self: self, dir: vec3)
---@field getColumn           fun(self: self, index: integer): vec3 0-indexed
---@field getColumn4F         fun(self: self, index: integer): Point4F 0-indexed
---@field getPosition         fun(self: self): vec3
---@field inverse             fun(self: self): MatrixF
---@field mul                 fun(self: self, other: MatrixF): MatrixF
---@field mulP3F              fun(self: self, p: Point3F): Point3F
---@field mulP4F              fun(self: self, p: Point4F): Point4F
---@field mulV                fun(self: self, v: vec3): vec3
---@field normalize           fun(self: self)
---@field scale               fun(self: self, scale: number)
---@field set                 fun(self: self, maybePos: vec3, maybeEuler: vec3)
---@field setColumn           fun(self: self, column: vec3)
---@field setColumn4F         fun(self: self, column: Point4F)
---@field setFromEuler        fun(self: self, euler: vec3)
---@field setFromQuatF        fun(self: self, rot: QuatF)
---@field setPosition         fun(self: self, pos: vec3)
---@field toEuler             fun(self: self): vec3
---@field toQuatF             fun(self: self): QuatF
---@field transformP3F        fun(self: self, p: Point3F): Point3F Same as mulP3F

--- Creates a new unit matrix.
---@return MatrixF
function MatrixF() end

--- Creates a new unit matrix.
---@param clear boolean Whether the matrix should be set to a unit matrix (or not, increases speed if it will be overridden anyways)
---@return MatrixF
function MatrixF(clear) end



--- An axis-aligned bounding box.
---@class Box3F: Object
---@field minExtents vec3 Lower corner of box
---@field maxExtents vec3 Upper corner of box
---@field extend     fun(self: self, p: vec3) Includes the given point
---@field getCenter  fun(self: self): vec3
---@field getExtents fun(self: self): vec3 Size of box
---@field getLength  fun(self: self): number Length of box diagonal
---@field isOverlapped fun(self: self, box: Box3F): boolean Any overlapping
---@field len_max      fun(self: self): number maximum length in one dimension
---@field scale        fun(self: self, scale: number)
---@field scale3F      fun(self: self, scale: vec3)
---@field setCenter    fun(self: self, center: vec3) Size retained
---@field setExtents   fun(self: self, extents: vec3) Sets the size, center is set to (0,0,0)

--- Creates a new Box3F.
---@return Box3F
function Box3F() end
