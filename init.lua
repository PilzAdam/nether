nether = {
	mod_path = minetest.get_modpath(minetest.get_current_modname()),
	config = nil,
}

dofile(nether.mod_path.."/config.lua")
dofile(nether.mod_path.."/nodes.lua")
if nether.config:get_bool("enable_portal") == true then
	dofile(nether.mod_path.."/portal.lua")
end

local function nether_replace(old, new)
	for i=1,8 do
		minetest.register_ore({
			ore_type       = "scatter",
			ore            = new,
			wherein        = old,
			clust_scarcity = 1,
			clust_num_ores = 1,
			clust_size     = 1,
			height_min     = -31000,
			height_max     = tonumber(nether.config:get("start_depth")) or -5000,
		})
	end
end

nether_replace("default:stone", "nether:rack")
nether_replace("default:stone_with_coal", "air")
nether_replace("default:stone_with_iron", "air")
nether_replace("default:stone_with_mese", "default:lava_source")
nether_replace("default:stone_with_diamond", "default:lava_source")
nether_replace("default:stone_with_gold", "nether:glowstone")
nether_replace("default:stone_with_copper", "nether:sand")
nether_replace("default:gravel", "nether:sand")
nether_replace("default:dirt", "nether:sand")
nether_replace("default:sand", "nether:sand")
nether_replace("default:cobble", "nether:brick")
nether_replace("default:mossycobble", "nether:brick")
nether_replace("stairs:stair_cobble", "nether:brick")