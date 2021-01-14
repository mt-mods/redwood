
redwood = {}

local MP = minetest.get_modpath("redwood")

dofile(MP.."/schematic.lua")
dofile(MP.."/sapling.lua")
dofile(MP.."/wood.lua")
dofile(MP.."/leaves.lua")
dofile(MP.."/mapgen.lua")

if minetest.get_modpath("moreblocks") then
	dofile(MP.."/stairs.lua")
end

if minetest.get_modpath("bonemeal") then
  dofile(MP.."/bonemeal.lua")
end
