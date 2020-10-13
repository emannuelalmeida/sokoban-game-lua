require(".util")
require(".map")
require(".media")
require(".input")
require(".hero")
require(".physics")
require(".screen")

function love.load()
    Moves = 0
    WinHeight = 700
    WinWidth = 1200
    OriginalSpriteSize = 35
    love.window.setTitle("Unnamed Sokoban Challenge. Now in Lua!!")
    map = LoadMap("maps\\map1.txt")
    ScaleFactor, SpriteSize, ShiftFactorX, ShiftFactorY = SetMapScaleFactor(map.sizeX, map.sizeY, WinWidth, WinHeight)
    love.window.setMode(WinWidth, WinHeight)
    Images = LoadAllImages()
    DeltaX, DeltaY = 0, 0
    IsVictory = false

end

function love.update(dt)
    
    if IsVictory then
        love.timer.sleep(10)
        love.event.quit(0)
    end
    
    if MoveOrPushBox(map, DeltaX, DeltaY) then
        Moves = Moves+1
        love.window.setTitle("Unnamed Sokoban Challenge. " .. Moves .. " Moves.")
    end
    if map.victory() then
        IsVictory = true
    end
end

function love.keypressed(key, unicode, isRepeat)
    DeltaX, DeltaY = ProcessPositionDelta(key)
end

function love.keyreleased(key, scancode)
    DeltaX, DeltaY = 0, 0
    CoolDown = false
end

function love.draw()

    if IsVictory then --Veeerrry simple way of doing this. Please remove it next time you touch this.s
        love.graphics.draw(Images["victory"], 0, 0, 0, WinWidth/684, WinHeight/400)
    else
        DrawGameScreen()
    end
    
end