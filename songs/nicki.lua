package.path = package.path .. ";../?.lua"
Timecode = require("../timecode")
globals = require("../globals")
firework = require("../firework")
poly = require("../polyfills")

tc = Timecode:create();

tc:add(2, function() 
    poly.parallelAll(function()
        firework.utils.radial(
            globals.ht.lz.track.switch.x,
            globals.ht.lz.track.switch.y,
            0.2, 10, 0, true, 
            function(x,y,iterator)
            
            local launch = globals.cords(x,y,globals.ht.lz.track.switch.z)
            local direct = firework.utils.directionVector(
                globals.globals.ht.lz.track.switch, 
                launch, 
                {x=0.1,y=0.1,z=0.1}
            )
            firework.fire(
                launch.string,
                {seconds= 0.3, direction=direct},
                "{id:fireworks,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Trail:1b,Colors:[I;393198,524543],FadeColors:[I;16777215]}]}}}"
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
          return "{id:fireworks,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Trail:1b,Colors:[I;393198,524543],FadeColors:[I;16777215]}]}}}"
        end)
      end
      ),
      function() 
        firework.complexFire(globals.ht.lz.house.bottom_right, 0.1, true, function(index) 
          local direct = firework.utils.directionVector(globals.ht.lz.house.bottom_right.center, globals.ht.lz.house.bottom_right[index], {x=-0.1,y=0.1,z=-0.1})
          return {seconds=0.5, direction=direct}
        end, function(index)
          return "{id:fireworks,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Trail:1b,Colors:[I;393198,524543],FadeColors:[I;16777215]}]}}}"
        end)
      end
  end)


  tc:add(3, function() 
    firework.complexFire(globals.ht.lz.house.bottom_left, 0.1, true, function(index) 
      local direct = firework.utils.directionVector(globals.ht.lz.house.bottom_left.center, globals.ht.lz.house.bottom_left[index], {x=-0.1,y=0.1,z=-0.1})
      return {seconds=0.5, direction=direct}
    end, function(index)
      return "{id:fireworks,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Trail:1b,Colors:[I;393198,524543],FadeColors:[I;16777215]}]}}}"
    end)
  end)

  tc:add(3, function() 
    firework.complexFire(globals.ht.lz.house.bottom_right, 0.1, false, function(index) 
      local direct = firework.utils.directionVector(globals.ht.lz.house.bottom_right.center, globals.ht.lz.house.bottom_right[index], {x=-0.1,y=0.1,z=-0.1})
      return {seconds=0.5, direction=direct}
    end, function(index)
      return "{id:fireworks,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Trail:1b,Colors:[I;393198,524543],FadeColors:[I;16777215]}]}}}"
    end)
  end)

  tc:add(4, function() 
    firework.fire(globals.ht.lz.track.outgoing.string, {seconds=0.1, direction="0.0, 1.0, -0.5"}, "{id:fireworks,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Trail:1b,Colors:[I;393198,524543],FadeColors:[I;16777215]}]}}}")
    firework.fire(globals.ht.lz.track.incoming.string, {seconds=0.1, direction="0.0, 1.0, -0.5"}, "{id:fireworks,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Trail:1b,Colors:[I;393198,524543],FadeColors:[I;16777215]}]}}}")
  end)







tc:start(function()
    return os.clock()
  end)