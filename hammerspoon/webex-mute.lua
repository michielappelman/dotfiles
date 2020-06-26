-- Adapted from the Toggle Skype Mute Spoon
-- http://www.hammerspoon.org/Spoons/ToggleSkypeMute.html
-- by Michiel Appelman (michiel@appelman.se)

hs.hotkey.bind(hyper, "m", function ()
   local notifications = true
   local webex = hs.application.find("com.webex.meetingmanager")
   local icon = hs.image.imageFromAppBundle("com.webex.meetingmanager")
   if not webex then
      return
   end

   local lastapp = nil
   if not webex:isFrontmost() then
      lastapp = hs.application.frontmostApplication()
      webex:activate()
   end

   local mutepath = {"Participant", "Mute Me"}
   local unmutepath = {"Participant", "Unmute Me"}
   local muteitem = webex:findMenuItem(mutepath)
   if muteitem and muteitem.enabled and webex:selectMenuItem(mutepath) then
      if notifications then
         hs.notify.new({title="Webex", informativeText="You're muted",setIdImage=icon}):send()
      end
   elseif webex:selectMenuItem(unmutepath) then
      if notifications then
         hs.notify.new({title="Webex", informativeText="You're unmuted",setIdImage=icon}):send()
      end
   else
      if notifications then
         hs.notify.new({title="Webex", informativeText="No active Webex Meeting",setIdImage=icon}):send()
      end
   end

   if lastapp then
      lastapp:activate()
   end
end)