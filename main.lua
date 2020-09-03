require(".util")
require(".map")
require(".media")
require(".input")
require(".hero")
require(".physics")

function love.load()
    map = LoadMap("maps\\map1.txt")
    DeltaX, DeltaY = 0, 0
end

function love.update(dt)
    MoveOrPushBox(map, DeltaX, DeltaY)
    if map.victory() then
        error("Aêeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee...")
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

    for i=1, map.sizeY do
        for j=1, map.sizeX do
            if map.grid[i][j] ~= 'H' then
                love.graphics.print(map.grid[i][j], 10+j*15, 10+i*15)
            end
        end
    end

    love.graphics.print("H", 10+map.hero.x*15, 10+map.hero.y*15)
end