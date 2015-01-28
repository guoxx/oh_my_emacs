#include "lsock.h"

#include <assert.h>
#include <sys/select.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <errno.h>
#include <unistd.h>

const static int BUFFER_SIZE = 4096;

struct socket
{
    int listen_fd;
    int fd;
    int closed;
};

static int _fdReadable(int fd)
{
	fd_set rfds;
	struct timeval tv = {0,0};

	FD_ZERO(&rfds);
	FD_SET(fd, &rfds);

	return select(fd+1, &rfds, NULL, NULL, &tv) == 1;
}

static int _test(struct socket* s)
{
    assert(s != NULL);
    
    if (s->closed && s->fd > 0)
    {
        close(s->fd);
        s->fd = -1;
        s->closed = 0;
    }

    if (s->fd <= 0 && _fdReadable(s->listen_fd))
    {
        s->fd = accept(s->listen_fd, NULL, NULL);
    }

    if (s->fd > 0 && _fdReadable(s->fd))
    {
        return s->fd;
    }
    return -1;
}

int lstart(lua_State* L)
{
    const char* addr = luaL_optstring(L, 1, "0.0.0.0");
    int port = luaL_optint(L, 2, 6789);

    struct socket *s = lua_newuserdata(L, sizeof(*s));
    s->listen_fd = -1;
    s->fd = -1;
    s->closed = 0;

    int fd = socket(AF_INET, SOCK_STREAM, 0);
    int reuse = 1;
	setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, (void *)&reuse, sizeof(int));

	struct sockaddr_in service;
	service.sin_family = AF_INET;
	service.sin_addr.s_addr = inet_addr(addr);
	service.sin_port = htons(port);

    int status = 0;
    status = bind(fd, (const struct sockaddr*)&service, sizeof(service));
    if (status >= 0)
    {
        status = listen(fd, 1);
    }

    if (status < 0)
    {
        close(fd);
        // delete newly created userdata, and return nil to lua
        lua_pop(L, 1);
        lua_pushnil(L);
        return 1;
    }

    s->listen_fd = fd;
    return 1;
}

int lread(lua_State* L)
{
    struct socket* s = lua_touserdata(L, 1);
    if (s->listen_fd < 0)
    {
        return luaL_error(L, "unintialized socket object");
    }

    int fd = _test(s);
    if (fd > 0)
    {
        char buf[BUFFER_SIZE];
        int sz = recv(fd, buf, BUFFER_SIZE, 0);
        if (sz < 0)
        {
            s->closed = 1;
            lua_pushnil(L);
        }
        else
        {
            lua_pushlstring(L, buf, sz);
        }
    }
    else
    {
        lua_pushnil(L);
    }
    return 1;
}

int lwrite(lua_State* L)
{
    struct socket* s = lua_touserdata(L, 1);
    if (s->listen_fd < 0)
    {
        return luaL_error(L, "unintialized socket object");
    }

	size_t sz = 0;
	const char* buffer = luaL_checklstring(L, 2, &sz);
	int p = 0;
    while (1)
    {
		int wt = send(s->fd, buffer + p, sz - p, 0);
		if (wt < 0) {
			switch(errno) {
			case EWOULDBLOCK:
			case EINTR:
				continue;
			default:
				close(s->fd);
				s->fd = -1;
				lua_pushboolean(L, 0);
				return 1;
			}
		}
		if (wt == sz - p)
			break;
		p += wt;
	}

    lua_pushboolean(L, 1);
	return 1;
}

int lclose(lua_State* L)
{
    struct socket* s = lua_touserdata(L, 1);
    if (s->closed)
    {
        close(s->fd);
        s->fd = -1;
        s->closed = 0;
    }
    return 0;
}

static int
lyield(lua_State *L) {
	sleep(0);
	return 0;
}

int
luaopen_lsock(lua_State *L) {
	luaL_checkversion(L);

	luaL_Reg l[] = {
		{ "start", lstart },
		{ "read", lread },
		{ "write", lwrite },
		{ "yield", lyield },
		{ NULL, NULL },
	};

	luaL_newlib(L,l);

	return 1;
}

