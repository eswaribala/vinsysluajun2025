local function withdraw(balance,amount)
    if(amount > balance) then
        error("Insufficient funds", 2)
    end
    balance = balance - amount
    return balance
end

local function handler(err)
    if type(err) == "string" then
        print("Error: " .. err)
    else
        print("An error occurred: " .. tostring(err))
    end

end

--local status, result
for i = 1, 10 do
    local status, result = xpcall(function()
     return withdraw(math.random(100000), math.random(500,5000))
end, handler)

    print(result)
    if not status then
        print("Transaction failed: ")
    else
        print("Transaction successful" )
    end
end

print("End of transactions")