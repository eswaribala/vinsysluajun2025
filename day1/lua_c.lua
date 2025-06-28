package.loadlib("mylib.dll", "luaopen_myfunc")()  -- use .dll on Windows
print(my_add(100, 250))
