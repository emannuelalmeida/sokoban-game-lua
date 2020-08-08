require(".util")
require(".map")
require(".media")
require(".input")
require(".hero")

--Start of the game
function love.load()
    map = loadMap("maps\\map1.txt")
end

-- Proccess the inputs and the events. Actually don't know what to with the dt. Am I rusty or something like it?
function love.update(dt)
    --For now only the simple logic will be added. Later I'll add more stuff as screens.
    deltaX, deltaY = ProcessPositionDelta()
end
 
-- Draw the map or the event
function love.draw()
    if (map.victory()) then
        --Victory screen here, then wait a little bit and then wait to see if there's another map.
    else
        --Normal drawing of map here. Take the other screen to get it
        love.graphics.print(deltaX, 30, 200)
        love.graphics.print(deltaY, 30, 200)
    end
end