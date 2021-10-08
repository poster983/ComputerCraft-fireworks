local globals = {}
math.randomseed(os.time())


-- returns a coord string for commands
globals.getCoords = function(coordTable)
  return string.format("%.3f", coordTable.x) .. " " .. string.format("%.3f", coordTable.y) .. " " .. string.format("%.3f", coordTable.z);
end 

function cords(x, y, z)
  local c = {x=x, y=y, z=z}
  c.string = globals.getCoords(c)
  return c
end 

globals.cords = cords

globals.select = function(table, ...)
  local newTable = {}
  local length = 0
  for i,v in ipairs(arg) do
    --print(v)
    newTable[i] = table[v]
    length = i
  end
  newTable.length = length
  return newTable
end

globals.shuffle = function(tab) 
  local shuffled = {}
  for i, v in ipairs(tab) do
	  local pos = math.random(1, #shuffled+1)
	  table.insert(shuffled, pos, v)
  end
  return shuffled
end

--[[globals.combineCords = function(nestedTable, length) 
  local ittr = {}
  local x = 0
  while(length > x) do 

  end
  for i,value in ipairs(nestedTable) do 
    print(i,value) 
    if not ittr[i] then 
      ittr[i] = 0
    end

  end


end --]]

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
--globals.launchzone.leftFrontTower.length = 8
globals.launchzone.leftFrontTower.center = cords(-611, 127, 257)


globals.launchzone.leftFrontTower[1] = cords(-611, 114, 261)
globals.launchzone.leftFrontTower[2] = cords(-608, 113, 260)
globals.launchzone.leftFrontTower[3] = cords(-607, 114, 257)
globals.launchzone.leftFrontTower[4] = cords(-608, 113, 254)
globals.launchzone.leftFrontTower[5] = cords(-611, 114, 253)
globals.launchzone.leftFrontTower[6] = cords(-614, 113, 254)
globals.launchzone.leftFrontTower[7] = cords(-615, 114, 257)
globals.launchzone.leftFrontTower[8] = cords(-614, 113, 260)

globals.launchzone.leftBackTower = {}
--globals.launchzone.leftBackTower.length = 8
globals.launchzone.leftBackTower.center = cords(-611-27, 127+7, 257-2)

globals.launchzone.leftBackTower[1] = cords(-611-27, 114+7, 261-2)
globals.launchzone.leftBackTower[2] = cords(-608-27, 113+7, 260-2)
globals.launchzone.leftBackTower[3] = cords(-607-27, 114+7, 257-2)
globals.launchzone.leftBackTower[4] = cords(-608-27, 113+7, 254-2)
globals.launchzone.leftBackTower[5] = cords(-611-27, 114+7, 253-2)
globals.launchzone.leftBackTower[6] = cords(-614-27, 113+7, 254-2)
globals.launchzone.leftBackTower[7] = cords(-615-27, 114+7, 257-2)
globals.launchzone.leftBackTower[8] = cords(-614-27, 113+7, 260-2)

globals.launchzone.wallTop={}
globals.launchzone.wallTop.center = cords(-622, 110, 206)
--left side
globals.launchzone.wallTop[1] = cords(-629, 107, 243)
globals.launchzone.wallTop[2] = cords(-628, 107, 240)
globals.launchzone.wallTop[3] = cords(-627, 106, 237)
globals.launchzone.wallTop[4] = cords(-627, 105, 233)
globals.launchzone.wallTop[5] = cords(-626, 105, 230)
globals.launchzone.wallTop[6] = cords(-626, 104, 226)
globals.launchzone.wallTop[7] = cords(-625, 103, 223)
globals.launchzone.wallTop[8] = cords(-625, 102, 219)
globals.launchzone.wallTop[9] = cords(-625, 102, 215)
--Middle Section
globals.launchzone.wallTop[10] = cords(-624, 101, 212)
globals.launchzone.wallTop[11] = cords(-624, 101, 208)
globals.launchzone.wallTop[12] = cords(-624, 101, 204)
globals.launchzone.wallTop[13] = cords(-624, 101, 200)
--Right Side
globals.launchzone.wallTop[14] = cords(-625, 102, 197)
globals.launchzone.wallTop[15] = cords(-625, 102, 193)
globals.launchzone.wallTop[16] = cords(-625, 103, 189)
globals.launchzone.wallTop[17] = cords(-626, 104, 186)
globals.launchzone.wallTop[18] = cords(-626, 105, 182)
globals.launchzone.wallTop[19] = cords(-627, 105, 179)
globals.launchzone.wallTop[20] = cords(-627, 106, 175)
globals.launchzone.wallTop[21] = cords(-628, 107, 172)
globals.launchzone.wallTop[22] = cords(-629, 107, 169)

-- Chapel 
globals.launchzone.chapel = {}
globals.launchzone.chapel.northPoint = cords(-670, 220, 121)






-- House and train track:

globals.ht = {} 

-- volume of music 

globals.ht.volume = 10

-- Used for music and particle effects
globals.ht.centerpoint = cords(-669,100,207)


-- launch Locations
globals.ht.lz = {}

--Launch Track
globals.ht.lz.track = {}

globals.ht.lz.track.outgoing = cords(-590, 71,672)
globals.ht.lz.track.incoming = cords(-594, 71,672)


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


return globals;