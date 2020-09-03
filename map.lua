local function generateMapGrid(map, mapContent)
    map.grid = {}

    map.numBoxes = 0
    map.numSlots = 0
    map.numOnSlot = 0

    local validChars = " WBSXH"

    for y=1,map.sizeY do
        map.grid[y] = {}

        for x=1, map.sizeX do
            local char = string.sub(mapContent[y+1], x, x)

            if (string.match(validChars, char)) then
                map.grid[y][x] = char

                if (char == 'B') then
                    map.numBoxes = map.numBoxes +1
                elseif (char == 'S') then
                    map.numSlots = map.numSlots + 1
                elseif (char == 'X') then
                    map.numBoxes = map.numBoxes +1
                    map.numSlots = map.numSlots + 1
                    map.numOnSlot = map.numOnSlot + 1
                elseif (char == 'H') then
                    if (map.hero == nil) then
                        map.hero = Hero(x, y)
                    else
                        error("Error: Can't have more than one hero per map. Not yet ;)")
                    end
                end

            else
                error("Invalid character " .. char .. " found while importing map.")
            end

        end
    end

    if map.hero == nil then
        error("Error: We can't have an adventure without a hero :'<")
    end

    map.victory = function ()
        return map.numBoxes == map.numOnSlot
    end

end

local function importMap(fileName)
    local file = io.open(fileName, "r")
    if (not file) then
        error("Error reading map: " .. fileName)
    end

    local map = {}

    local fileContent = Split(file:read("*a"), "\n")
    local fileHeader = Split(fileContent[1], ",")

    map.sizeX = tonumber(fileHeader[1])
    map.sizeY = tonumber(fileHeader[2])

    generateMapGrid(map, fileContent)

    return true, map
end

function LoadMap(mapPath)

    --for now it's just a template to test the reading of the map
    local isValid, map = importMap(mapPath)
    if (not isValid) then
        error("Invalid map", 2)
    end

    return map
end

