

local function handle_request(request)
    if request==nil or request=="" then
        return "Invalid"
    end
    local str = request:gsub("\n", "\r\n")
    return str:gsub("([^%w%-_.~])", function(c)
        return string.format("%%%02X", string.byte(c))
    end)
end


local url_request="http://localhost:8080/encoding?name=pune technologies"
print(handle_request(url_request))

