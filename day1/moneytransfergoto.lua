for count = 1,10 do
    amount = math.random(10000,10000000)
    if amount>=20000 then
        goto limitvalidator

    end
end



::limitvalidator::
 print("transaction not allowed".._G["amount"])
 