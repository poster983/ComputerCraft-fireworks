-- change this to play the right showfile


--direction
local direction ="right"
local showfile = "./songs/nicki"

local show = require(showfile)

while (true) do
    os.pullEvent("redstone")
    if rs.getInput(direction) then
        show.start()
    end
 end