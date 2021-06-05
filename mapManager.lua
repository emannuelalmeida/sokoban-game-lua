local maps = {}
local currentMap = 0
local mapsFolder = "maps"

local function loadMapsNames()
    maps = {}

    local files = love.filesystem.getDirectoryItems(mapsFolder)
    for k, file in ipairs(files) do
       table.insert(maps, mapsFolder .. "\\" .. file)
    end

    return maps
end

function ExistsNextMap()
    return #maps > currentMap
end

function GetNextMap()
    currentMap = currentMap + 1
    return LoadMap(maps[currentMap])
end

function BackToFirstMap()
    currentMap = 0
end

maps = loadMapsNames()