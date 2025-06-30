local mongo = require("mongo")

-- Connect to MongoDB (default localhost:27017)
local client = assert(mongo.Client("mongodb://127.0.0.1:27017"))

-- Get database and collection
local db = client:getDatabase("userdb")
local users = db:getCollection("users")

-- Insert a document
local user = {
    name = "parameswari",
    age = 30,
    email = "param@gmail.com",
    address = {
        street = "123 Main St",
        city = "Anytown",
        state = "CA",
        zip = "12345"
    }
}
--result is true or false
local result = users:insertOne(user)
--print(result)
for doc in users:find({}):iterator() do
  print(doc.name)
end