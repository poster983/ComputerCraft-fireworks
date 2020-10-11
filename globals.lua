local globals = {}



-- returns a coord string for commands
globals.getCoords = function(coordTable)
  return coordTable.x .. " " .. coordTable.y .. " " .. coordTable.z;
end 

function cords(x, y, z)
  local c = {x=x, y=y, z=z}
  c.string = globals.getCoords(c)
  return c
end 

--[[globals.fire = function(coords, firework) 
    --commands.execAsync
    globals.exec("summon fireworks_rocket " .. coords .. " " .. firework)
end]]

-- volume of music 
globals.volume = 10

-- Used for music and particle effects
globals.centerpoint = cords(-669,100,207)



globals.launchzone = {}
--Castle: 

--Towers: 
globals.launchzone.leftFrontTower = {}
globals.launchzone.leftFrontTower.length = 8
globals.launchzone.leftFrontTower.center = cords(-611, 127, 257)


globals.launchzone.leftFrontTower[0] = cords(-611, 114, 261)
globals.launchzone.leftFrontTower[1] = cords(-608, 113, 260)
globals.launchzone.leftFrontTower[2] = cords(-607, 114, 257)
globals.launchzone.leftFrontTower[3] = cords(-608, 113, 254)
globals.launchzone.leftFrontTower[4] = cords(-611, 114, 253)
globals.launchzone.leftFrontTower[5] = cords(-614, 113, 254)
globals.launchzone.leftFrontTower[6] = cords(-615, 114, 257)
globals.launchzone.leftFrontTower[7] = cords(-614, 113, 260)

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