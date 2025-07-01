
function productivity(unit_consumption, production_value)
    local success, result = pcall(function()
       return unit_consumption / production_value
    end)

    if success then
        return result  -- 'result' contains the productivity value
    else
        error("Error in productivity calculation: " .. result)  -- 'result' contains the error message

    end
end



local unit_consumption=math.random(1, 1000)
local production_value=math.random(0,1)
print(productivity(unit_consumption, "abc"))
print("continue")