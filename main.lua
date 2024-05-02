if not isfolder("funny") then
    makefolder("funny") 
end
local loadfile = loadfile or function(path) loadstring(readfile(path))() end
local githubRequest = function(url)
    local sucess,res = pcall(function()
        return game:HttpGet("https://raw.githubusercontent.com/MaxlaserTechAlt/funny-script/main/".. url)
    end)
    res = '-- [[ Funny Script 1.0 ]]--\n'
    writefile('funny/'.. url, res)
    return readfile('funny/'.. url)
end
local cloneref = cloneref or function(obj) return obj end
local kavo = loadstring(githubRequest('core/gui.lua'))()
local entity = loadstring(githubRequest('core/entityFunction.lua'))()
shared.kavoentity = entity
shared.kavo = kavo
getgenv().funnyInjected = true
local gamelist = {
    bedwars = {
        Name = "bedwars.lua",
        placeId = 69420,
    },
    papereducation = {
        Name = "papereducation.lua",
        placeId = 16812449989
    },
    solsrng = {
        Name = "solsrng",
        placeId = 15532962292
    }
}
local win = kavo:CreateWindow({
    Title = "Funny v1.0",
    Theme = 'Luna'
})
local tabs = {
	combat = win.CreateTab('Combat'),
	blatant = win.CreateTab('Blatant'),
	render = win.CreateTab('Render'),
	utility = win.CreateTab('Utility'),
	world = win.CreateTab('World')
}
local newgame = function(gameName)
    if not isfile(gameName) then
        writefile('games/'.. gameName.. ".lua", githubRequest(gameName.. ".lua"))
    end
end
shared.guiTab = tabs

for i,v in gamelist do
    if game.PlaceId == v.placeId then
        loadstring(githubRequest(v.Name))()
    else
        loadstring(githubRequest('universal.lua'))()
    end
end