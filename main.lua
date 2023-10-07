require(".util")
require(".media")
require(".game")
require(".scores")
require(".pack")

function love.load()
    WinHeight = 700
    WinWidth = 1200
    love.window.setMode(WinWidth, WinHeight)
end

function love.update(dt)
    Game.ActCurrentScene()
end

function love.keypressed(key, unicode, isRepeat)
    Game.ProcessInputCurrentScene(key)
end

function love.draw()
    Game.DrawCurrentScene()
end