Explosion = {loc={x=0, y=0}}

function Explosion::new(xx, yy, rr)
  local fields = {x=xx, y=yy, r=rr, t=0}
  self.__index = self
  return setmetatable(fields, self)
end

function Explosion::delta(dt)
  t += dt
  if t > 
end