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
