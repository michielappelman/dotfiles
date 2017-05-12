-- Hammerspoon config from Michiel
-- https://github.com/michielappelman/dotfiles

altcmd = {"alt", "cmd"}
hyper = {"ctrl", "alt", "cmd"}
hypershift = {"ctrl", "alt", "cmd", "shift"}

require('watcher')
require('position')
require('token')

-- Defeate Paste Blocking
-- http://www.hammerspoon.org/go/
hs.hotkey.bind({"cmd", "alt"}, "V", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)

-- Set volume to mute when not at home.
wifiWatcher = nil
function ssidChangedCallback()
    newSSID = hs.wifi.currentNetwork()
    -- Cisco Network Settings
    if newSSID ~= "blizzard" then
        hs.audiodevice.defaultOutputDevice():setVolume(0)
    -- Home Network Settings
    elseif newSSID ~= "Chapter 2" then
        hs.audiodevice.defaultOutputDevice():setVolume(0)
    end
end
wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()

-- Quick Switch
hs.fnutils.each({
  { key = "c", app = "Google Chrome" },
  { key = "e", app = "Evernote" },
  { key = "m", app = "Mail" },
  { key = "i", app = "iTerm" }
}, function(object)
    hs.hotkey.bind(hyper, object.key, function() hs.application.launchOrFocus(object.app) end) 
end)
