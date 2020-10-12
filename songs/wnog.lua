-- Where no one goes - By Jónsi
package.path = package.path .. ";../?.lua"
Timecode = require("../timecode")
globals = require("../globals")
firework = require("../firework")
poly = require("../polyfills")

tc = Timecode:create();

--start music
tc:add(0, function() 
  poly.exec("playsound minecraft:custom.wnog record @a " .. globals.centerpoint.string .. " " .. globals.volume)
end)
tc:add(20, function()
  poly.exec("stopsound @a record")
end)

tc:add(4.3, function() 

  firework.multiFire(globals.launchzone.leftFrontTower, 0, true, {seconds=1, direction="0.0, 1.0, 0.0"}, "{id:fireworks,Count:1,tag:{Fireworks:{Explosions:[{Type:1,Trail:1b,Colors:[I;393198,524543],FadeColors:[I;16777215]}]}}}")
  
end)
tc:add(7.5, function() 

  firework.multiFire(globals.launchzone.leftFrontTower, 0.1, false, {seconds=1, direction="0.0, 1.0, 0.0"}, "{id:fireworks,Count:1,tag:{Fireworks:{Explosions:[{Type:1,Trail:1b,Colors:[I;393198,524543],FadeColors:[I;16777215]}]}}}")
  
end)

tc:add(5, function() 
  poly.parallelAll(function()
    firework.complexFire(globals.launchzone.leftFrontTower, 0, true, function(index) 
    local direct = firework.utils.directionVector(globals.launchzone.leftFrontTower.center, globals.launchzone.leftFrontTower[index], {x=-0.1,y=0.1,z=-0.1})
    return {seconds=0.5, direction=direct}
  end, function(index)
    return "{id:fireworks,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Trail:1b,Colors:[I;393198,524543],FadeColors:[I;16777215]}]}}}"
  end)
  end
  ,
  function()
  firework.complexFire(globals.launchzone.leftBackTower, 0, true, function(index) 
    local direct = firework.utils.directionVector(globals.launchzone.leftBackTower.center, globals.launchzone.leftBackTower[index], {x=-0.1,y=0.1,z=-0.1})
    return {seconds=0.5, direction=direct}
  end, function(index)
    return "{id:fireworks,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Trail:1b,Colors:[I;393198,524543],FadeColors:[I;16777215]}]}}}"
  end)
  end
  )
end)

tc:add(5.5, function() 
  firework.multiFire(globals.shuffle(globals.launchzone.wallTop), 0.1, true, {seconds=0.5, direction="0.0, 1.0, 0.0"}, "{id:fireworks,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Trail:1b,Colors:[I;393198,524543],FadeColors:[I;16777215]}]}}}")


end)

tc:add(11, function() 

  firework.multiFire(globals.select(globals.launchzone.leftBackTower, 2,3,4,5,6), 0.1, false, {seconds=0.3, direction="0.0, 0.5, -0.5"}, "{id:fireworks,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Trail:1b,Colors:[I;393198,524543],FadeColors:[I;16777215]}]}}}")
  
end)

tc:add(13, function() 
  firework.complexFire(globals.launchzone.wallTop, 0, true, function(index) 
    local direct = firework.utils.directionVector(globals.launchzone.wallTop.center, globals.launchzone.wallTop[index], {x=0.1,y=0.1,z=0.1})
    return {seconds=0.5, direction=direct}
  end, function(index)
    return "{id:fireworks,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Trail:1b,Colors:[I;393198,524543],FadeColors:[I;16777215]}]}}}"
  end)
end)

tc:add(14, function() 
  firework.complexFire(globals.launchzone.wallTop, 0.1, true, function(index) 
    local direct = firework.utils.directionVector(globals.launchzone.wallTop.center, globals.launchzone.wallTop[index], {x=0.1,y=0.1,z=0.1})
    return {seconds=0.5, direction=direct}
  end, function(index)
    return "{id:fireworks,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Trail:1b,Colors:[I;393198,524543],FadeColors:[I;16777215]}]}}}"
  end)
end)

tc:add(16, function() 
  firework.complexFire(globals.launchzone.wallTop, 0.1, false, function(index) 
    local direct = firework.utils.directionVector(globals.launchzone.wallTop.center, globals.launchzone.wallTop[index], {x=0.1,y=0.1,z=0.1})
    return {seconds=0.5, direction=direct}
  end, function(index)
    return "{id:fireworks,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Trail:1b,Colors:[I;393198,524543],FadeColors:[I;16777215]}]}}}"
  end)
end)


tc:start(function()
  return os.clock()
end)