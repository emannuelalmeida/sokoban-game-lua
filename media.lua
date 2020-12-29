local function loadAllImages()
    local images = {}

    images["B"] = love.graphics.newImage("media/box.jpg")
    images["X"] = love.graphics.newImage("media/boxOnSlot.jpg")
    images["W"] = love.graphics.newImage("media/wall.jpg")
    images["S"] = love.graphics.newImage("media/slot.jpg")
    images["hero"] = love.graphics.newImage("media/hero.jpg")
    images["start"] = love.graphics.newImage("media/start.jpg")
    images["victory"] = love.graphics.newImage("media/victory.jpg")
    images["highscore"] = love.graphics.newImage("media/highscore.jpg")
    images["playerName"] = love.graphics.newImage("media/player.jpg")

    return images

end

Images = loadAllImages()