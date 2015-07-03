nether.config = Settings(minetest.get_worldpath().."/nether.conf")

local conf_table = nether.config:to_table()

local defaults = {
	start_depth = "-5000",
	enable_portal = "true"
}

for k, v in pairs(defaults) do
	if conf_table[k] == nil then
		nether.config:set(k, v)
	end
end

nether.config:write()