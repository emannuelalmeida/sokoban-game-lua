local scaleFactor, spriteSize, shiftFactorX, shiftFactorY = 0, 0, 0, 0
local originalSpriteSize = 35
local map = {}
local color = {1, 0, 1, 1}

function SetMapScaleFactor(mapObj)

    map = mapObj
    local sizeX = map.sizeX * originalSpriteSize
    local sizeY = map.sizeY * originalSpriteSize

    if (sizeX > WinWidth or sizeY > WinHeight) then
        local scaleX = WinWidth / sizeX
        local scaleY = WinHeight / sizeY

        if (scaleX > scaleY) then

            shiftFactorX = math.abs(sizeX - WinWidth) * scaleY
            shiftFactorY = 0
            scaleFactor = scaleY 
            spriteSize = originalSpriteSize * scaleY
        else

            shiftFactorX = 0
            shiftFactorY = math.abs(sizeY - WinHeight) * scaleX
            scaleFactor = scaleX
            spriteSize = originalSpriteSize * scaleX
        end
    else
        scaleFactor = 1
        spriteSize = originalSpriteSize
    end

end

local function drawGameScreen()
    for i=1, map.sizeY do
        for j=1, map.sizeX do
            local cell = map.grid[i][j]
            if cell ~= 'H' and cell ~= ' ' then
                love.graphics.draw(Images[cell], (j-1)*spriteSize+shiftFactorX, (i-1)*spriteSize+shiftFactorY, 0, scaleFactor, scaleFactor)
            end
        end
    end

    love.graphics.draw(Images["hero"], (map.hero.x-1)*spriteSize+shiftFactorX, (map.hero.y-1)*spriteSize+shiftFactorY, 0, scaleFactor, ScaleFactor)
end

local function drawStartScreen()
    love.graphics.draw(Images["start"], 0, 0, 0, WinWidth/684, WinHeight/400)
end

local function drawVictoryScreen()
    love.graphics.draw(Images["victory"], 0, 0, 0, WinWidth/684, WinHeight/400)
end

local function drawHighScoreScreen()
    love.graphics.draw(Images["highscore"], 0, 0, 0, WinWidth/684, WinHeight/400)
    local scores = GetHighScores()

    for i=1, #scores do
        love.graphics.print({color, scores[i]["player"]}, 40, 80+20*i, 0, 2)
        love.graphics.print({color, scores[i]["time"]}, 382, 80+20*i, 0, 2)
    end
end

function DrawScreen()
    if IsStartState()  then
        drawStartScreen()
    elseif IsVictoryState() then
        drawVictoryScreen()
    elseif IsHighScoreState() then
        drawHighScoreScreen()
    else
        drawGameScreen()
    end
end