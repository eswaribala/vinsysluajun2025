-- Define the stateful iterator
function array_iterator(t)
    local function iter(tbl, i)
        i = i + 1
        if tbl[i] then
            return i, tbl[i]
        end
    end
    return iter, t, 0  -- iterator function, state, initial control var
end

-- Use it in a for loop
local fruits = {"apple", "banana", "cherry"}

for index, fruit in array_iterator(fruits) do
    print(index, fruit)
end
