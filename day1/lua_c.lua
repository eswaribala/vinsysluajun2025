--package.path = package.path .. "./day1/config.lua"
package.loadlib("payroll.dll", "luaopen_invoke_compute_gross_salary")()  -- use .dll on Windows
local config = require("config")
print("Salary: " .. config.salary)
print("DA: " .. config.da)
print(compute_gross_salary(tonumber(config.salary), tonumber(config.da)))
