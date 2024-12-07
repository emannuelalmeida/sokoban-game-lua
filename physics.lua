Physics = {}

local cooldown = false

function Physics.ReleaseCooldown()
    cooldown = false
end

local function validMovement(dx, dy)
    return dx ~= 0 or dy ~= 0
end

local function canWalk(map, dX, dY)
    local heroX, heroY = map.hero.x, map.hero.y
    return map.grid[heroY+dY][heroX+dX] == ' ' 
        or map.grid[heroY+dY][heroX+dX] == 'S'
        or map.grid[heroY+dY][heroX+dX] == 'H'
end

local function updateHero(map, dX, dY)
    map.hero.x = map.hero.x+dX
    map.hero.y = map.hero.y+dY

    if dX > 0 then
        map.hero.dir = 4
    elseif dX < 0 then 
        map.hero.dir = 3
    elseif dY > 0 then
        map.hero.dir = 2
    elseif dY < 0 then
        map.hero.dir = 1
    end
end

local function canPush(map, dX, dY)
    local heroX, heroY = map.hero.x, map.hero.y
    if map.grid[heroY+dY][heroX+dX] ~= 'B' and map.grid[heroY+dY][heroX+dX] ~= 'X' then
        return false
    else
        return canWalk(map, 2*dX, 2*dY)
    end
end

local function pushBox(map, dX, dY)
    local heroX, heroY = map.hero.x, map.hero.y
  
    if map.grid[heroY+dY][heroX+dX] == 'B' then
        map.grid[heroY+dY][heroX+dX] = ' '
    else
        map.grid[heroY+dY][heroX+dX] = 'S'
        map.numOnSlot = map.numOnSlot - 1
    end
  
    if map.grid[heroY+dY*2][heroX+dX*2] == ' ' then
        map.grid[heroY+dY*2][heroX+dX*2] = 'B'
    else
        map.grid[heroY+dY*2][heroX+dX*2] = 'X'
        map.numOnSlot = map.numOnSlot + 1
    end
end

function Physics.MoveOrPushBox(map, dX, dY)

    if not cooldown and validMovement(dX, dY) then

        if canWalk(map, dX, dY) then
            updateHero(map, dX, dY)
            cooldown = true
            return true
        elseif canPush(map, dX, dY) then
            pushBox(map, dX, dY)
            Sounds["caixa"]:stop()
            Sounds["caixa"]:play()
            updateHero(map, dX, dY)
            cooldown = true
            return true
        end
    end
    return false

end

return Physics
