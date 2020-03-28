globals = require("./globals")
local firework = {}

-- {seconds: Int, direction: "x, y, z"}
firework.fire = function(coords, opts, fireworksItem)
  config = ""
  if opts.seconds then
    local ticks = opts.seconds*20
    config = "LifeTime:".. ticks..","
  end

  if opts.direction then 
    config = config .. "Motion:[" .. opts.direction .. "],"
  end

  --commands.execAsync
  globals.exec("summon fireworks_rocket " .. coords .. " {" .. config .. "FireworksItem:" .. fireworksItem) 
end



return firework;