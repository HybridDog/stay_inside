local players = {}
local timer = 0

minetest.register_globalstep(function(dtime)
	timer = timer + dtime
	if timer >= 2 then
		timer = 0
		for _,p in pairs(minetest.get_connected_players()) do
			local name = p:get_player_name()
			local pos = p:getpos()
			if math.abs(pos.x) <= 32000
			and math.abs(pos.y) <= 32000
			and math.abs(pos.z) <= 32000 then
				players[name] = pos
			else
				local pos2 = players[name] or {x=0, y=20, z=0}
				p:setpos(pos2)
				minetest.chat_send_player(name, "You were too far away.")
			end
		end
	end
end)
