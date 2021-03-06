globals = require("./globals")
poly = require("./polyfills")
local firework = {}

-- {seconds: Int, direction: "x, y, z"}
firework.fire = function(cordString, opts, fireworksItem)
  local config = ""
  if opts.seconds then
    local ticks = opts.seconds*20
    config = "LifeTime:".. ticks..","
  end

  if opts.direction then 
    config = config .. "Motion:[" .. opts.direction .. "],"
  end
  
  --commands.execAsync
  poly.exec("summon fireworks_rocket " .. cordString .. " {" .. config .. "FireworksItem:" .. fireworksItem .."}") 
  
end

 -- fireworksItemCallback(index)
 -- optsCallback(index)
firework.complexFire = function(coordArray, delay, forward, optsCallback, fireworksItemCallback) 
  --print(table.getn(coordArray))
  for x,v in ipairs(coordArray) do
    local y = x

    if not forward then
      
      y = (table.getn(coordArray)) - (x-1)
    end
    
    firework.fire(coordArray[y].string, optsCallback(y), fireworksItemCallback(y))
    if delay ~= 0 then
      poly.sleep(delay)
    end
  end
  --[[
  local x=0
  while(coordArray.length > x) do 
    local y = x;
    if not forward then
      y = (coordArray.length-1) - x
    end

    firework.fire(coordArray[y].string, optsCallback(y), fireworksItemCallback(y))
    if delay ~= 0 then
      poly.sleep(delay)
    end

    x = x + 1
  end]]
end


--Helper for complex fire
firework.multiFire = function(coordArray, delay, forward, opts, fireworksItem) 
  firework.complexFire(coordArray, delay, forward, function(index)
    return opts
  end, function(index)
    return fireworksItem
  end)
end



firework.volumetric = {}

--locationCallback(x,y,index)
firework.volumetric.z = function(baseCords, x,y,z, count, delay, locationCallback, optsCallback, fireworksItemCallback)
--TODO

end


firework.utils = {}
-- Will return a direction string for opts
-- centerpoint is a table of coords (x y z) which is the centerpoint 
firework.utils.directionVector = function(centerpoint, launchZone, multipliers)
    if not multipliers then 
      multipliers = {}
    end
    if not multipliers.x then 
      multipliers.x = 1
    end
    if not multipliers.y then 
      multipliers.y = 1
    end
    if not multipliers.z then 
      multipliers.z = 1
    end
    local xv = (centerpoint.x - launchZone.x) * multipliers.x
    local yv = (centerpoint.y - launchZone.y) * multipliers.y
    local zv = (centerpoint.z - launchZone.z) * multipliers.z
    return string.format("%.2f", xv) .. ", " .. string.format("%.2f", yv) .. ", " .. string.format("%.2f", zv);

end


--Will Use a and b are the starting 2d cords
--firecallback(a,b,iteration) 
firework.utils.radial = function(a,b, radius, count, delay, forward, fireCallback)
  local step = 360/count
  local i = 0
  while i < 360 do 
    local angle = i * math.pi / 180
    local pta = a + radius * math.cos( angle )
    local ptb = b + radius * math.sin( angle )

    fireCallback(pta, ptb, i)

    if delay ~= 0 then
      poly.sleep(delay)
    end

    i = i+step
  end

end 

return firework;