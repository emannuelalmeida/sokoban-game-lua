require(".mapManager")

local gameState = "Start"
local map = {}
local moves = 0
local totalMoves = 0

local function actVictory()
    love.timer.sleep(5)
    ShowHighScores()
end

local function actStart()
    love.window.setTitle("Unnamed Sokoban Challenge. Now in Lua!!")
end

local function actInGame()
    if MoveOrPushBox(map, DeltaX, DeltaY) then
        moves = moves+1
        love.window.setTitle("Unnamed Sokoban Challenge. " .. moves .. " Moves.")
    end
    if map.victory() then
        totalMoves = totalMoves + moves
        StartGame()
    end
end

local function actHighScore()
    love.timer.sleep(10)
    RestartGame()
end

function CheckStateAndAct()

    if gameState == "Start" then
        actStart()
    elseif gameState == "Victory" then
        actVictory()
    elseif gameState == "HighScore" then
        actHighScore()
    else
        actInGame()
    end

end

function IsStartState()
    return gameState == "Start"
end

function IsHighScoreState()
    return gameState == "HighScore"
end

function IsVictoryState()
    return gameState == "Victory"
end

function StartGame()
    gameState = "InGame"
    moves = 0
    if ExistsNextMap() then
        map = GetNextMap()
        SetMapScaleFactor(map)
    else
        WinGame()
    end
end

function ShowHighScores()
    gameState = "HighScore"
end

function WinGame()
    gameState = "Victory"
end

function EndGame()
    love.event.quit(0)
end

function RestartGame()
    gameState = "Start"
    BackToFirstMap()
end
