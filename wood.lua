
-- redwood trunk
minetest.register_node("redwood:redwood_trunk", {
	description = "Redwood Trunk",
	tiles = {
		"redwood_trunk_top.png",
		"redwood_trunk_top.png",
		"redwood_trunk.png"
	},
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})

-- redwood wood
minetest.register_node("redwood:redwood_wood", {
	description = "Redwood Wood",
	tiles = {"redwood_wood.png"},
	is_ground_content = false,
	groups = {wood = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "redwood:redwood_wood 4",
	recipe = {{"redwood:redwood_trunk"}},
})
