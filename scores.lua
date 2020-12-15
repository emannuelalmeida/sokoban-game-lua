local highScores = {}

local function sortHighScores(scores)
    function scoreFunc(score1, score2) 
        if tonumber(score1["time"]) < tonumber(score2["time"]) then
            return true
        else
            return false
        end
    end
    
    table.sort(scores, scoreFunc)

    return scores
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
        scoreTb = {}
        scoreTb["player"] = score[1]
        scoreTb["time"] = score[2]
        table.insert(highScores, scoreTb)
    end
    
    return sortHighScores(highScores)
end

function GetHighScores()
    return highScores
end

highScores = loadHighScores()