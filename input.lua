local utf8 = require("utf8")
CoolDown = false

local function processMenuInput(key)
    if key == "up" then
        Sounds["menu"]:play()
        MenuPos = MenuPos - 1
    elseif key == "down" then
        Sounds["menu"]:play()
        MenuPos = MenuPos + 1
    elseif key == "return" then
        Sounds["confirma"]:play()
        ActMenuChoice()
    end

    if MenuPos < 1 then MenuPos = #MenuOptions end
    if MenuPos > #MenuOptions then MenuPos = 1 end
end

function love.textinput(text)
    if IsPlayerNameState() and utf8.len(PlayerName) < 25 then
        PlayerName = PlayerName .. text
    end
end

function ProcessControlInput(key)
    if key == "q" and not IsPlayerNameState() then
        EndGame()
    elseif key == "r" and not IsPlayerNameState() then
        RestartGame()
    end

    if IsStartState() then
        processMenuInput(key)
    end

    if IsHighScoreState() then
        if key == "space" then
            RestartGame()
        end
    end

    if IsPlayerNameState() then
        if key == "backspace" then
            local byteoffset = utf8.offset(PlayerName, -1)
     
            if byteoffset then
                PlayerName = string.sub(PlayerName, 1, byteoffset - 1)
            end
        elseif key == "return" then
            UpdateHighScore()
        end
    end

end

function ProcessPositionDelta(key)
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
