package.path = package.path .. "./faker/?.lua;./faker/?/init.lua;./faker/?.lua;./faker/?/init.lua"
local Faker=require("faker")
local faker=Faker:new({locale="en_US"})


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

-- Serialize the table to a csv
local file=io.open("motors.csv", "w")
for i, motor in ipairs(motors) do
  local line = string.format("%d,%s,%d,%d,%d\n", motor.id, motor.name, motor.year, motor.price, motor.mileage)
  file:write(line)
end
file:close()
