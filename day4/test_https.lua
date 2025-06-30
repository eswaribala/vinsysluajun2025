
--package.path = package.path .. ";./ssl/?.dll"
local https = require("ssl.https")
local ltn12 = require("ltn12")

local response = {}
local _, code, _, status = https.request{
  url = "https://jsonplaceholder.typicode.com/users/1",
  sink = ltn12.sink.table(response)
}

print("Status:", status)
print("Body:", table.concat(response))
