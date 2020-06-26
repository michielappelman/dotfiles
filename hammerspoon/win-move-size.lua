step = 40

hs.hotkey.bind(altcmdshift, "h", function()
  local win = hs.window.focusedWindow()
  local s = win:size()

  s.w = s.w - step
  win:setSize(s)
end)

hs.hotkey.bind(altcmdshift, "j", function()
  local win = hs.window.focusedWindow()
  local s = win:size()

  s.h = s.h + step
  win:setSize(s)
end)

hs.hotkey.bind(altcmdshift, "k", function()
  local win = hs.window.focusedWindow()
  local s = win:size()

  s.h = s.h - step
  win:setSize(s)
end)

hs.hotkey.bind(altcmdshift, "l", function()
  local win = hs.window.focusedWindow()
  local s = win:size()

  s.w = s.w + step
  win:setSize(s)
end)

hs.hotkey.bind(altcmd, "k", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y - step
  win:setFrame(f)
end)

hs.hotkey.bind(altcmd, "h", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - step
  win:setFrame(f)
end)

hs.hotkey.bind(altcmd, "l", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x + step
  win:setFrame(f)
end)

hs.hotkey.bind(altcmd, "j", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y + step
  win:setFrame(f)
end)
