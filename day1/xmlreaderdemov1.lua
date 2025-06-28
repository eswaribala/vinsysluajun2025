package.path = package.path .. ";C:/Users/param/AppData/Roaming/luarocks/share/lua/5.4/?.lua"
local xml2lua = require("xml2lua")
local handler = require("xmlhandler.tree")

local xmlFile = io.open("catalog.xml", "r")
local xmlContent = xmlFile:read("*a")
xmlFile:close()

local treeHandler = handler:new()
local parser = xml2lua.parser(treeHandler)
parser:parse(xmlContent)
--print(treeHandler)
-- Access data
local book = treeHandler.root.catalog.book
for _, bookref in ipairs(book) do
  print("Author:", bookref.author)
  print("Title:", bookref.title)
  print("Genre:", bookref.genre)

end