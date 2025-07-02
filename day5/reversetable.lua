function reverseTable(t)
  local reversed = {}
  for i = #t, 1, -1 do
    table.insert(reversed, t[i])
  end
  return reversed
end


local temp={}
for i=1,100 do
  temp[i]=math.random(1,100)
end

local reversedTemp = reverseTable(temp)
for i=1,100 do
  print(temp[i], reversedTemp[i])
end