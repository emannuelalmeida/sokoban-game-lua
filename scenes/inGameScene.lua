require(".physics")
require(".mapper")
require(".graphics")

InGameScene = {name= "InGame"}

local moves = 0
local totalMoves = 0
local deltaX, deltaY = 0, 0

function love.keyreleased(key, scancode)
    deltaX, deltaY = 0, 0
    Physics.ReleaseCooldown()
end

local function resumeOrFinishGame()
    if Mapper.ExistsNextMap() then
        Mapper.UpdateNextMap()
        Graphics.AdjustMapToScreen(Mapper.GetCurrentMap())
    else
        Game.UpdateMoveCount(moves)
        Game.FinishGame()
    end
end

function InGameScene.Act()
    Mapper.SetFirstMapIfEmpty()
    if Physics.MoveOrPushBox(Mapper.GetCurrentMap(), deltaX, deltaY) then
        moves = moves+1
        love.window.setTitle("Unnamed Sokoban Challenge. " .. moves .. " Moves.")
    end
    if Mapper.isVictoryState() then
        totalMoves = totalMoves + moves
        resumeOrFinishGame()
    end
end

local function processPositionDelta(key)
    local dX = 0
    local dY = 0

    if key == "up" then
        dY = -1
    elseif key == "down" then
        dY = 1
    elseif key == "left" then
        dX = -1
    elseif key == "right" then
        dX = 1
    end

    return dX, dY
end

function InGameScene.Input(key)
    deltaX, deltaY = processPositionDelta(key)
end

function InGameScene.Draw()
    -- Separated from the function for complexity reasons
    Graphics.DrawGameScreen(Mapper.GetCurrentMap())
end

Game.Scenes["inGame"] = InGameScene