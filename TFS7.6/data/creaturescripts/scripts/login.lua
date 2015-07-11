function onLogin(cid)
	registerCreatureEvent(cid, "PlayerDeath")
	registerCreatureEvent(cid, "FullOnLevel")
	registerCreatureEvent(cid, "Advice")
	return TRUE
end
