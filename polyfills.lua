local polyfill = {}
polyfill.dev = false

polyfill.isDev = function() 
  --[[polyfill.sleep = function(n)  -- seconds
    local t0 = os.clock()
    while os.clock() - t0 <= n do
    end
  end--]]
end

if sleep then 
  polyfill.sleep = sleep
else 
  polyfill.sleep = function(n)  -- seconds
    local t0 = os.clock()
    while os.clock() - t0 <= n do
    end
  end
end 


if commands then
  polyfill.exec = function(cmd) 
    print(cmd)
    commands.execAsync(cmd)
  end 
else 
  polyfill.exec = function(cmd)
    print(cmd)
  end
end

if parallel then 
  polyfill.parallelAll = parallel.waitForAll 
else 
  polyfill.parallelAll = function(...)
    for i,v in ipairs(arg) do
        v()
    end
  end 
end 

polyfill.tprint = function (tbl, indent)
  if not indent then indent = 0 end
  for k, v in pairs(tbl) do
    formatting = string.rep("  ", indent) .. k .. ": "
    if type(v) == "table" then
      print(formatting)
      polyfill.tprint(v, indent+1)
    elseif type(v) == 'boolean' then
      print(formatting .. tostring(v))      
    else
      print(formatting .. v)
    end
  end
end



return polyfill