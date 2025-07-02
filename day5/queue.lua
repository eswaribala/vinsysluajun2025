package.path = package.path .. ";./lib/?.lua"
local TaskQueue=require("taskqueue")

 -- Assuming taskqueue.lua is in the same directory
-- Access the TaskQueue class from the module
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
    if not global_task_queue then
        -- Global variable retained across script intervals
        global_task_queue = TaskQueue:new()
        for _, task in ipairs(create_sample_tasks()) do
            global_task_queue:enqueue(task)
        end
    end

    local now = os.time()

    while not global_task_queue:is_empty() do
        local task = global_task_queue:peek()

        if now >= task.scheduled_time then
            -- Execute the task
            task.status = "done"
            print("Executing task #" .. task.id .. ": " .. task.name, 1)
            global_task_queue:dequeue()
        else
            -- Not ready to execute yet
            print("Task #" .. task.id .. " is not ready yet. Scheduled for " .. os.date("%Y-%m-%d %H:%M:%S", task.scheduled_time), 1)
            break
        end
    end
end
main()