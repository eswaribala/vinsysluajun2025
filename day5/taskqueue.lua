TaskQueue = {}
TaskQueue.__index = TaskQueue  -- This binds the methods
function TaskQueue:new()
     local obj = {
        first = 1,
        last = 0,
        data = {}
    }
    setmetatable(obj, _G.TaskQueue)
    return obj
end

function TaskQueue:enqueue(task)
    self.last = self.last + 1
    self.data[self.last] = task
end

function TaskQueue:peek()
    return self.data[self.first]
end

function TaskQueue:dequeue()
    if self.first > self.last then return nil end
    local task = self.data[self.first]
    self.data[self.first] = nil
    self.first = self.first + 1
    return task
end

function TaskQueue:is_empty()
    return self.first > self.last
end

return TaskQueue