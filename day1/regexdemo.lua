package.path = package.path .. "./faker/?.lua;./faker/?/init.lua;./faker/?.lua;./faker/?/init.lua"
local Faker=require("faker")
local faker=Faker:new({locale="en_US" })
local name=faker:name()..math.random(1,1000)
print(string.format("Name=%s", name))
print(string.format("Name=%s", string.match(name,"%a+%s%a+%d+")))
local id=math.random(1000,9999)
print(string.format("ID=%d", string.match(id,"%d%d%d")))

--validate otp for 4 digits
local otp=math.random(10,999)
local pattern= '^%d+$'
-- pattern matches a string or number and returns a matching string or nil
local match=string.match(otp,pattern)
if match  and #match == 4 then
    print(string.format("OTP=%s is valid", otp))
else
    print(string.format("OTP=%s is invalid", otp))
end

-- check password using lua has at least 8 characters, one uppercase letter, one lowercase letter, one number, and one special character
local pw = "Password123!"
if #pw >= 8
     and pw:match("%l")      -- lowercase
     and pw:match("%u")      -- uppercase
     and pw:match("%d")      -- digit
     and pw:match("[%p%s]") then
    print("Password is valid")
else
    print("Password is invalid")
end
