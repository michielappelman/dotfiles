-- --------------------------------------
-- Watcher to load the configuration in case of changes
-- --------------------------------------
function reload_config(files)
    hs.reload()
    hs.notify.new({title="Hammerspoon", informativeText="Config reloaded"}):send()
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()
