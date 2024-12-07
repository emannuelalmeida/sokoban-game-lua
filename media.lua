local function loadAllImages()
    local images = {}

    images["B"] = love.graphics.newImage("media/images/box.jpg")
    images["X"] = love.graphics.newImage("media/images/boxOnSlot.jpg")
    images["W"] = love.graphics.newImage("media/images/wall.jpg")
    images["S"] = love.graphics.newImage("media/images/slot.jpg")
    images["start"] = love.graphics.newImage("media/images/start.jpg")
    images["victory"] = love.graphics.newImage("media/images/victory.jpg")
    images["highscore"] = love.graphics.newImage("media/images/highscore.jpg")
    images["playerName"] = love.graphics.newImage("media/images/player.jpg")
    
    -- Hero sprites
    local sprites = {"media/images/heroUp.jpg", 
        "media/images/heroDown.jpg", 
        "media/images/heroLeft.jpg", 
        "media/images/heroRight.jpg"}
    images["hero"] = love.graphics.newArrayImage(sprites)

    return images

end

local function loadAllSounds()
    local sounds = {}

    sounds["menu"] = love.audio.newSource("media/sounds/menu.mp3", "static")
    sounds["confirma"] = love.audio.newSource("media/sounds/confirma_menu.mp3", "static")
    sounds["caixa"] = love.audio.newSource("media/sounds/caixa.ogg", "static")

    return sounds
end

Images = loadAllImages()
Sounds = loadAllSounds()