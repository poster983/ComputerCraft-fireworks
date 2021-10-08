package.path = package.path .. ";../?.lua"
Timecode = require("../timecode")
globals = require("../globals")
firework = require("../firework")
poly = require("../polyfills")

local export = {}

-- firework strings
local blue_mine = "{id:fireworks,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Trail:1b,Colors:[I;393198,524543],FadeColors:[I;16777215]}]}}}"
local red_mine = "{id:fireworks,Count:1,tag:{Fireworks:{Flight:2,Explosions:[{Type:4,Flicker:1,Trail:1,Colors:[I;11743532,8073150],FadeColors:[I;15435844]}]}}}"
local creeper = "{id:fireworks,Count:1,tag:{Fireworks:{Flight:2,Explosions:[{Type:3,Flicker:1,Trail:1,Colors:[I;1973019,3887386,4312372],FadeColors:[I;11743532,11250603]}]}}}"

globals.ht = {}

-- Used for music and particle effects
globals.ht.centerpoint = cords(-613,100,659)
-- launch Locations
globals.ht.lz = {}

--Launch Track
globals.ht.lz.track = {}

globals.ht.lz.track.outgoing = cords(-590, 71,672)
globals.ht.lz.track.incoming = cords(-594, 71,672)

globals.ht.lz.track.switch = cords(-592, 72,685)

globals.ht.lz.track.target = cords(-590, 99, 644)

-- House:
globals.ht.lz.house = {}

--bottom left 
globals.ht.lz.house.bottom_left = {}
globals.ht.lz.house.bottom_left.center = cords(-646,90,661)

globals.ht.lz.house.bottom_left[1] = cords(-640,90,661)
globals.ht.lz.house.bottom_left[2] = cords(-641,90,663)
globals.ht.lz.house.bottom_left[3] = cords(-642,90,665)
globals.ht.lz.house.bottom_left[4] = cords(-644,90,666)
globals.ht.lz.house.bottom_left[5] = cords(-646,90,667)
globals.ht.lz.house.bottom_left[6] = cords(-648,90,666)
globals.ht.lz.house.bottom_left[7] = cords(-650,90,665)
globals.ht.lz.house.bottom_left[8] = cords(-651,90,663)
globals.ht.lz.house.bottom_left[9] = cords(-652,90,661)

--bottom right
globals.ht.lz.house.bottom_right = {}
globals.ht.lz.house.bottom_right.center = cords(-632,91,645)

globals.ht.lz.house.bottom_right[1] = cords(-630,90,639)
globals.ht.lz.house.bottom_right[2] = cords(-628,90,641)
globals.ht.lz.house.bottom_right[3] = cords(-628,90,643)
globals.ht.lz.house.bottom_right[4] = cords(-627,90,645)
globals.ht.lz.house.bottom_right[5] = cords(-628,90,647)
globals.ht.lz.house.bottom_right[6] = cords(-628,90,649)
globals.ht.lz.house.bottom_right[7] = cords(-630,90,651)
globals.ht.lz.house.bottom_right[8] = cords(-632,90,652)

tc = Timecode:create();

tc:add(0, function() 
  poly.exec("playsound minecraft:firework.nicki record @a " .. globals.ht.centerpoint.string .. " 7")
end)

tc:add(2, function() 
    poly.parallelAll(
      function()
        firework.utils.radial(
            globals.ht.lz.track.switch.x,
            globals.ht.lz.track.switch.y+3,
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
          return {seconds=0.2, direction=direct}
        end, function(index)
          return red_mine
        end)
      end -- block
      ,
      function()
        firework.complexFire(globals.ht.lz.house.bottom_right, 0, false, function(index) 
          local direct = firework.utils.directionVector(globals.ht.lz.house.bottom_right.center, globals.ht.lz.house.bottom_right[index], {x=-0.4,y=0.1,z=-0.4})
          return {seconds=0.2, direction=direct}
        end, function(index)
          return blue_mine
        end)
      end -- block
      ,
      function()
        firework.multiFire(globals.ht.lz.house.bottom_right, 0, true, {seconds=0.4, direction="0.0, 1.0, 0.0"},creeper)
      end -- block
      ,
      function()
        firework.multiFire(globals.ht.lz.house.bottom_left, 0, true, {seconds=0.4, direction="0.0, 1.0, 0.0"},creeper)
      end -- block
    )
  end)



  tc:add(9, function() 

    firework.utils.radial(
      globals.ht.lz.track.target.x,
      globals.ht.lz.track.target.y,
      1, 10, 0.1, true, 
      function(x,y,iterator)
      
        local launch = globals.cords(x,y,globals.ht.lz.track.target.z)
        local direct = firework.utils.directionVector(
          globals.ht.lz.track.target, 
            launch, 
            {x=-5,y=-8,z=-5}
        )
        firework.fire(
            launch.string,
            {seconds= 0.3, direction=direct},
            blue_mine
            )
      end)

  
  end)

export.start = function() 
  tc:start(function()
    return os.clock()
  end)
 end

return export