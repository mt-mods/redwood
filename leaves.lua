
local leaftype = "plantlike"

-- redwood leaves
minetest.register_node("redwood:redwood_leaves", {
	description = "Redwood Leaves",
	drawtype = leaftype,
	visual_scale = 1.4,
	tiles = {"redwood_leaves.png"},
	inventory_image = "redwood_leaves.png",
	wield_image = "redwood_leaves.png",
	paramtype = "light",
	walkable = false,
	waving = 1,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"redwood:redwood_sapling"}, rarity = 50},
			{items = {"redwood:redwood_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

default.register_leafdecay({
	trunks = {"redwood:redwood_trunk"},
	leaves = {"redwood:redwood_leaves"},
	radius = 3
})
