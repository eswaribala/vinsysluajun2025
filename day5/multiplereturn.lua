local pressure_values={}
local flag=false

for i=1,100 do
   pressure_values[i]=math.random(80,120)
end


local function compute(pressure_values_tbl)

    local   min_pressure = pressure_values_tbl[1]
    local   max_pressure = pressure_values_tbl[#pressure_values]
    local   avg_pressure = 0
    local sum=0
    for i=1,#pressure_values_tbl do
        sum=sum + pressure_values_tbl[i]
    end
    avg_pressure = sum / #pressure_values_tbl
    return min_pressure, max_pressure, avg_pressure

end

table.sort(pressure_values)
flag=true
if flag then
    local min_pressure, max_pressure, avg_pressure = compute(pressure_values)
    print("Minimum Pressure: " .. tostring(min_pressure))
    print("Maximum Pressure: " .. tostring(max_pressure))
    print("Average Pressure: " .. tostring(avg_pressure))
end
