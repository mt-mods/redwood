
-- Register Saplings
local register_sapling = function(name, desc, texture, height)

	minetest.register_node("redwood:redwood_sapling", {
		description = desc .. " Tree Sapling",
		drawtype = "plantlike",
		tiles = {texture .. ".png"},
		inventory_image = texture .. ".png",
		wield_image = texture .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = false,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {
			snappy = 2, dig_immediate = 3, flammable = 2,
			attached_node = 1, sapling = 1
		},
		sounds = default.node_sound_leaves_defaults(),
		grown_height = height,
	})

	minetest.register_node("redwood:redwood_sapling_ongen", {
		description = desc .. " Tree Sapling (ongen)",
		drawtype = "plantlike",
		tiles = {texture .. ".png"},
		inventory_image = texture .. ".png",
		wield_image = texture .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = false,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {
			snappy = 2, dig_immediate = 3, flammable = 2,
			attached_node = 1, sapling = 1
		},
		sounds = default.node_sound_leaves_defaults(),
		grown_height = height,
	})

end

register_sapling("redwood:redwood", "Redwood", "redwood_sapling", 31)


local add_tree = function (pos, ofx, ofy, ofz, schem, replace)
	-- check for schematic
	if not schem then
		print ("Schematic not found")
		return
	end
	-- remove sapling and place schematic
	minetest.swap_node(pos, {name = "air"})
	minetest.place_schematic(
		{x = pos.x - ofx, y = pos.y - ofy, z = pos.z - ofz},
		schem, 0, replace, false)
end

function redwood.grow_redwood_tree(pos)
	add_tree(pos, 7, 0, 7, redwood.redwood_tree)
end

-- check if sapling has enough height room to grow
local enough_height = function(pos, height)

	local nod = minetest.line_of_sight(
		{x = pos.x, y = pos.y + 1, z = pos.z},
		{x = pos.x, y = pos.y + height, z = pos.z})

	if not nod then
		return false -- obstructed
	else
		return true -- can grow
	end
end

local grow_sapling = function(pos, node)

	local under =  minetest.get_node({
		x = pos.x,
		y = pos.y - 1,
		z = pos.z
	}).name

	if not minetest.registered_nodes[node.name] then
		return
	end

	local height = minetest.registered_nodes[node.name].grown_height

	-- do we have enough height to grow sapling into tree?
	if not height or not enough_height(pos, height) then
		return
	end

	if under == "default:dirt_with_dry_grass" then
		redwood.grow_redwood_tree(pos)
	end


end

-- Grow saplings
minetest.register_abm({
	label = "redwood grow sapling",
	nodenames = {"redwood:redwood_sapling"},
	interval = 10,
	chance = 50,
	catch_up = false,
	action = function(pos, node)

		local light_level = minetest.get_node_light(pos) or 0

		if light_level < 13 then
			return
		end

		grow_sapling(pos, node)
	end,
})

-- Grow saplings
minetest.register_abm({
	label = "redwood grow sapling",
	nodenames = {"redwood:redwood_sapling_ongen"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)

		local light_level = minetest.get_node_light(pos) or 0

		if light_level < 13 then
			return
		end

		grow_sapling(pos, node)
	end,
})
