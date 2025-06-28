local current_time = os.date("%Y-%m-%d %H:%M:%S")
local epoch_time = os.time()

print("Current time: " .. current_time)
print("Epoch time: " .. epoch_time)

print("Current time in seconds since epoch: " .. os.date("%d/%m/%Y %H:%M:%S", epoch_time))
local now = os.time()

local ten_days = 60 * 60 * 24*10
local after_ten_days = now + ten_days

print(os.date("%Y-%m-%d %H:%M:%S", after_ten_days))  --> Tomorrow's date
