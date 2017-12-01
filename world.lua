worldTextures = {[0] = love.graphics.newImage("assets/img/environment/nada.png"); [1] = love.graphics.newImage("assets/img/environment/sand.png"); [2] = love.graphics.newImage("assets/img/environment/stone.png")}

world = {}

for i=1,64 do
  world[i] = {}
  for j=1,120 do
    world[i][j] = math.random(0,2)
  end
end

function drawWorld()
  for y=1,64 do
    for x=1,120 do
      love.graphics.draw(worldTextures[world[y][x]], (x-1)*16, (y-1)*16)
    end
  end
end