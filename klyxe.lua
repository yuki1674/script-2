-- Klyxe Hub Script (Compact Version)
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
local Win = OrionLib:MakeWindow({Name = "Klyxe Hub | discord.gg/wFafRbRpj", HidePremium = false, SaveConfig = true, ConfigFolder = "KlyxeHub"})

local Rarities = {"Common", "Rare", "Legendary", "Mythic", "Cosmic", "Secret", "Eternal", "Divine"}
local S = {Steal = false, Target = "Divine", Speed = 50, Anti = false, Hop = false}
local Plr = game.Players.LocalPlayer

-- Auto Steal
task.spawn(function()
    while true do
        task.wait(0.1)
        if S.Steal then
            local f = workspace:FindFirstChild("Eggs") or workspace:FindFirstChild("SpawnedEggs")
            if f then
                for _, e in ipairs(f:GetChildren()) do
                    if (e:GetAttribute("Rarity") or "Common") == S.Target then
                        local c = Plr.Character
                        if c and c:FindFirstChild("HumanoidRootPart") then
                            c.HumanoidRootPart.CFrame = e:GetPivot()
                            local p = e:FindFirstChildOfClass("ProximityPrompt")
                            if p then fireproximityprompt(p) end
                            task.wait(0.05)
                            if e and e.Parent then e:Destroy() end
                        end
                    end
                end
            end
        end
    end
end)

-- Anti Chase
task.spawn(function()
    while true do
        task.wait(0.2)
        if S.Anti then
            local c = Plr.Character
            if c and c:FindFirstChild("HumanoidRootPart") then
                local p = c.HumanoidRootPart.Position
                for _, o in ipairs(game.Players:GetPlayers()) do
                    if o ~= Plr and o.Character and o.Character:FindFirstChild("HumanoidRootPart") then
                        local tp = o.Character.HumanoidRootPart.Position
                        if (p - tp).Magnitude < 15 then
                            c.HumanoidRootPart.CFrame = c.HumanoidRootPart.CFrame + Vector3.new((p - tp).Unit.X * 10, 0, (p - tp).Unit.Z * 10)
                        end
                    end
                end
            end
        end
    end
end)

-- Server Hop (Empty Server)
local function Hop()
    local Http, TS = game:GetService("HttpService"), game:GetService("TeleportService")
    local servers, cursor = {}, ""
    repeat
        local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100" .. (cursor ~= "" and "&cursor="..cursor or "")
        local ok, res = pcall(function() return Http:JSONDecode(game:HttpGet(url)) end)
        if ok and res and res.data then
            for _, s in ipairs(res.data) do
                if s.playing == 1 and s.id ~= game.JobId then table.insert(servers, s.id) end
            end
            cursor = res.nextPageCursor
        else break end
    until cursor == nil or #servers > 0

    if #servers > 0 then
        TS:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], Plr)
    else
        TS:Teleport(game.PlaceId, Plr)
    end
end

-- Tabs
local T1 = Win:MakeTab({Name = "Farm", Icon = "rbxassetid://4483345998", PremiumOnly = false})
T1:AddToggle({Name = "Egg Collector", Default = false, Callback = function(v) S.Steal = v end})
T1:AddSlider({Name = "Collector Speed", Min = 16, Max = 1000, Default = 50, Color = Color3.fromRGB(0,255,255), Increment = 1, ValueName = "Speed", Callback = function(v) S.Speed = v end})
T1:AddDropdown({Name = "Egg Priority", Default = "Divine", Options = Rarities, Callback = function(v) S.Target = v end})

local T2 = Win:MakeTab({Name = "Misc", Icon = "rbxassetid://4483345998", PremiumOnly = false})
T2:AddToggle({Name = "Egg ESP", Default = false, Callback = function(v) print("ESP:", v) end})
T2:AddToggle({Name = "Instant Grab", Default = false, Callback = function(v) print("Grab:", v) end})

local T3 = Win:MakeTab({Name = "Player", Icon = "rbxassetid://4483345998", PremiumOnly = false})
T3:AddToggle({Name = "Anti Chase", Default = false, Callback = function(v) S.Anti = v end})
T3:AddToggle({Name = "Speed Bypass", Default = true, Callback = function(v) print("Bypass:", v) end})
T3:AddSlider({Name = "Walk Speed", Min = 16, Max = 1000, Default = 16, Color = Color3.fromRGB(0,150,255), Increment = 1, ValueName = "Speed", Callback = function(v)
    if Plr.Character and Plr.Character:FindFirstChild("Humanoid") then Plr.Character.Humanoid.WalkSpeed = v end
end})

local T4 = Win:MakeTab({Name = "Server", Icon = "rbxassetid://4483345998", PremiumOnly = false})
T4:AddToggle({Name = "Auto Server Hop (Empty)", Default = false, Callback = function(v) if v then Hop() end end})
T4:AddDropdown({Name = "Auto Hop Filter", Default = "Divine", Options = Rarities, Callback = function(v) print("Filter:", v) end})

OrionLib:Init()
