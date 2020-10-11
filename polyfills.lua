local polyfill = {}
polyfill.dev = false
polyfill.sleep = sleep

polyfill.isDev = function() 
  polyfill.sleep = function(n)  -- seconds
    local t0 = os.clock()
    while os.clock() - t0 <= n do
    end
  end
end



return polyfill