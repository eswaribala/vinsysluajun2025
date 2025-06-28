-- This code demonstrates how to use a metatable to provide default values for missing fields in a Lua table.
-- If a field is not present in the `generator_config` table, it will fall back to the default values defined in the `default` table.
local default = {
  watts=100,
  volts=240
}
-- Create a new table for the generator configuration
-- and set its metatable to the default table.
local generator_config={
    fuel="diesel"
}

-- Set the metatable of `generator_config` to `default`
-- so that any missing fields will use the default values.
setmetatable(generator_config, {
    __index = default
})

print(generator_config.watts)  -- Output: 100
print(generator_config.volts)  -- Output: 240
print(generator_config.fuel)   -- Output: diesel