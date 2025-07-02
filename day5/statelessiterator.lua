
function  statelessiterator(n)
    return function()
        local current=n
        -- upvalue to keep track of the current value
        n = n - 1
        if current > 0 then
            return current
        end
    end
end


for i in statelessiterator(5) do
    if i==5 then
        print("This is the first value")
    end
    print(i)
end