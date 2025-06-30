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

    -- insert a new customer
    local insert_query = [[ 
        INSERT INTO customer (customer_id, email) 
        VALUES (1, 'param@gmail.com')]]
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

    -- Close connection and cleanup
    cur:close()
        conn:close()
    env:close()
else
    print("❌ Connection failed")
end