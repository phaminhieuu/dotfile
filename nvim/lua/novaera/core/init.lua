require("novaera.core.base")
require("novaera.core.maps")
require("novaera.core.windows")
require("novaera.core.maps")
require("novaera.core.maps")

local has = function(x)
	return vim.fn.has(x) == 1
end

local is_mac = has("macunix")
local is_win = has("win32")

if is_mac then
	require("novaera.core.macos")
end
if is_win then
	require("novaera.core.windows")
end
