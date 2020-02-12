local function importMap(fileName)
    local file = io.open(fileName, "r")
    if (not file) then
        error("Error reading map: " .. fileName)
    end


    return false
end

function loadMap()
    map = {}

    --for now it's just a template to test the reading of the map
    local validate = importMap("maps\\map1.txt")
    if (not validate) then
        error("Invalid map", 2)
    end
    map.sizeX = 25
    map.sizeY = 25
    map.numSlots = 5
    map.numOnSlot = 1
    map.victory = function ()
        return map.numSlots == map.numOnSlot
    end
    return map
end
