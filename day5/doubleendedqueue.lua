BidirectionalStream = {}
BidirectionalStream.__index = BidirectionalStream

function BidirectionalStream:new()
    local obj = {
        first = 0,
        last = -1,
        data = {}
    }
    setmetatable(obj, self)
    return obj
end

function BidirectionalStream:push_front(item)
    self.first = self.first - 1
    self.data[self.first] = item
end

function BidirectionalStream:push_back(item)
    self.last = self.last + 1
    self.data[self.last] = item
end

function BidirectionalStream:pop_front()
    if self:is_empty() then return nil end
    local item = self.data[self.first]
    self.data[self.first] = nil
    self.first = self.first + 1
    return item
end

function BidirectionalStream:pop_back()
    if self:is_empty() then return nil end
    local item = self.data[self.last]
    self.data[self.last] = nil
    self.last = self.last - 1
    return item
end

function BidirectionalStream:is_empty()
    return self.first > self.last
end

function BidirectionalStream:size()
    return self.last - self.first + 1
end
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