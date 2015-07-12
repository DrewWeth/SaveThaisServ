sword_const = 44000

local rewards = {
	[SKILL_SWORD] = {
		{lvl = 20, advice = "At sword level 40 you will recieve a new weapon. Keep practicing!", storage = 44012},
		{lvl = 30, advice = "Overall, knights' attack damage has been increased by 10%.", storage = sword_const}
	},
	[SKILL__MAGLEVEL] = {
		{lvl = 8, advice = "All conjuring spells are 50% cheaper. Say 'adori blank' to make a blank rune.", storage = 44001}
	},
	[SKILL__LEVEL] = {
		{lvl = 9, advice = "You can now heal yourelf. Say 'exura' to heal!", storage = 44002},
		{lvl = 11, advice = "Say '!spells' to see your available spells.", storage = 44003},
		{lvl = 12, advice = "You will recieve 5k at level 20, 10k at level 30, then 20k at level 40. Good luck hunting!", storage = 44004},
		{lvl = 20, advice = "You can now get promoted by King Tibanus. It costs 20,000 gold and increases your regeneration by 80%.", storage = 44005}
	},
	[SKILL_DISTANCE] = {
		{lvl = 15, advice = "All conjuring spells cost 50% less mana. Say 'execo con' for more arrows.", storage = 44006},
		{lvl = 30, advice = "Overall, paladins' attack damage has been increased by 30%.", storage = 44007}
	},
	[SKILL_SHIELD] = {
		{lvl = 30, advice = "Knights are stronger than normal! Defenses have been increased by 20%. Armor effectiveness increased by 10%.", storage = 44008},
		{lvl = 20, advice = "At shielding level 40, you will recieve a new shield. Keep practicing.", storage = 44009}
	},
	[SKILL_CLUB] = {
		{lvl = 20, advice = "At club level 40 you will recieve a new weapon. Keep practicing!", storage = 440010},
		{lvl = 30, advice = "Overall, knights' attack damage has been increased by 10%.", storage = sword_const}
	},
	[SKILL_AXE] = {
		{lvl = 20, advice = "At axe level 40 you will recieve a new weapon. Keep practicing!", storage = 44011},
		{lvl = 30, advice = "Overall, knights' attack damage has been increased by 10%.", storage = sword_const}
	}
}

-- last storag is 44012

function onAdvance(cid, skill, oldlevel, newlevel)

	if rewards[skill] then
		for j = 1, #rewards[skill] do
			local r = rewards[skill][j]
			if not r then
				return true
			end

			if newlevel >= r.lvl then
				if getPlayerStorageValue(cid, r.storage) < 1 then
					setPlayerStorageValue(cid, r.storage, 1)
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, r.advice)
					return true
				end
			end
		end
	end
	return true
end
