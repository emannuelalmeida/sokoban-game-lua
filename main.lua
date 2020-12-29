require(".util")
require(".map")
require(".media")
require(".input")
require(".hero")
require(".physics")
require(".screen")
require(".game")
require(".scores")
require(".menu")

function love.load()
    WinHeight = 700
    WinWidth = 1200
    love.window.setMode(WinWidth, WinHeight)
    DeltaX, DeltaY = 0, 0

end

function love.update(dt)
    CheckStateAndAct()
end

function love.keypressed(key, unicode, isRepeat)

    ProcessControlInput(key)
    DeltaX, DeltaY = ProcessPositionDelta(key)

end

function love.keyreleased(key, scancode)
    DeltaX, DeltaY = 0, 0
    CoolDown = false
end

function love.draw()
    DrawScreen()
end