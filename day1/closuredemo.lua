package.path = package.path .. "./faker/?.lua;./faker/?/init.lua;./faker/?.lua;./faker/?/init.lua;./day1/config.lua"
local Faker=require("faker")
local faker=Faker:new({locale="en_US" })
local function device_config()
    -- private variables
   local devname = faker:name()
   local dev_password = faker:city()
   -- closure to capture devname and dev_password
   return function(username, password)
        if username == nil or username == "" then
            return nil,nil, "Username cannot be empty"
        end
        if password == nil or password == "" then
            return nil, nil,"Password cannot be empty"
        end
        if username == "admin" and password == "password123" then
            return devname, dev_password,nil
        end
    end

end

local config=require("config")
local device_config_ref = device_config()
local devname, password,err = device_config_ref(config.username, config.password)
if err then
    print("Error: " .. err)
else
    print("Device Name: " .. devname)
    print("Device Password: " .. password)
end