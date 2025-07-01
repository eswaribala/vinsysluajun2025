local sensor_data=string.pack("i4", math.random(1, 1000))
print("Sensor Data: " .. sensor_data)

local sensor_data_unpacked = string.unpack("i4", sensor_data)
print("Unpacked Sensor Data: " .. sensor_data_unpacked)