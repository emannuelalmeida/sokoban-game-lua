require(".mapManager")

local gameState = "Start"
local map = {}
local moves = 0
local totalMoves = 0
PlayerName = ""

local function actVictory()
    love.timer.sleep(5)
    GetPlayerName()
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

function ActMenuChoice()
    if MenuPos == 1 then
        StartGame()
    elseif MenuPos == 2 then
        ShowHighScores()
    else
        EndGame()
    end
end

function CheckStateAndAct()

    if gameState == "Start" then
        actStart()
    elseif gameState == "Victory" then
        actVictory()
    elseif gameState == "InGame" then
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

function IsPlayerNameState()
    return gameState == "PlayerName"
end

function StartGame()
    gameState = "InGame"
    if ExistsNextMap() then
        map = GetNextMap()
        SetMapScaleFactor(map)
    else
        WinGame()
    end
end

function UpdateHighScore()
    InsertHighScore(PlayerName, moves)
    ShowHighScores()
end

function ShowHighScores()
    gameState = "HighScore"
end

function WinGame()
    gameState = "Victory"
end

function EndGame()
    SaveHighScores()
    love.event.quit(0)
end

function GetPlayerName()
    gameState = "PlayerName"
end

function RestartGame()
    gameState = "Start"
    moves = 0
    BackToFirstMap()
end
