function LoadAllImages()
    local images = {}

    images["B"] = love.graphics.newImage("media/box.jpg")
    images["X"] = love.graphics.newImage("media/boxOnSlot.jpg")
    images["W"] = love.graphics.newImage("media/wall.jpg")
    images["S"] = love.graphics.newImage("media/slot.jpg")
    images["hero"] = love.graphics.newImage("media/hero.jpg")
    images["victory"] = love.graphics.newImage("media/victory.jpg")

    return images

end