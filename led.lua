local M = {
    speed = 100,
    length = 1
}

function M.animate(frames, s)
     s = s or M.speed
     tmr.stop(1)
     local co = coroutine.create(function()
        while true do
          for i = 1, #frames do
              ws2812.write(frames[i])
              coroutine.yield()
          end
        end
      end)
     tmr.alarm(1, s, 1, function() coroutine.resume(co) end)
end


function M.stop()
    tmr.stop(1)
    ws2812.write(string.char(0,0,0):rep(M.length))
end

return M
