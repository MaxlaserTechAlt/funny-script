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
