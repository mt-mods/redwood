local add_schem = function(a, b, c, d, e, f, g)

	if g ~= 1 then return end

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = a,
		sidelen = 80,
		fill_ratio = b,
		biomes = c,
		y_min = d,
		y_max = e,
		schematic = f,
		flags = "place_center_x, place_center_z"
	})
end

-- redwood tree
add_schem({"default:dirt_with_dry_grass"}, 0.0025, {"biome-TODO"}, 1, 100, redwood.redwood_tree)
