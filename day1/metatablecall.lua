local accumulate={}

setmetatable(accumulate, {
    --variadic function
    __call = function(_, ...)
        local sum = 0
        for i = 1, select('#', ...) do
            sum = sum + select(i, ...)
        end
        return sum
    end
})




local result=accumulate(6796,8999,908,9090)
print(result)
result=accumulate(6796,8999,9080)
print(result)