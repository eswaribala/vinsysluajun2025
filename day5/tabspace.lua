

local function tabexpansion(namestr)
local tabsize=4
return namestr:gsub("(\t)", function()
  return string.rep(" ", tabsize)
end)
end

local name="Emerson\tEnginnering"
print(tabexpansion(name))