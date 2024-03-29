function collisionUpdate()
  updateObject(player, {x = 0, y = player.vel.y})
  for i = #enemies, 1 , -1 do
    thisEnemy = enemies[i]
    updateObject(thisEnemy, thisEnemy.vel)
    if objCollision(player,thisEnemy) then
      playerHurt()
      hurtTime = 0.25
      love.graphics.setColor(255, 0, 0)
  
    end
  end  
end

function objCollision(obj1, obj2)
  return AABB(obj1.x,obj1.y,obj1.width,obj1.height, obj2.x, obj2.y, obj2.width, obj2.height)
end

function canAddObject(obj)
  if obj.x + obj.width >= love.graphics.getWidth()  or obj.x < 1 or obj.y < 1 or obj.y + obj.height >= love.graphics.getHeight() then
    return false
  end

  if updateObject(obj, {x = 1, y = 1}).vel.x == -1 or updateObject(obj, {x = 1, y = 1}).vel.y == -1 then
    return false
  else
    return true
  end
end

function updateObject(obj,newVel)
  if obj.x <= 0 and obj.vel.x < 0 then
    obj.vel.x = -newVel.x
    obj.x = 0
  elseif obj.x + obj.width > love.graphics.getWidth() and obj.vel.x > 0 then
    obj.vel.x = -newVel.x
    obj.x = love.graphics.getWidth() - obj.width
  end
  
  if obj.y <= 0 and obj.vel.y < 0 then
    obj.vel.y = -newVel.y
    obj.y = 0
  elseif obj.y + obj.height > love.graphics.getHeight() and obj.vel.y > 0 then
    obj.vel.y = -newVel.y
    obj.y = love.graphics.getHeight() - obj.height
  end


  for i = 0, obj.width, 16 do
    if not pass(math.floor((obj.x + i)/16)+1,math.floor(obj.y/16)+1) and obj.vel.y < 0 then
      obj.vel.y = -newVel.y
      obj.y = math.floor(obj.y/16)*16+1
    end
    if not pass(math.floor((obj.x + i)/16)+1,math.floor((obj.y+obj.height)/16)-1) and obj.vel.y > 0 then
      obj.vel.y = -newVel.y
      obj.y = math.floor(obj.y/16)*16
    end
  end
 
  for i = 0, obj.height, 16 do
    if not pass(math.ceil(obj.x/16),math.ceil((obj.y + i)/16)) and obj.vel.x < 0 then
      obj.vel.x = -newVel.x
      obj.x = math.floor(obj.x/16)*16+1
    end
    if not pass(math.floor((obj.x+obj.height)/16)+1,math.floor((obj.y + i)/16)+1) and obj.vel.x > 0 then
      obj.vel.x = -newVel.x
      obj.x = math.floor(obj.x/16)*16
    end
  end

  return obj 
end
