
--[[
author: Parameswari
date: 2023-10-01
]]
local Faker=require("Faker")
local faker=Faker:new({locale="en_US"})
print(type(faker:name()))
-- Generate a random number
print(type(math.random(1, 100)))



local deviceId = "12345-67890-ABCDE"  -- Example device ID

print("Device ID: " .. deviceId)
--global variable to store
organization_name="Emerson"
local organization_name="Vinsys"
print("Organization Name: " .. _G["organization_name"])
print("Local Organization Name: " .. organization_name)
--multiline statements
local multiline_string = [[
This is a multiline string.
It can span multiple lines.
]]

print("Multiline String: " .. multiline_string)



