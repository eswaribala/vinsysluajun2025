--multi io.lines(...)
local data=[[
56
67
78
89
90]]

local function readData(data)
    local lines = {}
    for str_value in data:gmatch("[%d]+") do
        table.insert(lines, tonumber(str_value))
    end
    return lines
end
local result = readData(data)
for i, v in ipairs(result) do
    print("Line " .. i .. ": " .. v)
end