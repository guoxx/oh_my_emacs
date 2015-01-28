local csock = require "lsock"

local mode_probe = 1 -- little performance impact, 
local mode_cr = 2    -- call/return hook
local mode_line = 3  -- line hook, slowest mode

local debugger = {}
local debug_mode = mode_probe

-- socket connection variable
local socks_fd = nil
local socks_buffer = ""

local function split()
	local b,e = string.find(socks_buffer, "\n", 1, true)
	if b then
		local b = string.find(socks_buffer, "\r", -b, true) or b
		local ret = string.sub(socks_buffer,1,b-1)
		socks_buffer = string.sub(socks_buffer, e+1)
		return ret
	end
end

function readline()
	local ret = split()
	if ret then
		return ret
	end
	local data = csock.read(socks_fd)
	if data then
		socks_buffer = socks_buffer .. data
		return split()
	end

	return data
end

function debugger.start(ip, port)
	local ip = ip or "0.0.0.0"
	local port = port or 6789
	socks_fd = csock.start(ip , port)
end

function debugger.probe()
    if debug_mode == mode_probe then
        local cmd = socks_fd
    else
        
    end
end

return debugger
