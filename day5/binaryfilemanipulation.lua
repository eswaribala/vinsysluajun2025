local magick = require("magick")

local img = magick.load_image("bike4.jpg")
print("Width:", img:get_width())
print("Height:", img:get_height())

img:resize(100, 100)
img:write("resized.jpg")
