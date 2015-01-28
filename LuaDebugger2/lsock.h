#pragma once

#include <stdlib.h>
#include <lua.h>
#include <lauxlib.h>


int lstart(lua_State* L);
int lread(lua_State* L);
int lwrite(lua_State* L);
int lclose(lua_State* L);
