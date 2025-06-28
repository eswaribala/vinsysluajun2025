// Function to return current time in milliseconds
#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

// C function that Lua will call
int my_add(lua_State *L) {
    // Get two arguments from Lua stack
    int a = luaL_checkinteger(L, 1);
    int b = luaL_checkinteger(L, 2);

    // Push result back to Lua
    lua_pushinteger(L, a + b);

    return 1; // Number of return values
}

// Register the function
int luaopen_myfunc(lua_State *L) {
    lua_register(L, "my_add", my_add);
    return 0;
}