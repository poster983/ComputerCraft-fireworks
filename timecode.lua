-- CraftOS Lua Script  that attempts to implement a timecode function for time sensitive events
local Timecode = {}
local Cue = {}


function Timecode:create(o)
	o = o or {}   -- create object if user does not provide one
	setmetatable(o, self)
	self.__index = self
	self.cuelist = {}
	self.cuelist.length = 0
	self.triggered = 0
	return o
end

-- Returns a co routine
-- user must provide a time Function via an api like os.clock().  This has been left out as lua is bad at portability
function Timecode:start(timeFunction)
	local epoch = timeFunction()
	self.triggered = 0
	self.coroutine = coroutine.create(function ()
			while self.cuelist.length ~= self.triggered
			do
				local x=0
				while self.cuelist[x] do   -- Loop though a table
					
					if self.cuelist[x].lastTriggerd ~= epoch and self.cuelist[x].time < (timeFunction() - epoch)
					then
						self.cuelist[x].callback();
						self.cuelist[x].lastTriggerd = epoch
						self.triggered = self.triggered +1
					end
					x=x+1
				end
			end
	end)
	coroutine.resume(self.coroutine)

	return self.coroutine
end

function Timecode:add(time, callback)
  
	self.cuelist[self.cuelist.length] = Cue:create({time=time, callback=callback})
	self.cuelist.length = self.cuelist.length +1

end

-- {time, callback}
--time should be in whatever form your epoch is in
function Cue:create(o)
	o = o or {}   -- create object if user does not provide one
	setmetatable(o, self)
	self.__index = self
	self.lastTriggerd = nil
	return o
end

return Timecode
