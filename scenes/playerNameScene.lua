local utf8 = require("utf8")
PlayerNameScene = {name= "PlayerName"}

local playerName = ""

function PlayerNameScene.Act()
    
end

function love.textinput(text)
    if utf8.len(playerName) < 25 then
        playerName = playerName .. text
    end
end

function PlayerNameScene.Input(key)
    if key == "backspace" then
        local byteoffset = utf8.offset(playerName, -1)
 
        if byteoffset then
            playerName = string.sub(playerName, 1, byteoffset - 1)
        end
    elseif key == "return" then
        Scores.InsertHighScore(playerName, Game.GetMovesCount())
        Game.ShowHighScores()
    end

end

function PlayerNameScene.Draw()
    love.graphics.draw(Images["playerName"], 0, 0, 0, WinWidth/684, WinHeight/400)
    love.graphics.print({Game.GetColor(), playerName}, 382, 200, 0, 2)
end

Game.Scenes["playerName"] = PlayerNameScene