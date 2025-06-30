
--package.path = package.path .. ";./ssl/?.dll"
local https = require("ssl.https")
local ltn12 = require("ltn12")
local dkjson = require("dkjson")

local response = {}
local _, code, _, status = https.request{
  url = "https://jsonplaceholder.typicode.com/users/1",
  sink = ltn12.sink.table(response)
}

print("Status:", status)
print("Body:", table.concat(response))
local requestBody={
  username="eswaribala",
  password="Test@123"
}
local responseBody={}
local requestBodyStr=dkjson.encode(requestBody)
local headers = {
  ["Content-Type"] = "application/json",
  ["Content-Length"] = #requestBodyStr
}
local _, code, responseHeaders, status = https.request{
  url = "https://postman-echo.com/post",
  method = "POST",
  headers = headers,
  source = ltn12.source.string(requestBodyStr),
  sink = ltn12.sink.table(responseBody)   

}
print("Status:", status)  
print("Response Body:", table.concat(responseBody))
print("Response Code:", code)
print("Response Headers:", responseHeaders) 
if code == 201 then
  print("Post created successfully")
else
  print("Failed to create post, status code:", code)
end

