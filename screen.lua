function SetMapScaleFactor()

    local sizeX = map.sizeX * OriginalSpriteSize
    local sizeY = map.sizeY * OriginalSpriteSize

    if (sizeX > WinWidth or sizeY > WinHeight) then
        local scaleX = WinWidth / sizeX
        local scaleY = WinHeight / sizeY

        if (scaleX > scaleY) then

            ShiftFactorX = math.abs(sizeX - WinWidth) * scaleY
            ShiftFactorY = 0
            return scaleY, OriginalSpriteSize * scaleY, ShiftFactorX, ShiftFactorY
        else

            ShiftFactorX = 0
            ShiftFactorY = math.abs(sizeY - WinHeight) * scaleX
            return scaleX, OriginalSpriteSize * scaleX, ShiftFactorX, ShiftFactorY
        end
    else
        return 1, OriginalSpriteSize, 0, 0
    end

end

function DrawGameScreen()
    for i=1, map.sizeY do
        for j=1, map.sizeX do
            local cell = map.grid[i][j]
            if cell ~= 'H' and cell ~= ' ' then
                love.graphics.draw(Images[cell], (j-1)*SpriteSize+ShiftFactorX, (i-1)*SpriteSize+ShiftFactorY, 0, ScaleFactor, ScaleFactor)
            end
        end
    end

    love.graphics.draw(Images["hero"], (map.hero.x-1)*SpriteSize+ShiftFactorX, (map.hero.y-1)*SpriteSize+ShiftFactorY, 0, ScaleFactor, ScaleFactor)
end