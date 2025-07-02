local temp={5}
local function  stateless_iterator(n)
    return function()
        local current=n
        -- upvalue to keep track of the current value
        n = n - 1
        if current > 0 then
            return temp[current]*20
        end
    end
end


for i in stateless_iterator(#temp) do
    if i==5 then
        print("This is the first value")
    end
    print(i)
end