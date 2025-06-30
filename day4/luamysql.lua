local luasql = require "luasql.mysql"

-- Create MySQL environment
local env = luasql.mysql()

--Connect to MySQL: (host, user, password, database)
local conn,err = env:connect("customerdb", "root", "rootpassword", "localhost", 3306)

if err then
  print(err)
end
if conn then
    print("✅ Connected to MySQL")

   --insert_query = string.format("INSERT INTO customer (customer_id, email) VALUES (%d, '%s')", math.random(1, 100), '')
    local insert_query = [[
        "INSERT INTO tag (tag_id, name,description,min_value,max_value,preset_value,set_point)
        VALUES (109, 'tag_name', 'tag_description', 0, 100, 50, 75)"]]
    -- Insert a new customer    
    
    
    local res, err = conn:execute(insert_query)
    if err then 
        print("❌ Error inserting data: " .. err)
    else
        print("✅ Data inserted successfully")
    end
    if res then
        print("Rows affected: " .. res)
    end 
    -- Update an existing customer
    local update_query = [[ 
        UPDATE customer 
        SET email = 'eswaribala@gmail.com']]
    local res, err = conn:execute(update_query)
    if err then
        print("❌ Error updating data: " .. err)
    else
        print("✅ Data updated successfully")
    end
    if res then
        print("Rows affected: " .. res)
    end

    -- Execute a query
    local cur = conn:execute("SELECT * FROM customer")

    -- Fetch rows
    local row = cur:fetch({}, "a")
    while row do
        print(string.format("customer_id: %s, email: %s", row.customer_id, row.email))
        row = cur:fetch(row, "a")
    end

    local cur = conn:execute("SELECT * FROM tag")

     -- Fetch rows
     local row = cur:fetch({}, "a")
     while row do
         print(string.format("tag_id: %d, name: %s, description: %s, min_value: %d, max_value: %d,preset_value: %d, set_point %d", row.tag_id,>40         row = cur:fetch(row, "a")
     end
    -- Close connection and cleanup
    cur:close()
        conn:close()
    env:close()
else
    print("❌ Connection failed")
end