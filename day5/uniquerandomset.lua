
local UniqueRandomSet = {}
local keys={}

local function addto_unique_random_set(key)
    if not keys[key] then
        keys[key] = true
        table.insert(UniqueRandomSet, key)
    end
end

for _=1,10 do
    addto_unique_random_set(math.random(1,10))
end

for i in ipairs(UniqueRandomSet) do
    print(i)
end
