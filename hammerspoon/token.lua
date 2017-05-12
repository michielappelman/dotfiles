-- Generate and input a token using the SofToken app and type it in. Because the output of the 
-- wrapper script includes a new-line character, it will also automatically enter the token.
--
-- The PIN for the token itself needs to be present in 'pin.txt' in the .hammerspoon dir (or
-- wherever you're running the Lua script.
--
-- Written by Michiel Appelman <michiel@appelman.se>

function getPIN()
    local file = io.open("pin.txt", 'rb')
    if not file then return nil end
    local content = file:read "*a"
    file:close()
    return content
end

function getToken()
    t = hs.task.new('/Applications/SofToken II.app/Contents/Resources/st-wrap.sh', pasteToken, {'-p'})
    pin = getPIN()
    if not pin then
        hs.notify.new({title="Hammerspoon", informativeText="No PIN file found!"}):send()
        t = nil
    else
        t:setInput(pin)
        t:start()
    end
end

function pasteToken(code, out, err)
    hs.eventtap.keyStrokes(out)
end

hs.hotkey.bind(hyper, "t", getToken)
