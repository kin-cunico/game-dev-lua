function love.conf(t) -- t is a variable that holds the table of all the configuration options

    -- game settings and version
    t.identity = "data/saves" -- The name of the save directory (string)
    t.version = "11.4" -- The LÖVE version this game was made for (string)
    t.gameversion = "1.0.0" -- The version of the game (string)

    -- device settings
    t.externalstorage = true -- True to save files (and read from the save directory) in external storage on Android (boolean)
    t.gammacorrect = true -- Enable gamma-correct rendering, when supported by the system (boolean)
    t.console = true
    t.audio.mic = true -- Request and use microphone capabilities in Android (boolean)
    
    -- window settings
    t.window.width = 800
    t.window.height = 600
    t.window.title = "First try at Love2D"
    -- t.window.icon = "icon/icon.png"
    t.window.display = 1
    
end