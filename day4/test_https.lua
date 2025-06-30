
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
if code == 200 then
  print("Post created successfully")
else
  print("Failed to create post, status code:", code)
end

if responseHeaders then
  for k, v in pairs(responseHeaders) do
    print(k, v)
  end
else
  print("No response headers received")
end
if status then
  print("Response status:", status)
else
  print("No response status received")
end

-- Check if the response body is not empty
if #responseBody > 0 then
  -- Decode the JSON response
  local jsonResponse, pos, err = dkjson.decode(table.concat(responseBody), 1, nil)
  if err then
    print("Error decoding JSON:", err)
  else
    -- Print the decoded JSON response
    print("Decoded JSON Response:")
    for k, v in pairs(jsonResponse) do
      print(k, v)
    end
  end
else
  print("No response body received")
end