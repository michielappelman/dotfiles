-- Hammerspoon config from Michiel
-- https://github.com/michielappelman/dotfiles

altcmd = {"alt", "cmd"}
altcmdshift = {"alt", "cmd", "shift"}
hyper = {"ctrl", "alt", "cmd"}
hypershift = {"ctrl", "alt", "cmd", "shift"}

hs.loadSpoon('ControlEscape'):start()

hs.loadSpoon("ClipboardTool")
spoon.ClipboardTool.show_in_menubar = false
spoon.ClipboardTool.paste_on_select = true
spoon.ClipboardTool.show_copied_alert = false
spoon.ClipboardTool:bindHotkeys({toggle_clipboard = {hyper, "v"}})
spoon.ClipboardTool:start()

require('watcher')
require('position')
require('win-move-size')
require('audio')
require('webex-mute')

-- Set volume to zero when at Cisco.
wifiWatcher = nil
function ssidChangedCallback()
    newSSID = hs.wifi.currentNetwork()
    if newSSID ~= "blizzard" then
        hs.audiodevice.defaultOutputDevice():setVolume(0)
    end
end
wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()

-- Quick Open
hs.hotkey.bind(hyper, "f", function() hs.application.get("Finder"):selectMenuItem("New Finder Window") end)

-- Quick Switch
hs.fnutils.each({
  { key = "i", app = "iTerm" }
}, function(object)
    hs.hotkey.bind(hyper, object.key, function() hs.application.launchOrFocus(object.app) end) 
end)
