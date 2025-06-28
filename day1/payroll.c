// Function to return current time in milliseconds
#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

// C function that Lua will call
int compute_gross_salary(lua_State *L) {
    // Get two arguments from Lua stack
    int salary = luaL_checkinteger(L, 1);
    int da = luaL_checkinteger(L, 2);

    // Push result back to Lua
    lua_pushinteger(L, salary + da);

    return 1; // Number of return values
}

// Register the function
int luaopen_invoke_compute_gross_salary(lua_State *L) {
    lua_register(L, "compute_gross_salary", compute_gross_salary);
    return 0;
}