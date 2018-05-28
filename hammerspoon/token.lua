-- Generate and input a token using the SofToken app and type it in. Because the output of the 
-- wrapper script includes a new-line character, it will also automatically enter the token.
--
-- The PIN for the token itself needs to be present in 'pin.txt' in the .hammerspoon dir (or
-- wherever you're running the Lua script.
--
-- Written by Michiel Appelman <michiel@appelman.se>

function getToken()
    t = hs.task.new('/Users/mappelma/.pyenv/shims/mobilepasser', pasteToken, {'-c', '/Users/mappelma/Documents/sources/MobilePASSER/mobilepasser.cfg'})
    t:start()
end

function pasteToken(code, out, err)
    hs.eventtap.keyStrokes(out)
end

hs.hotkey.bind(hyper, "t", getToken)
