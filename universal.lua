local guilib = shared.guiTab
local entityFunction = shared.funnyentity
local cloneref = cloneref or function(obj) return obj end
local playerService = cloneref(game:GetService("Players"))
local lplr = cloneref(game:GetService("Players").LocalPlayer)
local replicatedStorage = cloneref(game:GetService("ReplicatedStorage"))

local object = {
    speed = guilib.blatant.CreateSection('Speed'),
    esp = guilib.render.CreateSection('ESP'),
    proximity = guilib.utility.CreateSection('InstaInteract'),
    toolaura = guilib.blatant.CreateSection('Killaura'),
    antivoid = guilib.world.CreateSection('AntiVoid')
}

local run = function(boolean) boolean() end

run(function()
    local Speed = {}
    local SpeedValue = {}
    local SpeedMode = {}
    local Speedfunction = {
        TP = function()
            return (lplr.Character.HumanoidRootPart.CFrame + CFrame.new(SpeedValue.Value,0,0))
        end,
        WalkSpeed = function()
            return lplr.Character.Humanoid.WalkSpeed = SpeedValue.Value
        end
    }
    Speed = guilib.object.speed.CreateToggle({
        Name = "Speed",
        Function = function(call)
            if call then
                repeat
                    Speedfunction[SpeedMode.Value]()
                    task.wait(1)
                until (not Speed.Enabled)
            end
        end,
        HoverText = "Chat is this real?"
    })
end)
