local packFile = {
    header = {
        -- name 256 bytes
        -- num  16 bytes
    },
    contentMap = {
        contentDesc = {
            -- name 256 bytes
            -- start 8 bytes
            -- size 8 bytes
        }
    },
    content = {

    }
}

local function loadPackFile(name)

end

local function GetFileFromPack(name, type)

end

function GetImage(name)
    return GetFileFromPack(name, "image")
end

function GetSound(name)
    return GetFileFromPack(name, "sound")
end

function GetMap(name)
    return GetFileFromPack(name, "map")
end
    

