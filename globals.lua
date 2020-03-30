local globals = {}

globals.exec = function(command) 
  print(command)
  commands.execAsync(command)
  
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
globals.centerpoint.x = -782
globals.centerpoint.y = 62
globals.centerpoint.z = 739
globals.centerpoint.string = globals.getCoords(globals.centerpoint)


globals.launchzone = {}
--Lake barges.  meant to go in a circle
globals.launchzone.barges = {}

globals.launchzone.barges.length = 5;

globals.launchzone.barges[0] = {}
globals.launchzone.barges[0].x = -775
globals.launchzone.barges[0].y = 63
globals.launchzone.barges[0].z = 761
globals.launchzone.barges[0].string = globals.getCoords(globals.launchzone.barges[0])

globals.launchzone.barges[1] = {x=-769, y=63, z=750}
globals.launchzone.barges[1].string = globals.getCoords(globals.launchzone.barges[1])

globals.launchzone.barges[2] = {x=-769, y=63, z=735}
globals.launchzone.barges[2].string = globals.getCoords(globals.launchzone.barges[2])

globals.launchzone.barges[3] = {x=-769, y=63, z=720}
globals.launchzone.barges[3].string = globals.getCoords(globals.launchzone.barges[3])


globals.launchzone.barges[4] = {x=-775, y=63, z=711}
globals.launchzone.barges[4].string = globals.getCoords(globals.launchzone.barges[4])


return globals;