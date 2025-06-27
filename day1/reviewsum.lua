--create operator overloading for reviewsum

function scores(quality,service,usage)
  local result={
    quality = quality or 0,
    service = service or 0,
    usage = usage or 0
  }
  local compute_sum={
    __add = function(c1,c2)
      return scores(c1.quality + c2.quality, c1.service + c2.service, c1.usage + c2.usage)
    end
  }
  return setmetatable(result,compute_sum)
end

local c1 = scores(10,9,8)
local c2 = scores(5,6,7)
local c3 = c1 + c2
print("Quality: " .. c3.quality)
print("Service: " .. c3.service)
print("Usage: " .. c3.usage)