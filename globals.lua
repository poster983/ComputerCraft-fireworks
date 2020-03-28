local globals = {}

globals.exec = function(command) 
  commands.execAsync(command)
  print(command)
end

-- returns a coord string for commands
globals.getCoords = function(coordTable)
  return coordTable.x .. " " .. coordTable.y .. " " .. coordTable.z;
end 

--[[globals.fire = function(coords, firework) 
    --commands.execAsync
    globals.exec("summon fireworks_rocket " .. coords .. " " .. firework)
end]]

-- volume of music 
globals.volume = 6

-- Used for music and particle effects
globals.centerpoint = {}
globals.centerpoint.x = 0
globals.centerpoint.y = 1
globals.centerpoint.z = 2
globals.centerpoint.string = globals.getCoords(globals.centerpoint)


globals.launchzone = {}
--Lake barges.  meant to go in a circle
globals.launchzone.barges = {}

globals.launchzone.barges[0] = {}
globals.launchzone.barges[0].x = 10
globals.launchzone.barges[0].y = 20
globals.launchzone.barges[0].z = 30
globals.launchzone.barges[0].string = globals.getCoords(globals.launchzone.barges[0])

return globals;