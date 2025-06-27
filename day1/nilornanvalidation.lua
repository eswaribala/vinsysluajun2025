--NaN validation
local nanvalidation = {}
function nanvalidation.isNaN(value)
    return type(value) == "number" and value ~= value
end
function nanvalidation.isNaNOrNil(value)
    return value == nil or nanvalidation.isNaN(value)
end
function nanvalidation.isNaNOrZero(value)
    return value == 0 or nanvalidation.isNaN(value)
end
function nanvalidation.isNaNOrZeroOrNil(value)
    return value == nil or value == 0 or nanvalidation.isNaN(value)
end
function nanvalidation.isNaNOrEmpty(value)
    return value == nil or value == "" or nanvalidation.isNaN(value)
end
function nanvalidation.isNaNOrEmptyOrZero(value)
    return value == nil or value == "" or value == 0 or nanvalidation.isNaN(value)
end
function nanvalidation.isNaNOrEmptyOrZeroOrNil(value)
    return value == nil or value == "" or value == 0 or nanvalidation.isNaN(value)
end
function nanvalidation.isNaNOrEmptyOrZeroOrNilOrFalse(value)
    return value == nil or value == "" or value == 0 or value == false or nanvalidation.isNaN(value)
end
function nanvalidation.isNaNOrEmptyOrZeroOrNilOrFalseOrTrue(value)
    return value == nil or value == "" or value == 0 or value == false or value == true or nanvalidation.isNaN(value)
end
if not pcall(function() assert(nanvalidation.isNaN(0/0)) end) then
    error("NaN validation module is not working correctly.")
end
print(nanvalidation.isNaN(0/0))
print(nanvalidation.isNaNOrNil(nil))
print(nanvalidation.isNaNOrZero(0))
print(nanvalidation.isNaNOrZeroOrNil(nil))
print(nanvalidation.isNaNOrEmpty(""))
print(nanvalidation.isNaNOrEmptyOrZero(0))
print(nanvalidation.isNaNOrEmptyOrZeroOrNil(nil))
print(nanvalidation.isNaNOrEmptyOrZeroOrNilOrFalse(false))
print(nanvalidation.isNaNOrEmptyOrZeroOrNilOrFalseOrTrue(true))
