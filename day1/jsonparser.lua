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
local json_data, err = parse_json("user.json")
if err then
    print("Error: " .. err)
else
    print("JSON data parsed successfully.")
    -- You can process the json_data further here if needed
    -- For demonstration, printing the JSON data
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
end