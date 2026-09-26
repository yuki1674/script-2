-- KLYXE HUB | Owner: clyecon (Loading Screen, Minimize to Small Box, Animations Tab & All Scripts)
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- 1. Loading Screen (Lalabas muna ng mga 5 segundo)[cite: 3]
local LoadGui = Instance.new("ScreenGui")
LoadGui.Parent = CoreGui or PlayerGui
LoadGui.Name = "KlyxeLoading"

local LoadFrame = Instance.new("Frame")
LoadFrame.Parent = LoadGui
LoadFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
LoadFrame.Position = UDim2.new(0.5, -125, 0.5, -80)
LoadFrame.Size = UDim2.new(0, 250, 0, 160)
LoadFrame.Active = true
LoadFrame.Draggable = true

local LoadCorner = Instance.new("UICorner")
LoadCorner.CornerRadius = UDim.new(0, 10)
LoadCorner.Parent = LoadFrame

local LoadStroke = Instance.new("UIStroke")
LoadStroke.Parent = LoadFrame
LoadStroke.Color = Color3.fromRGB(220, 20, 60)
LoadStroke.Thickness = 2

local LogoImage = Instance.new("ImageLabel")
LogoImage.Parent = LoadFrame
LogoImage.BackgroundTransparency = 1
LogoImage.Position = UDim2.new(0.5, -75, 0.15, 0)
LogoImage.Size = UDim2.new(0, 150, 0, 70)
LogoImage.Image = "rbxassetid://18512314545"
LogoImage.ScaleType = Enum.ScaleType.Fit

local LoadText = Instance.new("TextLabel")
LoadText.Parent = LoadFrame
LoadText.BackgroundTransparency = 1
LoadText.Position = UDim2.new(0, 10, 0.65, 0)
LoadText.Size = UDim2.new(1, -20, 0, 30)
LoadText.Font = Enum.Font.SourceSansBold
LoadText.Text = "Loading Klyxe Hub..."
LoadText.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadText.TextSize = 13

local BarBg = Instance.new("Frame")
BarBg.Parent = LoadFrame
BarBg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
BarBg.Position = UDim2.new(0.1, 0, 0.85, 0)
BarBg.Size = UDim2.new(0.8, 0, 0, 8)

local BarBgCorner = Instance.new("UICorner")
BarBgCorner.CornerRadius = UDim.new(1, 0)
BarBgCorner.Parent = BarBg

local BarFill = Instance.new("Frame")
BarFill.Parent = BarBg
BarFill.BackgroundColor3 = Color3.fromRGB(220, 20, 60)
BarFill.Size = UDim2.new(0, 0, 1, 0)

local BarFillCorner = Instance.new("UICorner")
BarFillCorner.CornerRadius = UDim.new(1, 0)
BarFillCorner.Parent = BarFill

local tweenService = game:GetService("TweenService")
tweenService:Create(BarFill, TweenInfo.new(5, Enum.EasingStyle.Linear), {Size = UDim2.new(1, 0, 1, 0)}):Play()

task.wait(5)
LoadGui:Destroy()

-- 2. Mismong Main GUI ng Klyxe Hub
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local CloseBtn = Instance.new("TextButton")
local MinimizeBtn = Instance.new("TextButton")
local isMinimized = false

-- Maliit na Box kapag naka-minimize
local SmallBox = Instance.new("TextButton")
SmallBox.Parent = ScreenGui
SmallBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
SmallBox.Position = UDim2.new(0.5, -30, 0.1, 0)
SmallBox.Size = UDim2.new(0, 60, 0, 30)
SmallBox.Font = Enum.Font.SourceSansBold
SmallBox.Text = "KLYXE"
SmallBox.TextColor3 = Color3.fromRGB(220, 20, 60)
SmallBox.TextSize = 11
SmallBox.Visible = false
SmallBox.Active = true
SmallBox.Draggable = true

local SmallCorner = Instance.new("UICorner")
SmallCorner.CornerRadius = UDim.new(0, 6)
SmallCorner.Parent = SmallBox

local SmallStroke = Instance.new("UIStroke")
SmallStroke.Parent = SmallBox
SmallStroke.Color = Color3.fromRGB(220, 20, 60)
SmallStroke.Thickness = 2

-- Sidebar Frame (Kaliwa)
local Sidebar = Instance.new("Frame")
local SidebarLayout = Instance.new("UIListLayout")

-- Content Container Frame (Kanan)
local ContentContainer = Instance.new("Frame")

-- Parent Setup
ScreenGui.Parent = CoreGui or PlayerGui
ScreenGui.Name = "KlyxeHub"

-- Main Window
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -135)
MainFrame.Size = UDim2.new(0, 420, 0, 270)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

UIStroke.Parent = MainFrame
UIStroke.Color = Color3.fromRGB(220, 20, 60)
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

-- Minimize ("-") Button
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
MinCorner.CornerRadius = UDim.new(1, 0)
MinCorner.Parent = MinimizeBtn

-- Sidebar Setup (Tabs sa Kaliwa)
Sidebar.Parent = MainFrame
Sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Sidebar.Position = UDim2.new(0, 10, 0, 38)
Sidebar.Size = UDim2.new(0, 110, 1, -75)
Sidebar.BackgroundTransparency = 0.5

local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 6)
SidebarCorner.Parent = Sidebar

SidebarLayout.Parent = Sidebar
SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
SidebarLayout.Padding = UDim.new(0, 5)

-- Content Container (Kanan)
ContentContainer.Parent = MainFrame
ContentContainer.BackgroundTransparency = 1
ContentContainer.Position = UDim2.new(0, 125, 0, 38)
ContentContainer.Size = UDim2.new(1, -135, 1, -75)

-- Function para sa paggawa ng Tabs
local Pages = {}
local function CreateTab(tabName)
    local TabBtn = Instance.new("TextButton")
    local TabCorner = Instance.new("UICorner")
    
    TabBtn.Parent = Sidebar
    TabBtn.Size = UDim2.new(1, 0, 0, 30)
    TabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TabBtn.Font = Enum.Font.SourceSansBold
    TabBtn.Text = tabName
    TabBtn.TextColor3 = Color3.fromRGB(220, 20, 60)
    TabBtn.TextSize = 11
    
    TabCorner.CornerRadius = UDim.new(0, 4)
    TabCorner.Parent = TabBtn

    local ScrollFrame = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")

    ScrollFrame.Parent = ContentContainer
    ScrollFrame.BackgroundTransparency = 1
    ScrollFrame.Size = UDim2.new(1, 0, 1, 0)
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScrollFrame.ScrollBarThickness = 4
    ScrollFrame.Visible = false

    UIListLayout.Parent = ScrollFrame
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 6)

    UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
    end)

    TabBtn.MouseButton1Click:Connect(function()
        for _, page in pairs(Pages) do
            page.Visible = false
        end
        ScrollFrame.Visible = true
    end)

    if #Pages == 0 then
        ScrollFrame.Visible = true
    end

    table.insert(Pages, ScrollFrame)
    return ScrollFrame
end

-- Tabs
local ScriptsTab = CreateTab("Scripts")
local KeyTab = CreateTab("Key")
local FinderTab = CreateTab("PS Finder")
local ShaderTab = CreateTab("Shader")
local AnimTab = CreateTab("Animations")
local MusicTab = CreateTab("Music")
local SettingsTab = CreateTab("Settings")

-- Discord Copy Button sa Baba ng Main Frame
local DiscButton = Instance.new("TextButton")
local DiscCorner = Instance.new("UICorner")

DiscButton.Name = "DiscordButton"
DiscButton.Parent = MainFrame
DiscButton.Position = UDim2.new(0, 10, 1, -32)
DiscButton.Size = UDim2.new(1, -20, 0, 24)
DiscButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
DiscButton.Font = Enum.Font.SourceSansBold
DiscButton.Text = "COPY DISCORD LINK"
DiscButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscButton.TextSize = 11

DiscCorner.CornerRadius = UDim.new(0, 6)
DiscCorner.Parent = DiscButton

DiscButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/3bP8an84h")
    DiscButton.Text = "COPIED TO CLIPBOARD!"
    task.wait(2)
    DiscButton.Text = "COPY DISCORD LINK"
end)

-- Minimize & Unminimize Logic
local function ToggleMinimize()
    isMinimized = not isMinimized
    MainFrame.Visible = not isMinimized
    SmallBox.Visible = isMinimized
end

MinimizeBtn.MouseButton1Click:Connect(ToggleMinimize)
SmallBox.MouseButton1Click:Connect(ToggleMinimize)

-- Function para sa paggawa ng Items sa loob ng tab
local function AddItem(targetTab, scriptName, scriptUrl, badgeText)
    local ItemFrame = Instance.new("Frame")
    local ItemCorner = Instance.new("UICorner")
    local ItemStroke = Instance.new("UIStroke")
    local NameLabel = Instance.new("TextLabel")
    local StatusBadge = Instance.new("TextLabel")
    local StatusCorner = Instance.new("UICorner")
    local ExecButton = Instance.new("TextButton")
    local ExecCorner = Instance.new("UICorner")

    ItemFrame.Size = UDim2.new(1, -5, 0, 38)
    ItemFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    ItemFrame.Parent = targetTab

    ItemCorner.CornerRadius = UDim.new(0, 6)
    ItemCorner.Parent = ItemFrame

    ItemStroke.Parent = ItemFrame
    ItemStroke.Color = Color3.fromRGB(45, 45, 45)

    NameLabel.Parent = ItemFrame
    NameLabel.BackgroundTransparency = 1
    NameLabel.Position = UDim2.new(0, 8, 0, 0)
    NameLabel.Size = UDim2.new(0.35, 0, 1, 0)
    NameLabel.Font = Enum.Font.SourceSansBold
    NameLabel.Text = scriptName
    NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    NameLabel.TextSize = 12
    NameLabel.TextXAlignment = Enum.TextXAlignment.Left

    StatusBadge.Parent = ItemFrame
    StatusBadge.Position = UDim2.new(0.38, 0, 0.2, 0)
    StatusBadge.Size = UDim2.new(0.25, 0, 0.6, 0)
    StatusBadge.Font = Enum.Font.SourceSansBold
    StatusBadge.TextSize = 9
    StatusBadge.Text = badgeText or "WORKING"
    StatusBadge.TextColor3 = Color3.fromRGB(220, 20, 60)
    StatusBadge.BackgroundColor3 = Color3.fromRGB(40, 10, 15)
    
    StatusCorner.CornerRadius = UDim.new(0, 4)
    StatusCorner.Parent = StatusBadge

    ExecButton.Parent = ItemFrame
    ExecButton.Position = UDim2.new(0.65, 0, 0.2, 0)
    ExecButton.Size = UDim2.new(0.32, 0, 0.6, 0)
    ExecButton.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
    ExecButton.Font = Enum.Font.SourceSansBold
    ExecButton.Text = "EXECUTE"
    ExecButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ExecButton.TextSize = 10

    ExecCorner.CornerRadius = UDim.new(0, 4)
    ExecCorner.Parent = ExecButton

    ExecButton.MouseButton1Click:Connect(function()
        pcall(function()
            loadstring(game:HttpGet(scriptUrl))()
        end)
    end)
end

-- Scripts Tab Items
AddItem(ScriptsTab, "LKZ", "https://api.luarmor.net/files/v4/loaders/65bf3459d87ba3ac46350e154b640929.lua")
AddItem(ScriptsTab, "GLINT", "https://flowauth.net/v1/loaders/6824c37a4078d7d311677732e231edaa.lua")
AddItem(ScriptsTab, "LEVON", "https://pastefy.app/nasHhfko/raw")
AddItem(ScriptsTab, "SENA", "https://raw.githubusercontent.com/senarblx/sena/refs/heads/main/senav3go")
AddItem(ScriptsTab, "FOX", "https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/Fn-stealanegg.lua")
AddItem(ScriptsTab, "BLXY", "https://flowauth.net/v1/loaders/69d3463240384f3a73fbe32c178093a2.lua")
AddItem(ScriptsTab, "LENNON V4", "https://api.luarmor.net/files/v4/loaders/4595fe31a5f7a8b4f4dd7071f3119ef7.lua")
AddItem(ScriptsTab, "NIGHT HUB", "https://raw.githubusercontent.com/WhiteX1208/Scripts/refs/heads/main/StealEggOnly.luau")
AddItem(ScriptsTab, "SAEGRR", "https://raw.githubusercontent.com/swaggayoung581-sudo/SAE-COMMUNITYYYYY/refs/heads/main/SAEGRR_HUB_BLACK_RED_TWO_MENUS_AUTO_STEAL.lua.txt")
AddItem(ScriptsTab, "CHILI", "https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua")
AddItem(ScriptsTab, "DECODE", "https://raw.githubusercontent.com/ItzYumi/Decode/refs/heads/main/DE%3ACODE.lua")
AddItem(ScriptsTab, "TSUO", "https://raw.githubusercontent.com/Tsuo7/TsuoHub/main/stealanegg")
AddItem(ScriptsTab, "LIMBO", "https://limbohub.my.id/loader.lua")
AddItem(ScriptsTab, "MIRANDAV4", "https://raw.githubusercontent.com/miirandahub/loader/refs/heads/main/mirandaafk.lua")
AddItem(ScriptsTab, "KEYLESS", "https://raw.githubusercontent.com/Developer-20261/FreeForALL/refs/heads/main/Keyless")
AddItem(ScriptsTab, "HORZIN", "https://api.jnkie.com/api/v1/luascripts/public/3db06e0eaa1e4e8bf5e9d3192fa71e0bad2d1d1af5b11c0a58e6b708ad4487f4/download")
AddItem(ScriptsTab, "NEXORA", "https://raw.githubusercontent.com/Dayvinksthik/Script/refs/heads/main/Games/JoshBNS-Crack.lua")
AddItem(ScriptsTab, "AEV", "https://vampauth.com/api/projects/2826ec6b-24e6-4392-b3e2-48512923e68c/scripts/aevix")
AddItem(ScriptsTab, "LEON 1", "https://raw.githubusercontent.com/sabscrip-arch/srver/refs/heads/main/Stealanegg")
AddItem(ScriptsTab, "JOHNBNS", "https://raw.githubusercontent.com/Developer-20261/FreeForALL/refs/heads/main/Keyless")
AddItem(ScriptsTab, "VANTA B", "https://raw.githubusercontent.com/tranduykhanh08428-web/VantablackHub/refs/heads/main/Stealanegg.lua.txt")
AddItem(ScriptsTab, "YODOKU", "https://raw.githubusercontent.com/betdoyvaka/stealanegg/main/Loader.lua")
AddItem(ScriptsTab, "LEON 2", "https://raw.githubusercontent.com/n01771542-cmd/faluahub/main/main.lua")
AddItem(ScriptsTab, "VIEL", "https://pastefy.app/jemUHE0u/raw")
AddItem(ScriptsTab, "CAT HUB", "https://raw.githubusercontent.com/showscript-hub/Script/refs/heads/main/Cat-hub")
AddItem(ScriptsTab, "NASI RENDANG", "https://raw.githubusercontent.com/JualNasiRendang/loader/refs/heads/main/main.lua")
AddItem(ScriptsTab, "VOID SHELL", "https://raw.githubusercontent.com/VoidShell-null/VoidShell-Hub/refs/heads/main/Scripts/StealAnEgg.luau")
AddItem(ScriptsTab, "SOLVEX", "https://raw.githubusercontent.com/Solvexxxx/Scripts/refs/heads/main/SolvexGUI_SAE.lua")

-- Key Tab Items
AddItem(KeyTab, "OMG HUB", "https://raw.githubusercontent.com/Omgshit/Scripts/main/MainLoader.lua", "KEY")
AddItem(KeyTab, "AJJANS", "https://api.luarmor.net/files/v4/loaders/36107afd3107e8d841f9d1a69e2465d4.lua", "KEY")
AddItem(KeyTab, "ANGRY HUB", "https://gist.githubusercontent.com/angeryy-tvy/6a9ce750ddf5860230196ac468868fdb/raw/Steal-An-Egg-Vxeze", "KEY")
AddItem(KeyTab, "SNOWY HUB", "https://flowauth.net/v1/ui/a87f00d9adf63658655fcd02aba4ef.lua", "KEY")
AddItem(KeyTab, "KEXXE", "https://raw.githubusercontent.com/premiumbuddy/kex/refs/heads/main/kexxxx", "KEY")
AddItem(KeyTab, "FLOW HUB", "https://api.luarmor.net/files/v4/loaders/5946add9ab91f1e04cb005346a8b1968.lua", "KEY")
AddItem(KeyTab, "ON HUB", "https://raw.githubusercontent.com/davizin713/ONhub/refs/heads/main/script.lua", "KEY")
AddItem(KeyTab, "SOLIX HUB", "https://raw.githubusercontent.com/bao8jl/solixhub/main/loader", "KEY")
AddItem(KeyTab, "NEMESIS", "https://raw.githubusercontent.com/x2zu/loader/main/freeloader.lua", "KEY")
AddItem(KeyTab, "NOVA", "https://raw.githubusercontent.com/NovaHubRBLX/Novahub/refs/heads/main/novahub.lua", "KEY")
AddItem(KeyTab, "SAIOPS", "https://api.saiops.cc/scripts/Steal-An-Egg-Script.lua", "KEY")
AddItem(KeyTab, "SCRIPTVERSE", "https://scriptversekey.xyz/s/steal-an-egg", "KEY")
AddItem(KeyTab, "AIRFLOW", "https://airflowscript.com/loader", "KEY")
AddItem(KeyTab, "CLOVER", "https://raw.githubusercontent.com/Ryuun0x/Clover/refs/heads/main/main.lua", "KEY")
AddItem(KeyTab, "FY", "https://FyyCommunity.my.id", "KEY")
AddItem(KeyTab, "BF", "https://raw.githubusercontent.com/hanniii1/Loader/refs/heads/main/BFLoader.lua", "KEY")
AddItem(KeyTab, "ZN", "https://zeroinhub.com/api/script", "KEY")
AddItem(KeyTab, "SPEED HUB", "https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", "KEY")

-- PS Finder Tab Items
AddItem(FinderTab, "FINDER 1", "https://luasnapper.xyz/files/loaders/90388b27f7484a8fa16e70dd9030bf8a.lua", "FINDER")
AddItem(FinderTab, "FINDER 2", "https://raw.githubusercontent.com/robloxscripts2026/sae-ps/refs/heads/main/lua", "FINDER")

-- Shader Tab Items
AddItem(ShaderTab, "PSHADE ULTIMATE", "https://raw.githubusercontent.com/randomstring0/pshade-ultimate/refs/heads/main/src/cd.lua", "GRAPHICS")

-- Animations Tab Items (Kumpleto na ang tatlo)
AddItem(AnimTab, "ANIMATION 1", "https://pastebin.com/raw/cr20JxP9", "ANIM")
AddItem(AnimTab, "ANIMATION 2", "https://pastebin.com/raw/U1yYFq22", "ANIM")

-- Music Tab Items (YouTube Music Player V8.5)
AddItem(MusicTab, "YT MUSIC V8.5", "https://raw.githubusercontent.com/iimate/ytmusic/refs/heads/main/loader.lua", "MUSIC")

-- Settings Tab Items
local function AddSettingsItem(targetTab, labelText, buttonText, callback)
    local ItemFrame = Instance.new("Frame")
    local ItemCorner = Instance.new("UICorner")
    local ItemStroke = Instance.new("UIStroke")
    local NameLabel = Instance.new("TextLabel")
    local ExecButton = Instance.new("TextButton")
    local ExecCorner = Instance.new("UICorner")

    ItemFrame.Size = UDim2.new(1, -5, 0, 38)
    ItemFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    ItemFrame.Parent = targetTab

    ItemCorner.CornerRadius = UDim.new(0, 6)
    ItemCorner.Parent = ItemFrame

    ItemStroke.Parent = ItemFrame
    ItemStroke.Color = Color3.fromRGB(45, 45, 45)

    NameLabel.Parent = ItemFrame
    NameLabel.BackgroundTransparency = 1
    NameLabel.Position = UDim2.new(0, 8, 0, 0)
    NameLabel.Size = UDim2.new(0.55, 0, 1, 0)
    NameLabel.Font = Enum.Font.SourceSansBold
    NameLabel.Text = labelText
    NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    NameLabel.TextSize = 11
    NameLabel.TextXAlignment = Enum.TextXAlignment.Left

    ExecButton.Parent = ItemFrame
    ExecButton.Position = UDim2.new(0.58, 0, 0.2, 0)
    ExecButton.Size = UDim2.new(0.39, 0, 0.6, 0)
    ExecButton.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
    ExecButton.Font = Enum.Font.SourceSansBold
    ExecButton.Text = buttonText
    ExecButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ExecButton.TextSize = 10

    ExecCorner.CornerRadius = UDim.new(0, 4)
    ExecCorner.Parent = ExecButton

    ExecButton.MouseButton1Click:Connect(function()
        callback(ExecButton)
    end)
end

AddSettingsItem(SettingsTab, "Owner: clyecon", "INFO", function(btn)
    btn.Text = "OWNER: CLYECON"
    task.wait(2)
    btn.Text = "INFO"
end)

AddSettingsItem(SettingsTab, "Discord: https://discord.gg/3bP8an84h", "COPY DISCORD", function(btn)
    setclipboard("https://discord.gg/3bP8an84h")
    btn.Text = "COPIED!"
    task.wait(2)
    btn.Text = "COPY DISCORD"
end)
