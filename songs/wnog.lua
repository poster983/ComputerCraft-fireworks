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
tc:add(10, function()
  poly.exec("stopsound @a record")
end)

tc:add(4.3, function() 

  firework.multiFire(globals.launchzone.leftFrontTower, 0, true, {seconds=1, direction="0.0, 1.0, 0.0"}, "{id:fireworks,Count:1,tag:{Fireworks:{Explosions:[{Type:1,Trail:1b,Colors:[I;393198,524543],FadeColors:[I;16777215]}]}}}")
  
end)
tc:add(7.5, function() 

  firework.multiFire(globals.launchzone.leftFrontTower, 0.1, false, {seconds=1, direction="0.0, 1.0, 0.0"}, "{id:fireworks,Count:1,tag:{Fireworks:{Explosions:[{Type:1,Trail:1b,Colors:[I;393198,524543],FadeColors:[I;16777215]}]}}}")
  
end)

tc:add(5, function() 

  firework.complexFire(globals.launchzone.leftFrontTower, 0, true, function(index) 
    local direct = firework.utils.directionVector(globals.launchzone.leftFrontTower.center, globals.launchzone.leftFrontTower[index])
    return {seconds=1, direction=direct}
  end, function(index)
    return "{id:fireworks,Count:1,tag:{Fireworks:{Explosions:[{Type:1,Trail:1b,Colors:[I;393198,524543],FadeColors:[I;16777215]}]}}}"
  end)
  
end)



tc:start(function()
  return os.clock()
end)