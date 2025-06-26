
local Faker=require("faker")
local faker=Faker:new({locale="en_US" })

for count=1, math.random(10, 20) do
    local name = faker:name()
    print(string.format("Name count %d=%s", count, name))
    --reverse the name
    local reversed_name = name:reverse()
    print(string.format("Reversed name count %d=%s", count, reversed_name))
    local len=reversed_name:len()
    print(string.format("Length of reversed name count %d=%d", count, len))
    print (reversed_name:sub(math.random(1,len)))
    local password=reversed_name:sub(math.random(1,len))..os.date("%Y%m%d")
    print(string.format("Password count %d=%s", count, password))

end