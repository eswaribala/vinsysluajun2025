package.path = package.path .. "./safenav.lua";
local safenav = require("safenav")
local user = {
  profile = {
    name = "Alice",
    contact = { email = "alice@example.com" }
  }
}

print(safenav.get(user, "profile", "contact", "email"))   --> alice@example.com
print(safenav.get(user, "settings", "theme"))             --> nil

-- Proxy example
local safeUser = safenav.proxy(user)
print(safeUser.profile.name)      --> Alice
print(safeUser.settings.theme)    --> nil (no error)

-- Safe print
safenav.print(user.profile)