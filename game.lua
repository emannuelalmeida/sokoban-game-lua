local gameState = "Start"
local map = {}
local moves = 0

local function actVictory()
    love.timer.sleep(10)
    EndGame()
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
        WinGame()
    end
end

function CheckStateAndAct()

    if gameState == "Start" then
        actStart()
    elseif gameState == "Victory" then
        actVictory()
    else
        actInGame()
    end

end

function IsStartState()
    return gameState == "Start"
end

function IsVictoryState()
    return gameState == "Victory"
end

function StartGame()
    gameState = "InGame"
    moves = 0
    map = LoadMap("maps\\map1.txt")
    SetMapScaleFactor(map)
end

function WinGame()
    gameState = "Victory"
end

function EndGame() 
    love.event.quit(0)
end

function RestartGame()
    gameState = "Start"
end
