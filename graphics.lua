Graphics = {}

local shiftFactorX, shiftFactorY, sizeXOnScreen, sizeYOnScreen = 0, 0, 0, 0
local spriteSize = 35

function Graphics.AdjustMapToScreen(map)

    sizeXOnScreen = map.sizeX * spriteSize
    sizeYOnScreen = map.sizeY * spriteSize

    if (sizeXOnScreen < WinWidth) then
        shiftFactorX = math.abs(sizeXOnScreen - WinWidth)/2
    else
        shiftFactorX = 0
    end

    if (sizeYOnScreen < WinHeight) then
        shiftFactorY = math.abs(sizeYOnScreen - WinHeight)/2
    else
        shiftFactorY = 0
    end

end

local function checkAndAdjustShiftFactors(map)
    if (sizeXOnScreen > WinWidth) then
        if ((map.hero.x ) * spriteSize + shiftFactorX  > WinWidth/2
            and sizeXOnScreen + shiftFactorX >= WinWidth ) then
                shiftFactorX = shiftFactorX - spriteSize
            end
        
        if ((map.hero.x) * spriteSize + shiftFactorX < WinWidth/2
            and shiftFactorX < 0 ) then
                shiftFactorX = shiftFactorX + spriteSize
            end
    end

    if (sizeYOnScreen > WinHeight) then
        if ((map.hero.y ) * spriteSize + shiftFactorY  > WinHeight/2
            and sizeYOnScreen + shiftFactorY >= WinHeight ) then
                shiftFactorY = shiftFactorY - spriteSize
            end
        
        if ((map.hero.y) * spriteSize + shiftFactorY < WinHeight/2
            and shiftFactorY < 0 ) then
                shiftFactorY = shiftFactorY + spriteSize
            end
    end

end

local function isCellDrawable(x, y)
    local vpXStart = -shiftFactorX
    local vpXEnd = WinWidth - shiftFactorX

    local vpYStart = -shiftFactorY
    local vpYEnd = WinHeight - shiftFactorY

    if (x * spriteSize >= vpXStart and x * spriteSize <= vpXEnd
        and y * spriteSize >= vpYStart and y * spriteSize <= vpYEnd) then
            return true
        else
            return false
        end
end

function Graphics.DrawGameScreen(map)
    
    checkAndAdjustShiftFactors(map)
    
    for i=1, map.sizeY do
        for j=1, map.sizeX do
            local cell = map.grid[i][j]
            if cell ~= 'H' and cell ~= ' ' and isCellDrawable(j, i) then
                love.graphics.draw(Images[cell], (j-1)*spriteSize+shiftFactorX, (i-1)*spriteSize+shiftFactorY, 0)
            end
        end
    end

    love.graphics.drawLayer(Images["hero"], map.hero.dir, (map.hero.x-1)*spriteSize+shiftFactorX, (map.hero.y-1)*spriteSize+shiftFactorY, 0)
end

return Graphics
