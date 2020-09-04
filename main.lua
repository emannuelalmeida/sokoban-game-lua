require(".util")
require(".map")
require(".media")
require(".input")
require(".hero")
require(".physics")

function love.load()
    love.window.setTitle("Unnamed Sokoban Challenge. Now in Lua!!")
    map = LoadMap("maps\\map1.txt")
    ScaleFactor = 0.7 --Later will be dynamic
    SpriteSize = 24 --Later will be dynamic
    love.window.setMode(map.sizeX*SpriteSize, map.sizeY*SpriteSize)
    Images = LoadAllImages()
    DeltaX, DeltaY = 0, 0
    IsVictory = false

end

function love.update(dt)
    
    if IsVictory then
        love.timer.sleep(10)
        love.event.quit(0)
    end
    
    MoveOrPushBox(map, DeltaX, DeltaY)
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
        love.window.setMode(680, 400)
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