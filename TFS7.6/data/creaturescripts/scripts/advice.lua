function onAdvance(cid, skill, oldlevel, newlevel)
  array = {"Test message."}
  if skill == SKILL__LEVEL then
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_GREEN, "Test Message!!!")
  end
  return true
end
