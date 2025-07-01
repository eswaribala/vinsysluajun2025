local function nameLength(nameValue)

local success, result= pcall(function()
    if type(nameValue) ~= "string" then
        error("Invalid name type: expected string, got " .. type(nameValue))
    else
        return string.len( nameValue )
    end

end)
 if success then
        return result  -- 'failure' contains the length of the name
    else
        print("Error: " .. result)  -- 'failure' contains the error message
        return nil
    end

end

local name="Emerson Enginnerig"
local length = nameLength(name)
print("Length of name '" .. name .. "' is: " .. (length or "Error occurred"))
