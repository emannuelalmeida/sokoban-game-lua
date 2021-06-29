local scaleFactor, spriteSize, shiftFactorX, shiftFactorY = 1, 0, 0, 0
local spriteSize = 35
local map = {}
local color = {1, 0, 1, 1}

function AdjustMapToScreen(mapObj)

    map = mapObj
    local sizeX = map.sizeX * spriteSize
    local sizeY = map.sizeY * spriteSize

    if (sizeX < WinWidth) then
        shiftFactorX = math.abs(sizeX - WinWidth)/2
    else
        shiftFactorX = 0
    end

    if (sizeY < WinHeight) then
        shiftFactorY = math.abs(sizeY - WinHeight)/2
    else
        shiftFactorY = 0
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

    love.graphics.draw(Images["hero"], (map.hero.x-1)*spriteSize+shiftFactorX, (map.hero.y-1)*spriteSize+shiftFactorY, 0, scaleFactor, scaleFactor)
end

local function drawStartScreen()
    love.graphics.draw(Images["start"], 0, 0, 0, WinWidth/684, WinHeight/400)

    local menuColor = {}
    for i=1, #MenuOptions do
        if i == MenuPos then
            menuColor = {1, 0, 0, 1}
        else
            menuColor = {1, 1, 1, 1}
        end
        love.graphics.print({menuColor, MenuOptions[i]}, 500, 350+30*i, 0, 2)
    end
end

local function drawVictoryScreen()
    love.graphics.draw(Images["victory"], 0, 0, 0, WinWidth/684, WinHeight/400)
end

local function drawPlayerNameScreen()
    love.graphics.draw(Images["playerName"], 0, 0, 0, WinWidth/684, WinHeight/400)
    love.graphics.print({color, PlayerName}, 382, 200, 0, 2)
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
    if IsStartState() then
        drawStartScreen()
    elseif IsVictoryState() then
        drawVictoryScreen()
    elseif IsHighScoreState() then
        drawHighScoreScreen()
    elseif IsPlayerNameState() then
        drawPlayerNameScreen()
    else
        drawGameScreen()
    end
end