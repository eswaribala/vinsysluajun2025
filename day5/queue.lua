local TaskQueue = {}
TaskQueue.__index = TaskQueue  -- This binds the methods
function TaskQueue:new()
     local obj = {
        first = 1,
        last = 0,
        data = {}
    }
    setmetatable(obj, TaskQueue)
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
local function create_sample_tasks()
    local now = os.time()
    --for testing make time ahead of now
    return {
        {id = 1, name = "Check Pump Status", scheduled_time = now - 10, status = "pending"},
        {id = 2, name = "Reset Alarm", scheduled_time = now - 20, status = "pending"},
        {id = 3, name = "Archive Logs", scheduled_time = now - 30, status = "pending"}
    }
end
-- Declare it globally at the top
global_task_queue = nil
local function main()
    if not _G.global_task_queue then
        -- Global variable retained across script intervals
        _G.global_task_queue = TaskQueue:new()
        for _, task in ipairs(create_sample_tasks()) do
            _G.global_task_queue:enqueue(task)
        end
    end

    local now = os.time()

    while not _G.global_task_queue:is_empty() do
        local task = _G.global_task_queue:peek()

        if now >= task.scheduled_time then
            -- Execute the task
            task.status = "done"
            print("Executing task #" .. task.id .. ": " .. task.name, 1)
            _G.global_task_queue:dequeue()
        else
            -- Not ready to execute yet
            print("Task #" .. task.id .. " is not ready yet. Scheduled for " .. os.date("%Y-%m-%d %H:%M:%S", task.scheduled_time), 1)
            break
        end
    end
end
main()