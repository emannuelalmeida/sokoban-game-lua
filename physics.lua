local function validMovement(dx, dy)
    return dx ~= 0 or dy ~= 0
end

local function canWalk(map, dX, dY)
    local heroX, heroY = map.hero.x, map.hero.y
    return map.grid[heroY+dY][heroX+dX] == ' ' or map.grid[heroY+dY][heroX+dX] == 'S'
end

local function updateHero(map, dX, dY)
    map.hero.x = map.hero.x+dX
    map.hero.y = map.hero.y+dY
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

function MoveOrPushBox(map, dX, dY)

    if not CoolDown and validMovement(dX, dY) then

        if canWalk(map, dX, dY) then
            updateHero(map, dX, dY)
        elseif canPush(map, dX, dY) then
            pushBox(map, dX, dY)
            updateHero(map, dX, dY)
        end
            
        CoolDown = true
    end

end
