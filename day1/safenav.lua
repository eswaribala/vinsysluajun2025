
-- safenav.lua
-- Safe navigation utility library for Lua

local safenav = {}

-- Function: safely get nested keys
-- Usage: safenav.get(tbl, "a", "b", "c")  --> tbl.a.b.c or nil
function safenav.get(tbl, ...)
  local val = tbl
  for _, key in ipairs({...}) do
    if type(val) ~= "table" then return nil end
    val = val[key]
  end
  return val
end

-- Function: safe proxy table that returns more safe tables for missing keys
-- Usage: local t = safenav.proxy({a = {b = 1}}); print(t.a.b); print(t.x.y.z) --> no error
function safenav.proxy(t)
  local function make_safe(tbl)
    return setmetatable(tbl or {}, {
      __index = function()
        return make_safe()
      end
    })
  end
  return make_safe(t)
end

-- Function: safely iterate over table or nil
function safenav.iter(t)
  return pairs(t or {})
end

-- Function: safely print table contents
function safenav.print(tbl)
  for k, v in safenav.iter(tbl) do
    print(k, v)
  end
end

return safenav
