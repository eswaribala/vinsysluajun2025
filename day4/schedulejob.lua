local function is_leap_year(year)
    return (year % 4 == 0 and year % 100 ~= 0) or (year % 400 == 0)
end

local function main()
    -- Define start and end datetimes
    local startDate = { year = 2025, month = 6, day = 25, hour = 14, min = 30, sec = 0 }
    local endDate   = { year = 2025, month = 6, day = 30, hour = 18, min = 45, sec = 0 }

    -- check is_leap_year
    if is_leap_year(startDate.year) then
        print(string.format("%d is a leap year", startDate.year))
    else
        print(string.format("%d is not a leap year", startDate.year))
    end


    local file = io.open("log.txt", "a")
    -- Convert to epoch seconds
    local startEpoch = os.time(startDate)
    local endEpoch = os.time(endDate)


    -- Calculate difference in seconds
    local diffInSeconds = os.difftime(endEpoch, startEpoch)

    -- Convert to hours
    local diffInHours = diffInSeconds / 3600
    if not file then
        print("Error opening file!")
        return
    end
    file:write(diffInHours .. " - Difference in time\n")
    file:close()
    -- server.log(string.format("Difference: %.2f hours", diffInHours), 1)
    print(string.format("Difference: %.2f hours", diffInHours))
end
main()