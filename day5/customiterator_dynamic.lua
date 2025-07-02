local temp={}
local value=0
-- Generate 10 random values and store them in the temp table
for i=1,10 do
  value=math.random(30,80)
  temp[i]=value
end

--custom iterator function
function iterate()
    local count = 0
    --closure to keep track of the index
    return function()
        count = count + 3 -- increment by a random number between 1 and 3
        if count <= #temp then
            return count,temp[count]+10
        end
    end
end
--print the temp values
for k,v in iterate() do
    print(k,v)
    table.insert(temp, math.random(40,70)) -- Store the modified value back into the temp table
    table.insert(temp, math.random(40,70))
end
