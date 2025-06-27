-- multiple returns in Lua
function readcsv(path)
    local file = io.open(path, "r")
    if not file then
        return nil, "Could not open file: " .. path
    end
    local content=file:read("*all")
    file:close()
    if not content then
        return nil, "Could not read file: " .. path
    else
      return content, nil
    end
end


local content,err=readcsv("reviews.csv")
if err then
    print("Error: " .. err)
else
    print("File content read successfully.")
    -- You can process the content further here if needed
    --print(conent)  -- For demonstration, printing the content
    for line in content:gmatch("[^\n]+") do
        -- print(line)  -- Print each line of the CSV content
        for word in line:gmatch("[^,]+") do
            --print(word)  -- Print each word in the line

                print(word)  -- Print each non-empty word in the line

        end
    end
end
