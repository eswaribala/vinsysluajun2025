package.path = package.path .. ";C:/Users/param/AppData/Roaming/luarocks/share/lua/5.4/?.lua"
local xml2lua = require("xml2lua")
local handler = require("xmlhandler.tree")

local xmlFile = io.open("person.xml", "r")
local xmlContent = xmlFile:read("*a")
xmlFile:close()

local treeHandler = handler:new()
local parser = xml2lua.parser(treeHandler)
parser:parse(xmlContent)

-- Access data
local people = treeHandler.root.root.person
for _, person in ipairs(people) do
  print("Name:", person.name)
  print("Age:", person.age)
end