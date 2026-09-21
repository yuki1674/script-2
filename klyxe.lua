-- Klyxe Hub Custom Theme & UI Modifier para sa Luarmor Loader
task.spawn(function()
    local CoreGui = game:GetService("CoreGui")
    local Players = game.Players
    local LocalPlayer = Players.LocalPlayer

    local function applyThemeAndText(parent)
        for _, v in ipairs(parent:GetDescendants()) do
            pcall(function()
                -- Palitan ang mga text para maging Klyxe Hub at ilagay ang bagong Discord link
                if v:IsA("TextLabel") or v:IsA("TextBox") or v:IsA("TextButton") then
                    local txt = v.Text
                    if txt:find("lkz") or txt:find("LKZ") or txt:find("Luarmor") or txt:find("Loader") then
                        v.Text = string.gsub(string.gsub(string.gsub(string.gsub(txt, "lkz", "Klyxe Hub"), "LKZ", "Klyxe Hub"), "Luarmor", "Klyxe Hub"), "Loader", "Klyxe Hub")
                    end
                    if txt:find("discord.gg") or txt:find("discord") then
                        v.Text = "discord.gg/7jyq2T9Kj"
                    end
                end

                -- Kulayan ng Itim (Background) at Pula (Gilid/Accents) ang mga UI elements
                if v:IsA("Frame") or v:IsA("ScrollingFrame") or v:IsA("CanvasGroup") then
                    -- Kung ito ang pangunahing background, gawing itim
                    if v.BackgroundColor3.R > 0.8 and v.BackgroundColor3.G > 0.8 and v.BackgroundColor3.B > 0.8 then
                        v.BackgroundColor3 = Color3.fromRGB(15, 15, 15) -- Dark Black
                    end
                elseif v:IsA("UIStroke") or v:IsA("UIGradient") then
                    -- Kulayan ng pula ang mga gilid o border strokes
                    v.Color = Color3.fromRGB(255, 0, 0)
                end
            end)
        end
    end

    -- Paulit-ulit na i-apply habang aktibo ang UI
    while task.wait(0.1) do
        pcall(function()
            applyThemeAndText(CoreGui)
            if LocalPlayer and LocalPlayer:FindFirstChild("PlayerGui") then
                applyThemeAndText(LocalPlayer.PlayerGui)
            end
        end)
    end
end)

-- Ang Luarmor loader mo
loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/65bf3459d87ba3ac46350e154b640929.lua"))()
