local function productivity(unit_consumption, production_value)
      local NaN=0/0
      local inf=1/0
      local  result= unit_consumption / production_value
      if result > 0 and result ~= inf then
        return result
      end
      if result <= 0 or result == nil or result == inf or result == NaN then
        error("Error in productivity calculation: Division by zero or negative value", 2)
      end

end

local function error_handler(err)
    return err;
end


local unit_consumption=math.random(1, 1000)
local production_value=math.random(0,1)

for i = 1, 10 do
    local success, result = xpcall(function()
        return productivity(unit_consumption, production_value)
    end, error_handler)
    if success then
        if result > 0 then
            print("Productivity calculation successful: " .. result)

        end
        print("Productivity: " .. result)
    else

          print("Caught an error: " .. result)  -- 'result' contains the error message

    end
end