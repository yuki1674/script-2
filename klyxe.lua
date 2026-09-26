-- KLYXE HUB | Owner: clyecon
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local ScrollFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local CloseBtn = Instance.new("TextButton")
local MinimizeBtn = Instance.new("TextButton")
local isMinimized = false

-- Parent Setup
ScreenGui.Parent = game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "KlyxeHub"

-- Main Window
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -125)
MainFrame.Size = UDim2.new(0, 350, 0, 260)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

UIStroke.Parent = MainFrame
UIStroke.Color = Color3.fromRGB(220, 20, 60) -- Red Outline
UIStroke.Thickness = 2

-- Title Label
TitleLabel.Name = "Title"
TitleLabel.Parent = MainFrame
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 12, 0, 8)
TitleLabel.Size = UDim2.new(1, -80, 0, 25)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.Text = "KLYXE HUB | Owner: clyecon"
TitleLabel.TextColor3 = Color3.fromRGB(220, 20, 60)
TitleLabel.TextSize = 12
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Close ("X") Button
CloseBtn.Name = "CloseButton"
CloseBtn.Parent = MainFrame
CloseBtn.Position = UDim2.new(1, -28, 0, 8)
CloseBtn.Size = UDim2.new(0, 20, 0, 20)
CloseBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 12

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 4)
CloseCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Minimize ("-") Circle Button
MinimizeBtn.Name = "MinimizeButton"
MinimizeBtn.Parent = MainFrame
MinimizeBtn.Position = UDim2.new(1, -52, 0, 8)
MinimizeBtn.Size = UDim2.new(0, 20, 0, 20)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MinimizeBtn.Font = Enum.Font.SourceSansBold
MinimizeBtn.Text = "-"
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.TextSize = 14

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(1, 0) -- Circle Shape
MinCorner.Parent = MinimizeBtn

-- Scroll List Container
ScrollFrame.Parent = MainFrame
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.Position = UDim2.new(0, 10, 0, 38)
ScrollFrame.Size = UDim2.new(1, -20, 1, -85)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0) -- Automatic na a-update sa baba
ScrollFrame.ScrollBarThickness = 4

UIListLayout.Parent = ScrollFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)

-- Auto update CanvasSize para laging pwedeng i-scroll kahit madagdagan
UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
end)

-- Discord Copy Button
local DiscButton = Instance.new("TextButton")
local DiscCorner = Instance.new("UICorner")

DiscButton.Name = "DiscordButton"
DiscButton.Parent = MainFrame
DiscButton.Position = UDim2.new(0, 10, 1, -38)
DiscButton.Size = UDim2.new(1, -20, 0, 30)
DiscButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
DiscButton.Font = Enum.Font.SourceSansBold
DiscButton.Text = "COPY DISCORD LINK"
DiscButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscButton.TextSize = 12

DiscCorner.CornerRadius = UDim.new(0, 6)
DiscCorner.Parent = DiscButton

DiscButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/wFafRbRpj")
    DiscButton.Text = "COPIED TO CLIPBOARD!"
    task.wait(2)
    DiscButton.Text = "COPY DISCORD LINK"
end)

-- Minimize Functionality
MinimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    ScrollFrame.Visible = not isMinimized
    DiscButton.Visible = not isMinimized
    if isMinimized then
        MainFrame.Size = UDim2.new(0, 350, 0, 38)
    else
        MainFrame.Size = UDim2.new(0, 350, 0, 260)
    end
end)

-- Function para sa bawat Script Item
local function CreateScriptItem(scriptName, scriptUrl)
    local ItemFrame = Instance.new("Frame")
    local ItemCorner = Instance.new("UICorner")
    local ItemStroke = Instance.new("UIStroke")
    local NameLabel = Instance.new("TextLabel")
    local StatusBadge = Instance.new("TextLabel")
    local StatusCorner = Instance.new("UICorner")
    local ExecButton = Instance.new("TextButton")
    local ExecCorner = Instance.new("UICorner")

    ItemFrame.Size = UDim2.new(1, -10, 0, 45)
    ItemFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    ItemFrame.Parent = ScrollFrame

    ItemCorner.CornerRadius = UDim.new(0, 6)
    ItemCorner.Parent = ItemFrame

    ItemStroke.Parent = ItemFrame
    ItemStroke.Color = Color3.fromRGB(45, 45, 45)

    NameLabel.Parent = ItemFrame
    NameLabel.BackgroundTransparency = 1
    NameLabel.Position = UDim2.new(0, 12, 0, 0)
    NameLabel.Size = UDim2.new(0.4, 0, 1, 0)
    NameLabel.Font = Enum.Font.SourceSansBold
    NameLabel.Text = scriptName
    NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    NameLabel.TextSize = 13
    NameLabel.TextXAlignment = Enum.TextXAlignment.Left

    StatusBadge.Parent = ItemFrame
    StatusBadge.Position = UDim2.new(0.45, 0, 0.2, 0)
    StatusBadge.Size = UDim2.new(0.2, 0, 0.6, 0)
    StatusBadge.Font = Enum.Font.SourceSansBold
    StatusBadge.TextSize = 10
    StatusBadge.Text = "KEYLESS"
    StatusBadge.TextColor3 = Color3.fromRGB(0, 255, 127)
    StatusBadge.BackgroundColor3 = Color3.fromRGB(10, 40, 20)
    
    StatusCorner.CornerRadius = UDim.new(0, 4)
    StatusCorner.Parent = StatusBadge

    ExecButton.Parent = ItemFrame
    ExecButton.Position = UDim2.new(0.7, 0, 0.2, 0)
    ExecButton.Size = UDim2.new(0.26, 0, 0.6, 0)
    ExecButton.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
    ExecButton.Font = Enum.Font.SourceSansBold
    ExecButton.Text = "EXECUTE"
    ExecButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ExecButton.TextSize = 11

    ExecCorner.CornerRadius = UDim.new(0, 4)
    ExecCorner.Parent = ExecButton

    -- Tatakbo lang kapag pinindot ang EXECUTE button
    ExecButton.MouseButton1Click:Connect(function()
        pcall(function()
            loadstring(game:HttpGet(scriptUrl))()
        end)
    end)
end

-- Listahan ng 16 Scripts
CreateScriptItem("LKZ", "https://api.luarmor.net/files/v4/loaders/65bf3459d87ba3ac46350e154b640929.lua")
CreateScriptItem("GLINT", "https://flowauth.net/v1/loaders/6824c37a4078d7d311677732e231edaa.lua")
CreateScriptItem("LEVON", "https://pastefy.app/nasHhfko/raw")
CreateScriptItem("PS HOP", "https://raw.githubusercontent.com/GlazeScripts/Private-Server-Finder/refs/heads/main/Glazehub.lua")
CreateScriptItem("SENA", "https://senahub.xyz/raw/loader")
CreateScriptItem("FOX", "https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/Fn-stealanegg.lua")
CreateScriptItem("BLXY", "https://flowauth.net/v1/loaders/69d3463240384f3a73fbe32c178093a2.lua")
CreateScriptItem("LENNON V4", "https://api.luarmor.net/files/v4/loaders/4595fe31a5f7a8b4f4dd7071f3119ef7.lua")
CreateScriptItem("NIGHT HUB", "https://raw.githubusercontent.com/WhiteX1208/Scripts/refs/heads/main/StealEggOnly.luau")
CreateScriptItem("SAEGRR", "https://raw.githubusercontent.com/swaggayoung581-sudo/SAE-COMMUNITYYYYY/refs/heads/main/SAEGRR_HUB_BLACK_RED_TWO_MENUS_AUTO_STEAL.lua.txt")
CreateScriptItem("CHILI", "https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua")
CreateScriptItem("DECODE", "https://raw.githubusercontent.com/ItzYumi/Decode/refs/heads/main/DE%3ACODE.lua")
CreateScriptItem("TSUO", "https://raw.githubusercontent.com/Tsuo7/TsuoHub/main/stealanegg")
CreateScriptItem("LIMBO", "https://limbohub.my.id/loader.lua")
CreateScriptItem("MIRANDAV4", "https://raw.githubusercontent.com/miirandahub/loader/refs/heads/main/mirandaafk.lua")
CreateScriptItem("SHADER", "https://raw.githubusercontent.com/randomstring0/pshade-ultimate/refs/heads/main/src/cd.lua")
