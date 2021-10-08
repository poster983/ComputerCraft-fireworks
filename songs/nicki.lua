package.path = package.path .. ";../?.lua"
Timecode = require("../timecode")
globals = require("../globals")
firework = require("../firework")
poly = require("../polyfills")

-- firework strings
local blue_mine = "{id:fireworks,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Trail:1b,Colors:[I;393198,524543],FadeColors:[I;16777215]}]}}}"
local red_mine = "{id:fireworks,Count:1,tag:{Fireworks:{Flight:2,Explosions:[{Type:4,Flicker:1,Trail:1,Colors:[I;11743532,8073150],FadeColors:[I;15435844]}]}}}"
local creeper = "{id:fireworks,Count:1,tag:{Fireworks:{Flight:2,Explosions:[{Type:3,Flicker:1,Trail:1,Colors:[I;1973019,3887386,4312372],FadeColors:[I;11743532,11250603]}]}}}"


tc = Timecode:create();

tc:add(0, function() 
  poly.exec("playsound minecraft:firework.nicki record @a " .. globals.ht.centerpoint.string .. " 7")
end)

tc:add(2, function() 
    poly.parallelAll(
      function()
        firework.utils.radial(
            globals.ht.lz.track.switch.x,
            globals.ht.lz.track.switch.y,
            0.2, 10, 0, true, 
            function(x,y,iterator)
            
              local launch = globals.cords(x,y,globals.ht.lz.track.switch.z)
              local direct = firework.utils.directionVector(
                  globals.ht.lz.track.switch, 
                  launch, 
                  {x=0.3,y=0.3,z=0.3}
              )
              firework.fire(
                  launch.string,
                  {seconds= 0.3, direction=direct},
                  blue_mine
                  )
            end
        )
      end
      ,
      function() 
        firework.complexFire(globals.ht.lz.house.bottom_left, 0.1, false, function(index) 
          local direct = firework.utils.directionVector(globals.ht.lz.house.bottom_left.center, globals.ht.lz.house.bottom_left[index], {x=-0.1,y=0.1,z=-0.1})
          return {seconds=0.5, direction=direct}
        end, function(index)
          return blue_mine
        end)
      end
      ,
      function() 
        firework.complexFire(globals.ht.lz.house.bottom_right, 0.1, true, function(index) 
          local direct = firework.utils.directionVector(globals.ht.lz.house.bottom_right.center, globals.ht.lz.house.bottom_right[index], {x=-0.1,y=0.1,z=-0.1})
          return {seconds=0.5, direction=direct}
        end, function(index)
          return blue_mine
        end)
      end
  )
end)

  tc:add(3, function() 
    poly.parallelAll(
      function()
        firework.complexFire(globals.ht.lz.house.bottom_left, 0.1, true, function(index) 
          local direct = firework.utils.directionVector(globals.ht.lz.house.bottom_left.center, globals.ht.lz.house.bottom_left[index], {x=-0.1,y=0.1,z=-0.1})
          return {seconds=0.5, direction=direct}
        end, function(index)
          return red_mine
        end)
      end -- block
      ,
      function()
        firework.complexFire(globals.ht.lz.house.bottom_right, 0.1, false, function(index) 
          local direct = firework.utils.directionVector(globals.ht.lz.house.bottom_right.center, globals.ht.lz.house.bottom_right[index], {x=-0.1,y=0.1,z=-0.1})
          return {seconds=0.5, direction=direct}
        end, function(index)
          return red_mine
        end)
      end -- block
    )
  end)

 

  tc:add(7, function() 
    firework.fire(globals.ht.lz.track.outgoing.string, {seconds=0.1, direction="0.0, 1.0, -0.5"}, red_mine)
    firework.fire(globals.ht.lz.track.incoming.string, {seconds=0.1, direction="0.0, 1.0, -0.5"}, red_mine)
  end)


  tc:add(8, function() 
    poly.parallelAll(
      function()
        firework.complexFire(globals.ht.lz.house.bottom_left, 0, true, function(index) 
          local direct = firework.utils.directionVector(globals.ht.lz.house.bottom_left.center, globals.ht.lz.house.bottom_left[index], {x=-0.4,y=0.1,z=-0.4})
          return {seconds=0.5, direction=direct}
        end, function(index)
          return red_mine
        end)
      end -- block
      ,
      function()
        firework.complexFire(globals.ht.lz.house.bottom_right, 0, false, function(index) 
          local direct = firework.utils.directionVector(globals.ht.lz.house.bottom_right.center, globals.ht.lz.house.bottom_right[index], {x=-0.4,y=0.1,z=-0.4})
          return {seconds=0.5, direction=direct}
        end, function(index)
          return blue_mine
        end)
      end -- block
      ,
      function()
        firework.multiFire(globals.ht.lz.house.bottom_right, 0, true, {seconds=1, direction="0.0, 1.0, 0.0"},creeper)
      end -- block
      ,
      function()
        firework.multiFire(globals.ht.lz.house.bottom_left, 0, true, {seconds=1, direction="0.0, 1.0, 0.0"},creeper)
      end -- block
    )
  end)






tc:start(function()
    return os.clock()
  end)