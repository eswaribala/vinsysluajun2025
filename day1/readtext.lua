function readfile(file_name,start_line, end_line)
  local file = io.open(file_name, "r")
  if not file then
    return nil, "Could not open file: " .. file_name
  else
    local content = file:lines()

    -- Check if start_line and end_line are valid
    local current_line = 0
    local result = {}
    for line in content do
      current_line = current_line + 1
      if current_line >= start_line and current_line <= end_line then
        table.insert(result, line)
      end
      if current_line > end_line then
        break  -- Stop reading if we've reached the end line
      end
    end
    return result, nil

  end


end

local content, err = readfile("jmeter.log",5,10)
if not content then
  print("Error: " .. err)
else
  print("File content successfully read.")
  -- You can process the content here, e.g., print it or parse it.
  -- print(content) -- Uncomment to see the content
  print(content)
    for i, line in ipairs(content) do
        print(i, line)
    end
end