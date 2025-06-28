-- create db configurations

package.path = package.path .. "./faker/?.lua;./faker/?/init.lua;./faker/?.lua;./faker/?/init.lua"
local Faker=require("faker")
local faker=Faker:new({locale="en_US"})

local dbconfigurations={}
io.write("Enter no of db configurations: ")
local count=io.read("n")

local dbconfig={}

-- create n db configurations
for _ =1,count do
    dbconfig={
        name = faker:name(),
        host = faker:city(),
        port = math.random(1000,9999),
        username = faker:state(),
        password = faker:surname(),
        validate=function ()
            local status=false
            if #dbconfig["password"] >= 8
                and dbconfig.password:match("%l")      -- lowercase
                and dbconfig.password:match("%u")      -- uppercase
                and dbconfig.password:match("%d")      -- digit
                and dbconfig.password:match("[%p%s]") then
                status=true
            end
            return status
        end
    }
    table.insert(dbconfigurations,dbconfig)
end

--sorting db configurations by name
table.sort(dbconfigurations, function(dbconfiguration1, dbconfiguration2)
    return dbconfiguration1.port < dbconfiguration2.port
end)

-- iterate over db configurations
for index,dbconfig_value in ipairs(dbconfigurations) do
    print(string.format("DB Configuration %d:", index))
    print(string.format("  Name: %s", dbconfig_value.name))
    print(string.format("  Host: %s", dbconfig_value.host))
    print(string.format("  Port: %d", dbconfig_value.port))
    print(string.format("  Username: %s", dbconfig_value.username))
    print(string.format("  Password: %s", dbconfig_value.password))
    print(string.format("  Validate: %s", dbconfig_value.validate()))
end