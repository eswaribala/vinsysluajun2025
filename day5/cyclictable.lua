local dkjson = require("dkjson")
local motors={}
local unit_consumption = {
  ["liters_per_100km"] = 8,
  ["mpg"] = 29.4,
  ["km_per_liter"] = 12.5
}

local motor={}
for i=1,100 do
  motor.id=math.random(1, 1000)
  motor.name="Motor " .. i
  motor.price=math.random(10000, 50000)
  --ccyclic table json conversion not possible
 -- motor.self=motor
    motor.unit_consumption = unit_consumption
    table.insert(motors, motor)
  motor={}

end
--print motors
for i, motor in ipairs(motors) do
  print("Motor ID: " .. motor.id)
  print("Motor Name: " .. motor.name)
  print("Motor Price: " .. motor.price)
 --[[
  if motor.self == motor then
    print("Self-reference works!")
  else
    print("Self-reference failed!")
  end]]
end

-- serialization convert dictionary to json
local encoded_value = dkjson.encode(motors, { indent = true })  
-- create json file
local file = io.open("motors_v1.json", "w")
file:write(encoded_value)
file:close()