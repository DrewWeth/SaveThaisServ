local rewards = {
	[SKILL_SWORD] = {
		{lvl = 40, items = {{2407, 1}}, storage = 54776} -- bright sword
	},
	[SKILL_CLUB] = {
		{lvl = 40, items = {{2434, 1}}, storage = 54777} -- dragon hammer
	},
	[SKILL_AXE] = {
		{lvl = 40, items = {{2430, 1}}, storage = 54778} -- knight axe
	},
	[SKILL__LEVEL] = {
		{lvl = 20, items = {{2152, 50}}, storage = 54779}, -- 50 plat
		{lvl = 30, items = {{2160, 1}}, storage = 54780}, -- 1 crystal
		{lvl = 40, items = {{2160, 2}}, storage = 54781} -- 2 crystal
	}
}

function onAdvance(cid, skill, oldlevel, newlevel)
	local rewardstr = "Items received: "
	local reward_t = {}
	if rewards[skill] then
		for j = 1, #rewards[skill] do
			local r = rewards[skill][j]
			if not r then
				return true
			end

			if newlevel >= r.lvl then
				if getPlayerStorageValue(cid, r.storage) < 1 then
					setPlayerStorageValue(cid, r.storage, 1)
					for i = 1, #r.items do
						doPlayerAddItem(cid, r.items[i][1], r.items[i][2])
						table.insert(reward_t, getItemNameById(r.items[i][1]))
					end
				end
			end
		end

		if #reward_t > 0 then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, rewardstr .. table.concat(reward_t, ", "))
		end
	end
	return true
end
