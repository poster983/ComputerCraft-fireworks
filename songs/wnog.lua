-- Where no one goes - By Jónsi
package.path = package.path .. ";../?.lua"
Timecode = require("../timecode")
globals = require("../globals")
firework = require("../firework")

tc = Timecode:create();

--start music
tc:add(0, function() 
  globals.exec("playsound minecraft:custom.wnog record @a " .. globals.centerpoint.string .. " " .. globals.volume)
end)
tc:add(10, function()
  globals.exec("stopsound @a record")
end)

tc:add(4.3, function() 

  firework.multiFire(globals.launchzone.barges, 0, true, {seconds=1, direction="0.0, 1.0, 0.0"}, "{id:fireworks,Count:1,tag:{Fireworks:{Explosions:[{Type:1,Trail:1b,Colors:[I;393198,524543],FadeColors:[I;16777215]}]}}}")
  
end)




tc:start(function()
  return os.clock()
end)