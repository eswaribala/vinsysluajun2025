package.path = package.path .. ";C:/Users/param/AppData/Roaming/luarocks/share/lua/5.4/?.lua"
local json = require("dkjson")
local function parse_json(path)
  local file = io.open(path, "r")
  if not file then
    return nil, "Could not open file: " .. path
  end
    local content = file:read("*a")
    if not content then
        file:close()
        return nil, "Could not read file: " .. path
    else
        file:close()
        local json_data, pos, err = json.decode(content, 1, nil)
        if err then
            return nil, "JSON decode error at position " .. pos .. ": " .. err
        else
            return json_data, nil
        end
    end
end
<<<<<<< HEAD
<<<<<<< HEAD
-- Recursive function to print all key = value pairs
local function print_key_values(tbl)
    for key, value in pairs(tbl) do
        if type(value) == "table" then
            print_key_values(value)  -- go deeper, but don't print path
        else
            print(tostring(key) .. " = " .. tostring(value))
        end
    end
end

=======
>>>>>>> d2387d0d76f5ad1773a9fac8730b56ea82f8899a
=======
>>>>>>> d2387d0d76f5ad1773a9fac8730b56ea82f8899a
local json_data, err = parse_json("user.json")
if err then
    print("Error: " .. err)
else
    print("JSON data parsed successfully.")
    -- You can process the json_data further here if needed
    -- For demonstration, printing the JSON data
<<<<<<< HEAD
<<<<<<< HEAD
    -- Print each user
for i, user in ipairs(json_data) do
    print("User #" .. i)
   -- print(user)
    print_key_values(user)
    print("---")
end
=======
=======
>>>>>>> d2387d0d76f5ad1773a9fac8730b56ea82f8899a
    for key, value in pairs(json_data) do
       --print(type(value))
       if type(value) == "table" then
        for sub_key, sub_value in pairs(value) do
            print(key .. "." .. sub_key .. ": " .. tostring(sub_value))
        end
       else
            print(key .. ": " .. tostring(value))
       end
    end
<<<<<<< HEAD
>>>>>>> d2387d0d76f5ad1773a9fac8730b56ea82f8899a
=======
>>>>>>> d2387d0d76f5ad1773a9fac8730b56ea82f8899a
end