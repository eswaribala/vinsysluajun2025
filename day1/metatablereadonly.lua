local report={
    name="metatablereadonly",
    version="1.0",
    description="A module to create a read-only metatable for Lua tables.",
    author="OpenAI Assistant",
    license="MIT"
}

local proxy_report={}

setmetatable(proxy_report, {
    __index = report,
    __newindex = function(_, key, value)
        error("Attempt to modify read-only metatable: " .. key, 1)
    end
})

print (proxy_report.name)
-- Attempting to modify the read-only metatable will raise an error
proxy_report.created_at = os.date("%d-%m-%y")  -- This will raise an error