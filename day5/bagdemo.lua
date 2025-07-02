local alarm_events={}

local bag={}


function add_item(item)
    if not bag[item] then
        bag[item] = 1
        alarm_events[item] = item
    else
        bag[item] = bag[item] + 1
    end


end

for i=1,20 do
    add_item("device"..tostring(math.random(1,5)))
end

-- Print the bag contents
for item, count in pairs(bag) do
    print(item .. ": " .. count)
end
-- Print the alarm events
print("Alarm events:")
for item, _ in pairs(alarm_events) do
    print(item)
end