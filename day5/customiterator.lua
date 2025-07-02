local temp={}
local value=0
-- Generate 10 random values and store them in the temp table
for i=1,10 do
  value=math.random(30,80)
  temp[i]=value
end

--custom iterator function
function iterate(n)
    local i = 0
    --closure to keep track of the index
    return function()
        i = i +3
        if i <= n then
            return i,temp[i]+10
        end
    end
end




--print the temp values
for k,v in iterate(#temp) do
    print(k,v)
end
