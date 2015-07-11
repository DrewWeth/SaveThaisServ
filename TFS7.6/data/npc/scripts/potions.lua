local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 		end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg) 			npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink() 					npcHandler:onThink() 				end

function returnVials(cid, message, keywords, parameters, node)
	if(npcHandler.focus ~= cid) then
		return false
	end

	local amount = removePlayerItemsWithCharges(cid, parameters.itemid, parameters.charges)
	if(amount <= 0) then
		npcHandler:say('You do not have any.')
	else
		local price = amount*parameters.cost
		if(doPlayerAddMoney(cid, price) == LUA_NO_ERROR) then
			npcHandler:say('Here are your reward of ' .. price .. ' gold coins. It was a pleasure doing business with you.')
		else
			error('[Error] returnVials:', 'Could not give ' .. price .. ' gold coins to player ' .. getPlayerName(cid))
		end
	end
	npcHandler:resetNpc()
	return true
end

function creatureSayCallback(cid, type, msg)
	if(npcHandler.focus ~= cid) then
		return false
	end
	if msgcontains(msg, 'bp of uh') then
		npcHandler:say('Do you want to buy a backpack of ultimate healing rune for 2500 gold coins?')
		talk_state = 1
	end
	if msgcontains(msg, 'yes') and talk_state == 1 then
		if getPlayerMoney(cid) >= 2500 then
			blue_bp = doPlayerAddItem(cid, 2002, 1)
			for i = 1, 20 do
						doAddContainerItem(blue_bp, 2273, 1)
			end
			doPlayerRemoveMoney(cid, 2500)
			npcHandler:say('Thank you for buying.')
		else
			npcHandler:say('You don\'t have enough money.')
		end
		talk_state = 0
	elseif msgcontains(msg, 'bp of sd') then
		npcHandler:say('Do you want to buy a backpack of sudden death runes for 4500 gold coins?')
		talk_state = 2
	elseif msgcontains(msg, 'yes') and talk_state == 2 then
		if getPlayerMoney(cid) >= 4500 then
			blue_bp = doPlayerAddItem(cid, 2003, 1)
			for i = 1, 20 do
						doAddContainerItem(blue_bp, 2268, 1)
			end
			doPlayerRemoveMoney(cid, 4500)
			npcHandler:say('Thank you for buying.')
		else
			npcHandler:say('You don\'t have enough money.')
		end
		talk_state = 0
	elseif msgcontains(msg, 'bp of mf') then
		npcHandler:say('Do you want to buy a backpack of manafluid for 1100 gold coins?')
		talk_state = 3
	elseif msgcontains(msg, 'yes') and talk_state == 3 then
		if getPlayerMoney(cid) >= 1100 then
			blue_bp = doPlayerAddItem(cid, 2001, 1)
			for i = 1, 20 do
						doAddContainerItem(blue_bp, 2006, 7)
			end
			doPlayerRemoveMoney(cid, 1100)
			npcHandler:say('Thank you for buying.')
		else
			npcHandler:say('You don\'t have enough money.')
		end
		talk_state = 0
	elseif msgcontains(msg, 'bp of mf') then
		npcHandler:say('Do you want to buy a backpack of manafluid for 1100 gold coins?')
		talk_state = 3
	elseif msgcontains(msg, 'yes') and talk_state == 3 then
		if getPlayerMoney(cid) >= 1100 then
			blue_bp = doPlayerAddItem(cid, 2001, 1)
			for i = 1, 20 do
						doAddContainerItem(blue_bp, 2006, 7)
			end
			doPlayerRemoveMoney(cid, 1100)
			npcHandler:say('Thank you for buying.')
		else
			npcHandler:say('You don\'t have enough money.')
		end
		talk_state = 0
	elseif msgcontains(msg, 'bp of gfb') then
		npcHandler:say('Do you want to buy a backpack of great fireball for 3600 gold coins?')
		talk_state = 4
	elseif msgcontains(msg, 'yes') and talk_state == 4 then
		if getPlayerMoney(cid) >= 3600 then
			blue_bp = doPlayerAddItem(cid, 2000, 1)
			for i = 1, 20 do
				doAddContainerItem(blue_bp, 2304, 2)
			end
			doPlayerRemoveMoney(cid, 3600)
			npcHandler:say('Thank you for buying.')
		else
			npcHandler:say('You don\'t have enough money.')
		end
		talk_state = 0
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

keywordHandler:addKeyword({'missile runes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell light magic missile(40gp), heavy magic missile(125gp) and sudden death(325gp) runes.'})
keywordHandler:addKeyword({'explosive runes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell fireball(95gp), great fireball(180gp) and explosion(250gp) runes.'})
keywordHandler:addKeyword({'field runes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell fire field(85gp), energy field(115gp), poison field(65gp) and destroy field(45gp) runes.'})
keywordHandler:addKeyword({'wall runes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell fire wall(245gp), energy wall(340gp) and poison wall(210gp) runes. I also sell magic wall runes for 350gp.'})
keywordHandler:addKeyword({'bomb runes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell fire bomb(210gp), poison bomb(170gp) and energy bomb(325gp) runes.'})
keywordHandler:addKeyword({'healing runes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell antidote(65gp), intense healing(95gp) and ultimate healing(175gp) runes.'})
keywordHandler:addKeyword({'other spell runes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell convince creature(80gp) and chameleon(210gp) runes, but also envenom(130gp), desintegrate(80gp), soulfire(210gp) and paralyze(700gp) runes.'})
keywordHandler:addKeyword({'wands'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell wand of vortex(free), magic lightwand(500gp), dragonbreath(1k), plague(5k), cosmic energy(10k) and inferno(15k).'})
keywordHandler:addKeyword({'rods'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell snakebite(free), moonlight(1k), volcanic(5k), quarmire(10k) and tempest rods(15k).'})
keywordHandler:addKeyword({'fluids'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell mana(55gp) and life(60gp) fluids.'})

shopModule:addBuyableItem({'mana fluid', 'manafluid'}, 	2006, 55, 	7, 	'mana fluid')
shopModule:addBuyableItem({'life fluid', 'lifefluid'}, 	2006, 60, 	10,	'life fluid')

shopModule:addBuyableItem({'blank rune'}, 		2260, 10, 		'blank rune')

shopModule:addBuyableItem({'light magic missile'}, 	2287, 40, 10,		'light magic missile rune')
shopModule:addBuyableItem({'heavy magic missile'}, 	2311, 125, 10,		'heavy magic missile rune')
shopModule:addBuyableItem({'sudden death'}, 		2268, 325, 1, 		'sudden death rune')

shopModule:addBuyableItem({'great fireball'}, 		2304, 180, 2, 		'great fireball rune')
shopModule:addBuyableItem({'fireball'}, 			2302, 95,  5,		'fire ball')
shopModule:addBuyableItem({'explosion'}, 		2313, 250, 6, 		'explosion rune')

shopModule:addBuyableItem({'fire field'}, 		2301, 85,  3,		'fire field rune')
shopModule:addBuyableItem({'energy field'}, 		2277, 115, 3, 		'energy field')
shopModule:addBuyableItem({'poison field',}, 		2285, 65,  3,		'poison field')
shopModule:addBuyableItem({'destroy field'}, 		2261, 45,  3, 		'destroy field')

shopModule:addBuyableItem({'fire wall', 'fw'}, 			2303, 245, 4,		'fire wall rune')
shopModule:addBuyableItem({'energy wall', 'ew'}, 		2279, 340, 4,		'energy wall rune')
shopModule:addBuyableItem({'poison wall', 'pw'}, 		2289, 210, 4,		'poison wall rune')
shopModule:addBuyableItem({'magic wall', 'mw'}, 		2289, 350, 3,		'magic wall rune')

shopModule:addBuyableItem({'fire bomb'}, 			2305, 235, 2,		'fire bomb rune')
shopModule:addBuyableItem({'poison bomb'}, 			2286, 170, 2,		'poison bomb rune')
shopModule:addBuyableItem({'energy bomb'}, 			2262, 325, 2,		'energy bomb rune')

shopModule:addBuyableItem({'antidote'}, 			2266, 65, 1, 		'antidote rune')
shopModule:addBuyableItem({'intense healing', 'ih'}, 		2265, 95, 1,		'intense healing rune')
shopModule:addBuyableItem({'ultimate healing'}, 		2273, 175, 1, 		'ultimate healing rune')

shopModule:addBuyableItem({'convince creature'}, 		2290, 80, 1,		'convince creature rune')
shopModule:addBuyableItem({'chameleon rune'}, 			2291, 210, 1, 		'chameleon rune')
shopModule:addBuyableItem({'soulfire'}, 			2308, 210, 3, 		'soulfire rune')
shopModule:addBuyableItem({'envenom'}, 				2292, 130, 1, 		'envenom rune')
shopModule:addBuyableItem({'paralyze'}, 			2278, 700, 1, 		'paralyze rune')

shopModule:addBuyableItem({'spell book'}, 			2217, 150, 		'spell book')

shopModule:addBuyableItem({'wand of inferno', 'inferno'}, 			2187, 15000, 	'wand of inferno')
shopModule:addBuyableItem({'wand of cosmic energy', 'cosmic energy'}, 		2189, 10000,  	'wand of cosmic energy')
shopModule:addBuyableItem({'wand of plague', 'plague'}, 			2188, 5000, 	'wand of plague')
shopModule:addBuyableItem({'wand of dragonbreath', 'dragonbreath'}, 		2191, 1000, 	'wand of dragonbreath')
shopModule:addBuyableItem({'wand of vortex', 'vortex'}, 			2190, 0, 	'wand of vortex')
shopModule:addBuyableItem({'magic light wand', 'magic lightwand'}, 		2163, 500, 	'magic light wand')

shopModule:addBuyableItem({'tempest rod', 'tempest'}, 				2183, 15000, 	'tempest rod')
shopModule:addBuyableItem({'quagmire rod', 'quagmire'}, 			2181, 10000,  	'quagmire rod')
shopModule:addBuyableItem({'volcanic rod', 'volcanic'}, 			2185, 5000, 	'volcanic rod')
shopModule:addBuyableItem({'moonlight rod', 'moonlight'}, 			2186, 1000, 	'moonlight rod')
shopModule:addBuyableItem({'snakebite rod', 'snakebite'}, 			2182, 0, 	'snakebite rod')

local node = keywordHandler:addKeyword({'flask'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you wish to return all your empty vials for 5 gold coins each?'})
	node:addChildKeyword({'yes'}, returnVials, {itemid = 2006, charges = 0, cost = 5})
	node:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Allright then.'})

local node = keywordHandler:addKeyword({'vial'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you wish to return all your empty vials for 5 gold coins each?'})
	node:addChildKeyword({'yes'}, returnVials, {itemid = 2006, charges = 0, cost = 5})
	node:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Allright then.'})

npcHandler:addModule(FocusModule:new())
