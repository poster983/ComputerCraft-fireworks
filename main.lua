print("Starting version: v2.0.1")

Timecode = require("./timecode")
timecode = Timecode:create()
line1 = "-767"
col1= "771"
col2= "766"
col3= "761"
col4= "756"
col5= "751"
col6= "746"

lakeY = "58"


summon = "/summon fireworks_rocket"

rainbow_mine2 = "{LifeTime:30,FireworksItem:{id:fireworks,Count:1,tag:{Fireworks:{Flight:2,Explosions:[{Type:4,Flicker:0,Trail:1,Colors:[I;11743532,3887386,2437522],FadeColors:[I;2651799,14602026,12801229]},{Type:4,Flicker:0,Trail:1,Colors:[I;2651799,14602026,12801229],FadeColors:[I;11743532,3887386,2437522]}]}}}}"

function fire(line, y, col, firework) 
    print("/summon fireworks_rocket " .. line .. " " .. y .. " " .. col .. " " .. firework)
end


timecode:add(0, function() 
    fire(line1, lakeY, col1, rainbow_mine2)
end)

timecode:add(0.1, function() 
    fire(line1, lakeY, col2, rainbow_mine2)
end)

timecode:add(0.2, function() 
    fire(line1, lakeY, col3, rainbow_mine2)
end)

timecode:add(0.3, function() 
    fire(line1, lakeY, col4, rainbow_mine2)
end)

timecode:add(0.4, function() 
    fire(line1, lakeY, col5, rainbow_mine2)
end)

timecode:add(0.5, function() 
    fire(line1, lakeY, col6, rainbow_mine2)
end)


function getTime() 
    return os.clock()
end
co = timecode:start(getTime) 