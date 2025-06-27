--create n number of switch
package.path = package.path .. "./faker/?.lua;./faker/?/init.lua;./faker/?.lua;./faker/?/init.lua"
local Faker=require("faker")
local faker=Faker:new({locale="en_US"})
local switches={}
io.write("Enter no of switches")
local count=io.read("n");
print(string.format("Number of switces=%d",count))
local switch=""
--create n switches
for _ =1,count do
    switch=faker:city()
    table.insert(switches,switch)
end

--sorting
table.sort(switches)
--iteration
for index,value in ipairs(switches) do
    print(string.format("Switch in position %d = %s", index,value))
end

