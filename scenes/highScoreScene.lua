HighScoreScene = {name= "HighScore"}

function HighScoreScene.Act()
    
end

function HighScoreScene.Input(key)
    if key == "space" then
        Game.RestartGame()
    end
end

function HighScoreScene.Draw()
    love.graphics.draw(Images["highscore"], 0, 0, 0, WinWidth/684, WinHeight/400)
    local scores = GetHighScores()

    for i=1, #scores do
        love.graphics.print({Game.GetColor(), scores[i]["player"]}, 40, 80+20*i, 0, 2)
        love.graphics.print({Game.GetColor(), scores[i]["time"]}, 382, 80+20*i, 0, 2)
    end
end

Game.Scenes["highScore"] = HighScoreScene