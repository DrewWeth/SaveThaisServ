function onUse(cid, item, fromPosition, itemEx, toPosition)
	local count = {
	"Welcome to Tibia. There have been some changes...",
	"All conjuring spells are 50% normal cost. Example: 'Exevo con' now makes 40 arrows for 60 mana.",
	"Paladins attack damage has been increased by 15%.",
	"Knights defenses have been increased by 25%.",
	"You can buy backpacks of runes from rune sellers (say bp of mf to buy a backpack of manafluid).",
	"For the site for more info. (http://tibiagame.com/).",
	"Visit reddit for discussion. (https://www.reddit.com/r/TibiaGame/)."
	}

	local text = ""
	local t = {}

	local prevLevel = -1
	for i, sentence in ipairs(count) do
		local line = ""
		text = text .. sentence .. "\n\n"
	end
	doShowTextDialog(cid, item.itemid, text)
	return TRUE
end
