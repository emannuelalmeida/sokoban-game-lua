VictoryScene = {name= "Victory"}

function VictoryScene.Act()
    love.timer.sleep(5)
    Game.GetPlayerName()
end

function VictoryScene.Input(key)
    -- Do nothing, just wait...
end

function VictoryScene.Draw()
    love.graphics.draw(Images["victory"], 0, 0, 0, WinWidth/684, WinHeight/400)
end

Game.Scenes["victory"] = VictoryScene