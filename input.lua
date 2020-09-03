CoolDown = false
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