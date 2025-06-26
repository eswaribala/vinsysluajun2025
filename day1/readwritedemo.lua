io.write("Enter Machine IP Address")
local ip = io.read()
io.write("Enter Machine Port Number")
local port = io.read()
print(string.format("Machine having IP Address %s and Port Number= %s received from user", ip,port))
-- type conversion
local port_number = tonumber(port)

if port_number >= 0  and port_number <=1027 then
    print("Reserved Port Number")
else
    print("Non Reserved Port Number")
end
