local function withdraw(balance,amount)
    if(amount > balance) then
        error("Insufficient funds", 2)
    end
    balance = balance - amount
    return balance
end

local function handler(err)
    if type(err) == "string" then
        return ("Error: " .. err)
    else
        return ("An error occurred: " .. tostring(err))
    end

end

--local status, result
for i = 1, 10 do
    local status, result = xpcall(function()
     return withdraw(math.random(100000), math.random(200000))
end, handler)

    --print(result)
    if not status then
        print("Transaction failed: "..result)
    else
        if result > 0 then
         print("Transaction successful=" ..result)
        end
    end
end

print("End of transactions")