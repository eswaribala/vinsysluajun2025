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

-- print all the words i a string
local text= "Hi lua programmer, welcome to regex demo! dated 26/06/2025"
for word in text:gmatch("%w+") do
    if word:match("%a+") then
        print("Word found: " .. word)
    end

end

-- check for 10 digits mobile number
local mobile_number = "1234567890"
local mobile_pattern = "^%d+$" -- Matches exactly 10 digits
if string.match(mobile_number, mobile_pattern) and #mobile_number == 10 then
    print("Mobile number is valid")
else
    print("Mobile number is invalid")
end

-- check dob validation
local dob = "26/06/2025"
local dob_pattern = "^(%d%d)/(%d%d)/(%d%d%d%d)$" -- Matches dd/mm/yyyy format
local day, month, year = string.match(dob, dob_pattern)
if day and month and year then
    day = tonumber(day)
    month = tonumber(month)
    year = tonumber(year)

    -- Basic validation for day and month
    if month >= 1 and month <= 12 and day >= 1 and day <= 31 then
        print("DOB is valid: " .. dob)
    else
        print("DOB is invalid: " .. dob)
    end
else
    print("DOB format is invalid")
end

local feedback="Hello, this is a test message. Please contact us at 99952032862 chennai airport for more information. Our email is"
local count=0
print(#feedback)
for word in feedback:gmatch("%S+") do
   count = count + 1
   print(string.format("Word %d: %s", count, word))
end
print(string.format("Total words in feedback: %d", count))