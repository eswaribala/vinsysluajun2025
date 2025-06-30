
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
local res,code,headers,status=https.request{
   url = "https://postman-echo.com/post",
   method = "post",
   headers = {
     ["Content-Type"] = "application/json",
     ["Content-Length"] = tostring(#requestBodyStr)
  },
  source=ltn12.source.string(requestBodyStr),
  sink=ltn12.sink.table(responseBody),
 }
print("Status:", status)
print("Response Body:", table.concat(responseBody))
if code == 200 then
  local responseData = dkjson.decode(table.concat(responseBody))
  if responseData and responseData.data then
    print("Username:", responseData.data.username)
    print("Password:", responseData.data.password)
  else
    print("No data found in response")
  end
end