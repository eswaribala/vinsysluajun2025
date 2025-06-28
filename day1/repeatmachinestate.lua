-- check state of the machine
state=0
function get_state()
    return math.random(0,10)
end

repeat
  local state = get_state()
  _G["state"] = state
  print("Current state: " .. _G["state"])
until state == 1

if _G["state"] > 8 then
    print("Machine is not ready, waiting...")
else
    print("Machine is ready")
end



