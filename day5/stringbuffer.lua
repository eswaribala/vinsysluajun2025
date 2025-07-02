local buffer = {}
local function append(str)
   table.insert(buffer,str)
end

for i=1,1000 do
    append("DEVICE " .. i)
end

print("Buffer size: " .. #buffer)
print( "Buffered String" .. table.concat(buffer, "\n ") )