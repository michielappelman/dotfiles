-- Hammerspoon config from Michiel
-- https://github.com/michielappelman/dotfiles

altcmd = {"alt", "cmd"}
altcmdshift = {"alt", "cmd", "shift"}
hyper = {"ctrl", "alt", "cmd"}
hypershift = {"ctrl", "alt", "cmd", "shift"}

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

-- Quick Switch
hs.fnutils.each({
  { key = "f", app = "Firefox" },
  { key = "i", app = "iTerm" }
}, function(object)
    hs.hotkey.bind(hyper, object.key, function() hs.application.launchOrFocus(object.app) end) 
end)
