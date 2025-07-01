
local fields={
    "high_value",
    "low_value",
    "set_point",
    "process_value"
}

local function unpack_event(event)
    local result={}
    for _, field in ipairs(fields) do

        result[_]=event[field]
    end
    return table.unpack(result)
end

local function log_message(high_value, low_value, set_point, process_value)
   return string.format(
        "%d, %d, %d, %d",
        high_value, low_value, set_point, process_value
    )
end

local temp_event={
    high_value=90,
    low_value=30,
    set_point=70,
    process_value=50

}

local data=log_message(unpack_event(temp_event))
print(data)