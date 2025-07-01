local inmation={}

function inmation.set_temp()
end
function inmation.get_temp()
  return math.random(20, 30) -- Simulating a temperature reading between 20 and 30 degrees
end
function inmation.log_temp(current_temp)
    print("Logging temperature: " .. current_temp .. " degrees")
end

-- This Lua script checks the room temperature and logs it if it's below a certain threshold.
-- watch dog
local function check_room_temp(threshold_value)
    local current_temp = inmation.get_temp()
    if current_temp < threshold_value then
        inmation.log_temp(current_temp)
        print("Warning: Room temperature is less than the threshold!")
    else
        print("Room temperature is within the safe range.")
        os.execute("timeout /T 10 >nul") -- Simulating a delay
        check_room_temp(threshold_value) -- Tail call to check again
    end

end


local threshold_value = 25
check_room_temp(threshold_value)

