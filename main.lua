require(".util")
require(".map")
require(".media")
require(".input")
require(".hero")
require(".physics")

function love.load()
    Moves = 0
    WinHeight = 700
    WinWidth = 1200
    OriginalSpriteSize = 35
    love.window.setTitle("Unnamed Sokoban Challenge. Now in Lua!!")
    map = LoadMap("maps\\map1.txt")
    ScaleFactor, SpriteSize = setMapScaleFactor(map.sizeX, map.sizeY, WinWidth, WinHeight)
    love.window.setMode(1024, 700)
    Images = LoadAllImages()
    DeltaX, DeltaY = 0, 0
    IsVictory = false

end

function setMapScaleFactor()

    local sizeX = map.sizeX * OriginalSpriteSize
    local sizeY = map.sizeY * OriginalSpriteSize

    if (sizeX > WinWidth or sizeY > WinHeight) then
        local scaleX = WinWidth / sizeX
        local scaleY = WinHeight / sizeY

        if (scaleX > scaleY) then
            return scaleY, OriginalSpriteSize * scaleY
        else
            return scaleX, OriginalSpriteSize * scaleX
        end
    else
        return 1, OriginalSpriteSize
    end

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

    if IsVictory then --Veeerrry simple way of doing this. Please remove it next time you touch this.
        love.window.setMode(680, 400) -- Should be changed
        love.graphics.draw(Images["victory"], 0, 0)
    else
        for i=1, map.sizeY do
            for j=1, map.sizeX do
                local cell = map.grid[i][j]
                if cell ~= 'H' and cell ~= ' ' then
                    love.graphics.draw(Images[cell], (j-1)*SpriteSize, (i-1)*SpriteSize, 0, ScaleFactor, ScaleFactor)
                end
            end
        end
    
        love.graphics.draw(Images["hero"], (map.hero.x-1)*SpriteSize, (map.hero.y-1)*SpriteSize, 0, ScaleFactor, ScaleFactor)
    end
    
end