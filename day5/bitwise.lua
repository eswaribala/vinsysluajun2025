


-- devices sla

local pump=1
local motor=1
local compressor=1
local heater=1

local actual=math.random(0,1)

--intellisense issue 
if pump & actual == 1 then
    print("Pump is ON")
else
    print("Pump is OFF")
end
if motor & actual == 1 then
    print("Motor is ON")
else
    print("Motor is OFF")
end
if compressor & actual == 1 then
    print("Compressor is ON")
else
    print("Compressor is OFF")
end
if heater & actual == 1 then
    print("Heater is ON")
else
    print("Heater is OFF")
end