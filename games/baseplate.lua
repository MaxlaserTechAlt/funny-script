local guilib = shared.guiTab
local entityFunction = shared.funnyentity
local cloneref = cloneref or function(obj) return obj end
local playerService = cloneref(game:GetService("Players"))
local lplr = cloneref(game:GetService("Players").LocalPlayer)
local replicatedStorage = cloneref(game:GetService("ReplicatedStorage"))

local object = {
    speed = guilib.blatant.CreateSection('Speed'),
    esp = guilib.render.CreateSection('ESP')
}

local run = function(boolean) boolean() end

run(function()
    local toggle = {}
    toggle = guilib.object.speed.CreateToggle({
        Name = "function",
        Function = function(call)
            if call then
                repeat
                    print(call)
                    task.wait()
                until (not toggle.Enabled)
            end
        end,
        HoverText = "Chat is this real?"
    })
end)
