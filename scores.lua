local highScores = {}

local function sortHighScores()
    local function scoreFunc(score1, score2)
        if tonumber(score1["time"]) < tonumber(score2["time"]) then
            return true
        else
            return false
        end
    end
    
    table.sort(highScores, scoreFunc)

end

local function loadHighScores()
    highScores = {}
    local file = io.open("scores.dat", "r")
    if (not file) then
        return {}
    end

    local highScoreList = Split(file:read("*a"), "\n")
    
    for i=1, #highScoreList do
        local score = Split(highScoreList[i], ",")
        local scoreTb = {}
        scoreTb["player"] = score[1]
        scoreTb["time"] = score[2]
        table.insert(highScores, scoreTb)
    end

    sortHighScores()
end

function SaveHighScores()
    local file = io.open("scores.dat", "w")

    if not file then
        error("Error trying to write highscores file.")
    end

    io.output(file)

    for i=1, #highScores do
        local scoreLine = highScores[i]["player"] .. ", " .. highScores[i]["time"] .. "\n"
        io.write(scoreLine)
    end

    io.close()

end

function GetHighScores()
    return highScores
end

function InsertHighScore(name, time)
    local newScore = {}
    newScore["player"] = name
    newScore["time"] = time
    table.insert(highScores, newScore)
    sortHighScores()
end

loadHighScores()