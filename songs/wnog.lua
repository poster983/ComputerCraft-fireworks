-- Where no one goes - By Jónsi
package.path = package.path .. ";../?.lua"
Timecode = require("../timecode")
globals = require("../globals")
firework = require("../firework")

tc = Timecode:create();

--start music
tc:add(0, function() 
  globals.exec("playsound minecraft:custom.wnog music @a " .. globals.centerpoint.string " " .. globals.volume)
end)

tc:add(4, function() 
  firework.fire(globals.launchzone.barges[0].string, {seconds=2, direction="0.0, 1.0, 0.0"}, "{id:fireworks,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Flicker:1b,Trail:1b,Colors:[I;9437164]},{Type:0}]}}}}")
end)


tc:start(function()
  return os.clock()
end)