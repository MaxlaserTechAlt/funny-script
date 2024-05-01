--[[

    Made By maxlaser since 5/1/2024 at 10:31 PM
    Because i was bored

]]

local entity: table = {
    charActive = {},: boolean
    getPlayers = {},: table
    executor = {},: string
    gamefunc = {},: table
    selfDestruct = {}: boolean
}
do 
    entity.charActive = function(plr: string, isalive: boolean): number
        local plrs = plr or game:GetService("Players").LocalPlayer
        local alive = isalive or true
        if alive then
            return plrs.Character.Humanoid.Health ~= 0
        else
            return plrs.Character.Humanoid.health <= 1
        end
    end,
    entity.newString = function(): number
        local c = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
        local r = math.random(1, #c)
        return c:sub(r, r)
    end,
    entity.gamefunc: table = {
        message: table = {
            all = function(msg: string): number
                if game:GetService('TextChatService').ChatVersion == Enum.ChatVersion.TextChatService then
                    game:GetService('TextChatService').ChatInputBarConfiguration.TargetTextChannel:SendAsync(msg)
                else
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, 'All')
                end
            end,
            whisper = function(plr: string, text: string): number
                if plr then
                    if game:GetService('TextChatService').ChatVersion == Enum.ChatVersion.TextChatService then
                        local oldchannel = game:GetService('TextChatService').ChatInputBarConfiguration.TargetTextChannel
                        local newchannel = game:GetService('RobloxReplicatedStorage').ExperienceChat.WhisperChat:InvokeServer(plr.UserId)
                        if newchannel then
                            newchannel:SendAsync(text)
                            game:GetService('TextChatService').ChatInputBarConfiguration.TargetTextChannel = oldchannel
                        end
                    else
                        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer('/w '..plr.Name.." "..text, 'All')
                    end
                end
            end
        }
    },
    entity.getPlayers = function(noplr: boolean): number
        local plrs: table = {}
        for i,v in game:GetService("Players"):GetChildren() do
            if noplr and v ~= game:GetService("Players").LocalPlayer then
                table.insert(plrs, v)
            else
                table.insert(plrs, v)
            end
        end
        return plrs
    end,
    local req: string
    entity.antiLogs = function(): number
        req = hookfunction(request, newcclosure(function(link)
            if link.Url:gsub("discord", "webhooks") then
                print("[⚠] AntiLogger - Someone tryna log you with the webhooks")
                setclipboard(tostring(link.Url))
                return nil
            end
            return req(link: string)
        end))
    end,
    entity.executor = function(): number
        return identifyexecutor or "unknown"
    end,
    entity.selfDestruct = function(): number
        for i,v in entity do
            hookfunction(v, function(...)
                return (...)
            end)
            req = nil
        end
    end
end

return entity