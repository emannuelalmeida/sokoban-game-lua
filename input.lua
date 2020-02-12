function ProcessPositionDelta()
    local dX = 0
    local dY = 0

    if love.keyboard.isDown("up") then
        dY = -1
    elseif love.keyboard.isDown("down") then
        dY = 1
    elseif love.keyboard.isDown("left") then
        dX = -1
    elseif love.keyboard.isDown("right") then
        dX = 1
    end

    return dX, dY
end