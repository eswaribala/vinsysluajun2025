-- Returns a table of all days in a given month
local function is_leap_year(year)
    return (year % 4 == 0 and year % 100 ~= 0) or (year % 400 == 0)
end
local function days_in_month(year, month)
    if month < 1 or month > 12 then
        return 0 -- Invalid month
    end

    local days_in_months = {31, 28 + (is_leap_year(year) and 1 or 0), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
    return days_in_months[month]
end
local function get_month_days(year, month)
    local total_days = days_in_month(year, month)
    local result = {}

    for day = 1, total_days do
        table.insert(result, {
            year = year,
            month = month,
            day = day,
            weekday = os.date("*t", os.time{year=year, month=month, day=day}).wday  -- 1=Sunday ... 7=Saturday
        })
    end

    return result
end

-- Helper function to determine the number of days in a month

-- Example:
local function main()
    local days = get_month_days(2025, 7) -- July 2025
    for _, d in ipairs(days) do
        print(string.format("%04d-%02d-%02d (weekday: %d)", d.year, d.month, d.day, d.weekday), 1)
    end
    -- days in July 2025
    local days_in_month_value = days_in_month(2025, 7)
    print("Days in July 2025: " .. days_in_month_value, 1)
end
main()