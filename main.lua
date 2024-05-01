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
local kavo = loadstring(githubRequest("core/gui.lua"))()
shared.kavo = kavo
getgenv().funnyInjected = true
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

if game.PlaceId == 4483381587 then
    newgame('baseplate')
    loadfile('funny/games/baseplate.lua')()
else
    writefile('funny/universal.lua', githubRequest('universal.lua'))
    loadfile('funny/universal.lua')()
end