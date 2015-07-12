function onLogin(cid)
	registerCreatureEvent(cid, "PlayerDeath")
	registerCreatureEvent(cid, "FullOnLevel")
	registerCreatureEvent(cid, "onadvance_reward")
	registerCreatureEvent(cid, "onadvance_advice")
	return TRUE
end
