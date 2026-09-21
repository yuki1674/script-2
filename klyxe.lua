-- Klyxe Hub Finalized Wrapper (Black/Red Theme, No Donation/Webhook, Misc to Egg ESP, Custom Minimize Logo)
task.spawn(function()
    local CoreGui = game:GetService("CoreGui")
    local LocalPlayer = game.Players.LocalPlayer

    -- Gumamit ako ng default Roblox asset ID para sa Klyxe Hub minimized logo
    local klyxeLogo = "rbxassetid://6023426915"

    local function applyCustomizations(parent)
        for _, v in ipairs(parent:GetDescendants()) do
            pcall(function()
                -- Palitan ang mga pangalan, Discord link, at tab/button names
                if v:IsA("TextLabel") or v:IsA("TextBox") or v:IsA("TextButton") then
                    local txt = v.Text
                    if txt:find("lkz") or txt:find("LKZ") or txt:find("Luarmor") or txt:find("Loader") then
                        v.Text = "Klyxe Hub"
                    elseif txt:find("discord.gg") or txt:find("discord") then
                        v.Text = "discord.gg/7jyq2T9Kj"
                    elseif txt:lower() == "misc" then
                        v.Text = "Egg ESP"
                    end
                    
                    -- Tanggalin o itago ang donation at webhook features
                    local lowerTxt = txt:lower()
                    if lowerTxt:find("donate") or lowerTxt:find("donation") or lowerTxt:find("webhook") then
                        if v.Parent and v.Parent:IsA("GuiObject") then
                            v.Parent.Visible = false
                        else
                            v.Visible = false
                        end
                    end
                end

                -- Baguhin ang pinaliit na minimize icon kung nakita ang lkz/loader image
                if v:IsA("ImageLabel") or v:IsA("ImageButton") then
                    if v.Name:find("Minimize") or v.Name:find("Icon") or v.Image == "rbxassetid://7733965558" then
                        v.Image = klyxeLogo
                    end
                end

                -- Kulayan ng Itim ang background at Pula ang mga borders/strokes
                if v:IsA("Frame") or v:IsA("ScrollingFrame") then
                    if v.BackgroundColor3.R > 0.4 and v.BackgroundColor3.G > 0.4 then
                        v.BackgroundColor3 = Color3.fromRGB(10, 10, 10) -- Solid Dark Black
                    end
                elseif v:IsA("UIStroke") then
                    v.Color = Color3.fromRGB(255, 0, 0) -- Bright Red Border Accent
                end
            end)
        end
    end

    -- Patuloy na i-apply habang bukas ang hub
    while task.wait(0.1) do
        pcall(function()
            applyCustomizations(CoreGui)
            if LocalPlayer and LocalPlayer:FindFirstChild("PlayerGui") then
                applyCustomizations(LocalPlayer.PlayerGui)
            end
        end)
    end
end)

-- Ang Luarmor loader mo
loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/65bf3459d87ba3ac46350e154b640929.lua"))()
