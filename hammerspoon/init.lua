-- Hammerspoon config from Michiel
-- https://github.com/michielappelman/dotfiles

hyper = {"ctrl", "alt", "cmd"}

-- Quick bindings
hs.hotkey.bind(hyper, "f", function() hs.application.get("Finder"):selectMenuItem("New Finder Window") end)
hs.hotkey.bind(hyper, "r", function() reload_config() end) 

-- Watcher to load the configuration in case of changes
function reload_config(files)
    hs.reload()
    hs.notify.new({title="Hammerspoon", informativeText="Config reloaded"}):send()
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()

-- Change Audio Output device
hs.hotkey.bind(hyper, "a", function ()
    for i,dev in ipairs(hs.audiodevice.allOutputDevices()) do
       if dev:uid() == hs.audiodevice.defaultOutputDevice():uid() then
        next_dev = hs.audiodevice.allOutputDevices()[i+1]
        if next_dev == nil then
            next_dev = hs.audiodevice.allOutputDevices()[1]
        end
        switched = next_dev:setDefaultOutputDevice()
        if switched then
            hs.alert.show(next_dev:name())
            break
        end
       end
    end
end)
