MenuScene = {name= "Menu"}

local menuPos = 1
local menuOptions = {"Start Game", "HighScores", "Quit Game"}

function MenuScene.Act()
    love.window.setTitle("Unnamed Sokoban Challenge. Now in Lua!!")
end

local function menuChoice()
    if menuPos == 1 then
        Game.StartGame()
    elseif menuPos == 2 then
        Game.ShowHighScores()
    else
        Game.EndGame()
    end
end

function MenuScene.Input(key)
    if key == "up" then
        Sounds["menu"]:play()
        menuPos = menuPos - 1
    elseif key == "down" then
        Sounds["menu"]:play()
        menuPos = menuPos + 1
    elseif key == "return" then
        Sounds["confirma"]:play()
        menuChoice()
    end

    if menuPos < 1 then menuPos = #menuOptions end
    if menuPos > #menuOptions then menuPos = 1 end
end

function MenuScene.Draw()
    love.graphics.draw(Images["start"], 0, 0, 0, WinWidth/684, WinHeight/400)

    local menuColor = {}
    for i=1, #menuOptions do
        if i == menuPos then
            menuColor = {1, 0, 0, 1}
        else
            menuColor = {1, 1, 1, 1}
        end
        love.graphics.print({menuColor, menuOptions[i]}, 500, 350+30*i, 0, 2)
    end
end

Game.Scenes["menu"] = MenuScene