local BidirectionalStream = require("bidirectionalqueue")
function main()
    local stream = BidirectionalStream:new()

    -- Simulate sending messages from both ends
    stream:push_back("Sensor → Controller")
    stream:push_front("Controller ← Config ACK")
    stream:push_back("Sensor → Data Packet")
    stream:push_front("Controller ← Heartbeat")

    print("Processing from FRONT:")
    while not stream:is_empty() do
        local msg = stream:pop_front()
        print(msg)
    end

    -- Refill
    stream:push_back("New Packet 1")
    stream:push_back("New Packet 2")
    stream:push_front("Replay Packet 0")

    print("\nProcessing from BACK:")
    while not stream:is_empty() do
        local msg = stream:pop_back()
        print(msg)
    end
end

main()