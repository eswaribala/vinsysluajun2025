package.path = package.path .. "./faker/?.lua;./faker/?/init.lua;./faker/?.lua;./faker/?/init.lua"
local Faker=require("faker")
local faker=Faker:new({locale="en_US"})
local dkjson = require("dkjson")

local motors={}

for i=1,100 do
  local motor = {
    id = i,
    name = faker:name(),
    year = math.random(1990, 2023),
    price = math.random(10000, 50000),
    mileage = math.random(1000, 200000),
   }
   table.insert(motors, motor)

end

--serialization convert dictionary to json
local encoded_value= dkjson.encode(motors)
--create jso file
local file=io.open("motors.json",  "w")
file:write(encoded_value)
file:close()
