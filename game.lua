Game = {}

Game.Scenes = {}
require("scenes.highScoreScene")
require("scenes.inGameScene")
require("scenes.victoryScene")
require("scenes.menuScene")
require("scenes.playerNameScene")

local movesCount = 0
local scene = "menu"
local color = {1, 0, 1, 1}

function Game.GetColor()
    return color
end

function Game.ActCurrentScene()
    Game.Scenes[scene].Act()
end

function Game.DrawCurrentScene()
    Game.Scenes[scene].Draw()
end

function Game.ProcessInputCurrentScene(key)
    Game.Scenes[scene].Input(key)
end

function Game.CurrentScene()
    return scene
end

function Game.UpdateMoveCount(moves)
    movesCount = moves
end

function Game.GetMovesCount()
    return movesCount
end

function Game.ShowHighScores()
    scene = "highScore"
end

function Game.FinishGame()
    scene = "victory"
end

function Game.EndGame()
    Scores.SaveHighScores()
    love.event.quit(0)
end

function Game.GetPlayerName()
    scene = "playerName"
end

function Game.StartGame()
    scene = "inGame"
end

function Game.RestartGame()
    scene = "menu"
end

return Game