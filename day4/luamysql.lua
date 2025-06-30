local luasql = require "luasql.mysql"
local math=require('math')
-- Create MySQL environment
local env = luasql.mysql()

--Connect to MySQL: (dbname,user, password, host,port)
local conn,err = env:connect("equipmentdb", "root", "rootpassword", "localhost", 3306)

if err then
  print(err)
end
if conn then
    print("Connected to MySQL")
    local id=math.random(1,1000)
    print(id)

    -- insert a new customer

    local insert_query = string.format("insert into tag(tag_id,name,description,min_value,max_value,preset_value,set_point)values('%d','%s','%s'>

    local res, err = conn:execute(insert_query)

    if err then
        print("Error inserting data: " .. err)
    else
        print("Data inserted successfully")
    end
    if res then
        print("Rows affected: " .. res)
    end

    -- select query
    local cur = conn:execute("SELECT * FROM tag")

    -- Fetch rows
      -- Fetch rows    -- Fetch rows
    local row = cur:fetch({}, "a")
    while row do
        print(string.format("tag_id: %d, name: %s, description: %s, min_value: %d, max_value: %d,preset_value: %d, set_point %d", row.tag_id, ro>        row = cur:fetch(row, "a")
    end


    conn:close()
    env:close()
else
    print("Connection failed")
end