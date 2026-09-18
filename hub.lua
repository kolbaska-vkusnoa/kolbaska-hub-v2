-- ============================================
-- KOLBASKA HUB v2 FINAL — ЧАСТЬ 1/3
-- ============================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local GuiService = game:GetService("GuiService")
local LocalPlayer = Players.LocalPlayer

-- ЗАГРУЗОЧНЫЙ ЭКРАН
local loadingGui = Instance.new("ScreenGui")
loadingGui.Name = "KolbaskaLoader"
loadingGui.IgnoreGuiInset = true
loadingGui.ResetOnSpawn = false
loadingGui.DisplayOrder = 999
loadingGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local lbg = Instance.new("Frame")
lbg.Size = UDim2.new(1, 0, 1, 0)
lbg.BackgroundColor3 = Color3.fromRGB(12, 8, 20)
lbg.BorderSizePixel = 0
lbg.ZIndex = 1
lbg.Parent = loadingGui

local lcontainer = Instance.new("Frame")
lcontainer.Size = UDim2.new(0, 400, 0, 220)
lcontainer.Position = UDim2.new(0.5, -200, 0.5, -110)
lcontainer.BackgroundTransparency = 1
lcontainer.ZIndex = 2
lcontainer.Parent = loadingGui

local lringContainer = Instance.new("Frame")
lringContainer.Size = UDim2.new(0, 120, 0, 120)
lringContainer.Position = UDim2.new(0.5, -60, 0, 0)
lringContainer.BackgroundTransparency = 1
lringContainer.ZIndex = 3
lringContainer.Parent = lcontainer

local louterRing = Instance.new("Frame")
louterRing.Size = UDim2.new(1, 0, 1, 0)
louterRing.BackgroundTransparency = 1
louterRing.ZIndex = 3
louterRing.Parent = lringContainer

local louterStroke = Instance.new("UIStroke")
louterStroke.Thickness = 4
louterStroke.Color = Color3.fromRGB(170, 110, 255)
louterStroke.Transparency = 0.1
louterStroke.Parent = louterRing

local louterGradient = Instance.new("UIGradient")
louterGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(170, 110, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(210, 150, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(170, 110, 255)),
})
louterGradient.Parent = louterStroke

local linnerRing = Instance.new("Frame")
linnerRing.Size = UDim2.new(0.7, 0, 0.7, 0)
linnerRing.Position = UDim2.new(0.15, 0, 0.15, 0)
linnerRing.BackgroundTransparency = 1
linnerRing.ZIndex = 3
linnerRing.Parent = lringContainer

local linnerStroke = Instance.new("UIStroke")
linnerStroke.Thickness = 3
linnerStroke.Color = Color3.fromRGB(255, 255, 255)
linnerStroke.Transparency = 0.6
linnerStroke.Parent = linnerRing

local lcore = Instance.new("Frame")
lcore.Size = UDim2.new(0.3, 0, 0.3, 0)
lcore.Position = UDim2.new(0.35, 0, 0.35, 0)
lcore.BackgroundColor3 = Color3.fromRGB(170, 110, 255)
lcore.ZIndex = 4
lcore.Parent = lringContainer
Instance.new("UICorner", lcore).CornerRadius = UDim.new(1, 0)

local ltitle = Instance.new("TextLabel")
ltitle.Size = UDim2.new(1, 0, 0, 40)
ltitle.Position = UDim2.new(0, 0, 0, 130)
ltitle.BackgroundTransparency = 1
ltitle.Text = "KOLBASKA HUB"
ltitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ltitle.Font = Enum.Font.GothamBold
ltitle.TextSize = 24
ltitle.TextTransparency = 1
ltitle.ZIndex = 3
ltitle.Parent = lcontainer

local lsub = Instance.new("TextLabel")
lsub.Size = UDim2.new(1, 0, 0, 20)
lsub.Position = UDim2.new(0, 0, 0, 165)
lsub.BackgroundTransparency = 1
lsub.Text = "загрузка..."
lsub.TextColor3 = Color3.fromRGB(160, 140, 200)
lsub.Font = Enum.Font.Gotham
lsub.TextSize = 12
lsub.TextTransparency = 1
lsub.ZIndex = 3
lsub.Parent = lcontainer

local lbarBg = Instance.new("Frame")
lbarBg.Size = UDim2.new(0, 300, 0, 6)
lbarBg.Position = UDim2.new(0.5, -150, 0, 195)
lbarBg.BackgroundColor3 = Color3.fromRGB(38, 28, 60)
lbarBg.BorderSizePixel = 0
lbarBg.BackgroundTransparency = 1
lbarBg.ZIndex = 3
lbarBg.Parent = lcontainer
Instance.new("UICorner", lbarBg).CornerRadius = UDim.new(1, 0)

local lbarFill = Instance.new("Frame")
lbarFill.Size = UDim2.new(0, 0, 1, 0)
lbarFill.BackgroundColor3 = Color3.fromRGB(170, 110, 255)
lbarFill.BorderSizePixel = 0
lbarFill.ZIndex = 4
lbarFill.Parent = lbarBg
Instance.new("UICorner", lbarFill).CornerRadius = UDim.new(1, 0)

TweenService:Create(ltitle, TweenInfo.new(0.6), {TextTransparency = 0}):Play()
TweenService:Create(lsub, TweenInfo.new(0.6), {TextTransparency = 0}):Play()
TweenService:Create(lbarBg, TweenInfo.new(0.6), {BackgroundTransparency = 0}):Play()
TweenService:Create(louterRing, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1), {Rotation = 360}):Play()
TweenService:Create(linnerRing, TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1), {Rotation = -360}):Play()

local lprogress = 0
local lprogressConn
lprogressConn = RunService.Heartbeat:Connect(function(dt)
    if lprogress < 1 then
        lprogress = math.min(lprogress + dt * 0.7, 1)
        lbarFill.Size = UDim2.new(lprogress, 0, 1, 0)
    end
end)

task.wait(2.5)

if lprogressConn then lprogressConn:Disconnect() end

local fadeOut = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
TweenService:Create(ltitle, fadeOut, {TextTransparency = 1}):Play()
TweenService:Create(lsub, fadeOut, {TextTransparency = 1}):Play()
TweenService:Create(lbarBg, fadeOut, {BackgroundTransparency = 1}):Play()
TweenService:Create(lcontainer, fadeOut, {BackgroundTransparency = 1}):Play()
TweenService:Create(lbg, fadeOut, {BackgroundTransparency = 1}):Play()

task.wait(0.8)
loadingGui:Destroy()

-- ОСНОВНОЙ СКРИПТ
local old = LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("KolbaskaHubGui")
if old then old:Destroy() end

local C_BG       = Color3.fromRGB(12, 8, 20)
local C_PANEL    = Color3.fromRGB(22, 16, 35)
local C_PANEL2   = Color3.fromRGB(30, 22, 48)
local C_BTN      = Color3.fromRGB(38, 28, 60)
local C_BTN_HOV  = Color3.fromRGB(55, 40, 90)
local C_ACCENT   = Color3.fromRGB(170, 110, 255)
local C_ACCENT2  = Color3.fromRGB(210, 150, 255)
local C_GREEN    = Color3.fromRGB(170, 100, 255)
local C_RED      = Color3.fromRGB(220, 70, 150)
local C_TEXT     = Color3.fromRGB(240, 230, 255)
local C_TEXT_DIM = Color3.fromRGB(160, 140, 200)
local C_BORDER   = Color3.fromRGB(90, 60, 150)

local gui = Instance.new("ScreenGui")
gui.Name = "KolbaskaHubGui"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 0, 0, 0)
main.Position = UDim2.new(0, 80, 0, 60)
main.BackgroundColor3 = C_BG
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = gui
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 16)
TweenService:Create(main, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 620, 0, 660)}):Play()

local stroke = Instance.new("UIStroke")
stroke.Color = C_BORDER
stroke.Thickness = 1.5
stroke.Transparency = 0.2
stroke.Parent = main

local shadow = Instance.new("Frame")
shadow.Size = UDim2.new(1, 20, 1, 20)
shadow.Position = UDim2.new(0, -10, 0, -10)
shadow.BackgroundColor3 = Color3.fromRGB(100, 60, 180)
shadow.BackgroundTransparency = 0.85
shadow.BorderSizePixel = 0
shadow.ZIndex = -1
shadow.Parent = main
Instance.new("UICorner", shadow).CornerRadius = UDim.new(0, 20)

local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 52)
header.BackgroundColor3 = C_PANEL
header.BorderSizePixel = 0
header.Parent = main
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 16)
local headerFix = Instance.new("Frame")
headerFix.Size = UDim2.new(1, 0, 0, 18)
headerFix.Position = UDim2.new(0, 0, 1, -18)
headerFix.BackgroundColor3 = C_PANEL
headerFix.BorderSizePixel = 0
headerFix.Parent = header
local grad = Instance.new("UIGradient")
grad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(110, 55, 200)),
    ColorSequenceKeypoint.new(0.5, C_ACCENT),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 150, 255))
})
grad.Parent = header
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -50, 1, 0)
title.Position = UDim2.new(0, 20, 0, 0)
title.BackgroundTransparency = 1
title.Text = "KOLBASKA HUB"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header
local versionLabel = Instance.new("TextLabel")
versionLabel.Size = UDim2.new(0, 80, 1, 0)
versionLabel.Position = UDim2.new(1, -130, 0, 0)
versionLabel.BackgroundTransparency = 1
versionLabel.Text = "v2 FINAL"
versionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
versionLabel.Font = Enum.Font.GothamBold
versionLabel.TextSize = 11
versionLabel.TextXAlignment = Enum.TextXAlignment.Right
versionLabel.Parent = header
local closeBtnTop = Instance.new("TextButton")
closeBtnTop.Size = UDim2.new(0, 28, 0, 28)
closeBtnTop.Position = UDim2.new(1, -36, 0.5, -14)
closeBtnTop.BackgroundColor3 = Color3.fromRGB(60, 20, 60)
closeBtnTop.BorderSizePixel = 0
closeBtnTop.Text = "✕"
closeBtnTop.TextColor3 = Color3.fromRGB(255, 180, 220)
closeBtnTop.Font = Enum.Font.GothamBold
closeBtnTop.TextSize = 14
closeBtnTop.AutoButtonColor = false
closeBtnTop.Parent = header
Instance.new("UICorner", closeBtnTop).CornerRadius = UDim.new(0, 8)
closeBtnTop.MouseButton1Click:Connect(function()
    TweenService:Create(main, TweenInfo.new(0.3), {Size = UDim2.new(0, 0, 0, 0)}):Play()
    task.wait(0.3)
    gui:Destroy()
end)

local searchFrame = Instance.new("Frame")
searchFrame.Size = UDim2.new(0, 620, 0, 32)
searchFrame.Position = UDim2.new(0, 0, 0, 58)
searchFrame.BackgroundColor3 = C_PANEL2
searchFrame.BorderSizePixel = 0
searchFrame.Parent = main
Instance.new("UICorner", searchFrame).CornerRadius = UDim.new(0, 8)
local searchInput = Instance.new("TextBox")
searchInput.Size = UDim2.new(1, -30, 1, 0)
searchInput.Position = UDim2.new(0, 15, 0, 0)
searchInput.BackgroundTransparency = 1
searchInput.Text = ""
searchInput.PlaceholderText = "🔍 Поиск функций..."
searchInput.PlaceholderColor3 = C_TEXT_DIM
searchInput.TextColor3 = C_TEXT
searchInput.Font = Enum.Font.Gotham
searchInput.TextSize = 12
searchInput.TextXAlignment = Enum.TextXAlignment.Left
searchInput.ClearTextOnFocus = false
searchInput.Parent = searchFrame

local tabsBar = Instance.new("Frame")
tabsBar.Size = UDim2.new(1, -20, 0, 30)
tabsBar.Position = UDim2.new(0, 10, 0, 98)
tabsBar.BackgroundTransparency = 1
tabsBar.Parent = main
local tabsLayout = Instance.new("UIListLayout")
tabsLayout.FillDirection = Enum.FillDirection.Horizontal
tabsLayout.Padding = UDim.new(0, 5)
tabsLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabsLayout.Parent = tabsBar
local tabsContainer = Instance.new("Frame")
tabsContainer.Size = UDim2.new(1, -20, 1, -180)
tabsContainer.Position = UDim2.new(0, 10, 0, 136)
tabsContainer.BackgroundTransparency = 1
tabsContainer.Parent = main
local tabs = {}
local tabButtons = {}
local currentTab = "Visuals"
local allButtons = {}

local function createTab(name, width)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, width or 90, 1, 0)
    btn.BackgroundColor3 = C_BTN
    btn.BorderSizePixel = 0
    btn.Text = name
    btn.TextColor3 = C_TEXT
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 11
    btn.AutoButtonColor = false
    btn.Parent = tabsBar
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    local scroll = Instance.new("ScrollingFrame")
    scroll.Size = UDim2.new(1, 0, 1, 0)
    scroll.BackgroundTransparency = 1
    scroll.BorderSizePixel = 0
    scroll.ScrollBarThickness = 5
    scroll.ScrollBarImageColor3 = C_ACCENT
    scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scroll.Visible = false
    scroll.Parent = tabsContainer
    local layout = Instance.new("UIGridLayout")
    layout.CellSize = UDim2.new(0, 188, 0, 38)
    layout.CellPadding = UDim2.new(0, 8, 0, 8)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = scroll
    tabs[name] = scroll
    tabButtons[name] = btn
    btn.MouseButton1Click:Connect(function()
        currentTab = name
        for tabName, s in pairs(tabs) do
            s.Visible = (tabName == name)
            local b = tabButtons[tabName]
            if b then
                TweenService:Create(b, TweenInfo.new(0.15), {
                    BackgroundColor3 = (tabName == name) and C_ACCENT or C_BTN,
                    TextColor3 = (tabName == name) and Color3.fromRGB(255, 255, 255) or C_TEXT
                }):Play()
            end
        end
    end)
    btn.MouseEnter:Connect(function()
        if currentTab ~= name then
            TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = C_BTN_HOV}):Play()
        end
    end)
    btn.MouseLeave:Connect(function()
        if currentTab ~= name then
            TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = C_BTN}):Play()
        end
    end)
    return scroll
end

local visualsTab = createTab("Visuals", 100)
local scriptsTab = createTab("Scripts", 100)
local devTab = createTab("Dev", 70)
local exploitsTab = createTab("Exploits", 100)
local funTab = createTab("Fun", 70)
local settingsTab = createTab("Settings", 100)

tabs["Visuals"].Visible = true
TweenService:Create(tabButtons["Visuals"], TweenInfo.new(0.1), {
    BackgroundColor3 = C_ACCENT,
    TextColor3 = Color3.fromRGB(255, 255, 255)
}):Play()

local watermark = Instance.new("TextLabel")
watermark.Size = UDim2.new(1, -20, 0, 20)
watermark.Position = UDim2.new(0, 10, 1, -50)
watermark.BackgroundTransparency = 1
watermark.Text = "KOLBASKA HUB v2 FINAL • @kolbaska_vkusnoa"
watermark.TextColor3 = C_TEXT_DIM
watermark.Font = Enum.Font.Gotham
watermark.TextSize = 10
watermark.Parent = main

local notifContainer = Instance.new("Frame")
notifContainer.Size = UDim2.new(0, 280, 1, 0)
notifContainer.Position = UDim2.new(1, 20, 0, 0)
notifContainer.BackgroundTransparency = 1
notifContainer.Parent = gui
local notifLayout = Instance.new("UIListLayout")
notifLayout.Padding = UDim.new(0, 6)
notifLayout.SortOrder = Enum.SortOrder.LayoutOrder
notifLayout.Parent = notifContainer
local function notify(text, color)
    color = color or C_ACCENT
    local n = Instance.new("Frame")
    n.Size = UDim2.new(1, 0, 0, 38)
    n.BackgroundColor3 = C_PANEL
    n.BorderSizePixel = 0
    n.Parent = notifContainer
    Instance.new("UICorner", n).CornerRadius = UDim.new(0, 8)
    local ns = Instance.new("UIStroke")
    ns.Color = color
    ns.Thickness = 1.5
    ns.Transparency = 0.3
    ns.Parent = n
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -20, 1, 0)
    lbl.Position = UDim2.new(0, 10, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = C_TEXT
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 12
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = n
    n.Position = UDim2.new(1, 0, 0, 0)
    TweenService:Create(n, TweenInfo.new(0.3), {Position = UDim2.new(0, 0, 0, 0)}):Play()
    task.delay(3, function()
        TweenService:Create(n, TweenInfo.new(0.3), {Position = UDim2.new(1, 0, 0, 0)}):Play()
        task.wait(0.3)
        n:Destroy()
    end)
end

local settingsPanel = nil
local function closeSettingsPanel()
    if settingsPanel then settingsPanel:Destroy() settingsPanel = nil end
end
local function openSettingsPanel(functionName, options)
    closeSettingsPanel()
    settingsPanel = Instance.new("Frame")
    settingsPanel.Size = UDim2.new(0, 300, 0, 60 + (#options * 46))
    settingsPanel.Position = UDim2.new(0.5, -150, 0.5, -120)
    settingsPanel.BackgroundColor3 = C_BG
    settingsPanel.BorderSizePixel = 0
    settingsPanel.Active = false
    settingsPanel.Draggable = false
    settingsPanel.ZIndex = 10
    settingsPanel.Parent = gui
    Instance.new("UICorner", settingsPanel).CornerRadius = UDim.new(0, 12)
    local ps = Instance.new("UIStroke")
    ps.Color = C_ACCENT
    ps.Thickness = 2
    ps.Parent = settingsPanel
    local ptitle = Instance.new("TextLabel")
    ptitle.Size = UDim2.new(1, -40, 0, 36)
    ptitle.Position = UDim2.new(0, 12, 0, 6)
    ptitle.BackgroundTransparency = 1
    ptitle.Text = "⚙ " .. functionName
    ptitle.TextColor3 = C_ACCENT2
    ptitle.Font = Enum.Font.GothamBold
    ptitle.TextSize = 13
    ptitle.TextXAlignment = Enum.TextXAlignment.Left
    ptitle.ZIndex = 11
    ptitle.Parent = settingsPanel
    local closeP = Instance.new("TextButton")
    closeP.Size = UDim2.new(0, 24, 0, 24)
    closeP.Position = UDim2.new(1, -32, 0, 12)
    closeP.BackgroundColor3 = C_RED
    closeP.BorderSizePixel = 0
    closeP.Text = "✕"
    closeP.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeP.Font = Enum.Font.GothamBold
    closeP.TextSize = 11
    closeP.AutoButtonColor = false
    closeP.ZIndex = 11
    closeP.Parent = settingsPanel
    Instance.new("UICorner", closeP).CornerRadius = UDim.new(0, 6)
    closeP.MouseButton1Click:Connect(closeSettingsPanel)
    local y = 46
    for _, opt in ipairs(options) do
        local lbl = Instance.new("TextLabel")
        lbl.Size = UDim2.new(1, -24, 0, 16)
        lbl.Position = UDim2.new(0, 12, 0, y)
        lbl.BackgroundTransparency = 1
        lbl.Text = opt.label
        lbl.TextColor3 = C_TEXT_DIM
        lbl.Font = Enum.Font.Gotham
        lbl.TextSize = 10
        lbl.TextXAlignment = Enum.TextXAlignment.Left
        lbl.ZIndex = 11
        lbl.Parent = settingsPanel
        if opt.type == "slider" then
            local sliderBg = Instance.new("Frame")
            sliderBg.Size = UDim2.new(1, -24, 0, 18)
            sliderBg.Position = UDim2.new(0, 12, 0, y + 18)
            sliderBg.BackgroundColor3 = C_BTN
            sliderBg.BorderSizePixel = 0
            sliderBg.ZIndex = 11
            sliderBg.Parent = settingsPanel
            Instance.new("UICorner", sliderBg).CornerRadius = UDim.new(0, 6)
            local fill = Instance.new("Frame")
            local initRel = (opt.value - opt.min) / (opt.max - opt.min)
            fill.Size = UDim2.new(initRel, 0, 1, 0)
            fill.BackgroundColor3 = C_ACCENT
            fill.BorderSizePixel = 0
            fill.ZIndex = 12
            fill.Parent = sliderBg
            Instance.new("UICorner", fill).CornerRadius = UDim.new(0, 6)
            local valLbl = Instance.new("TextLabel")
            valLbl.Size = UDim2.new(0, 60, 0, 18)
            valLbl.Position = UDim2.new(1, -64, 0, y + 18)
            valLbl.BackgroundTransparency = 1
            valLbl.Text = tostring(opt.value)
            valLbl.TextColor3 = C_ACCENT2
            valLbl.Font = Enum.Font.GothamBold
            valLbl.TextSize = 11
            valLbl.ZIndex = 11
            valLbl.Parent = settingsPanel
            local dragging = false
            sliderBg.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                end
            end)
            sliderBg.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = false
                end
            end)
            UserInputService.InputChanged:Connect(function(input)
                if not dragging then return end
                if input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch then return end
                if not sliderBg.Parent then dragging = false return end
                local rel = (input.Position.X - sliderBg.AbsolutePosition.X) / sliderBg.AbsoluteSize.X
                rel = math.clamp(rel, 0, 1)
                local val = opt.min + (opt.max - opt.min) * rel
                val = math.floor(val * 10) / 10
                fill.Size = UDim2.new(rel, 0, 1, 0)
                valLbl.Text = tostring(val)
                pcall(opt.callback, val)
            end)
            y = y + 50
        elseif opt.type == "color" then
            local colorRow = Instance.new("Frame")
            colorRow.Size = UDim2.new(1, -24, 0, 22)
            colorRow.Position = UDim2.new(0, 12, 0, y + 18)
            colorRow.BackgroundTransparency = 1
            colorRow.ZIndex = 11
            colorRow.Parent = settingsPanel
            local colors = {
                Color3.fromRGB(170, 110, 255),
                Color3.fromRGB(255, 100, 200),
                Color3.fromRGB(100, 200, 255),
                Color3.fromRGB(100, 255, 150),
                Color3.fromRGB(255, 200, 100),
                Color3.fromRGB(255, 80, 80),
                Color3.fromRGB(255, 255, 255),
            }
            for i, col in ipairs(colors) do
                local cb = Instance.new("TextButton")
                cb.Size = UDim2.new(0, 26, 1, 0)
                cb.Position = UDim2.new(0, (i - 1) * 30, 0, 0)
                cb.BackgroundColor3 = col
                cb.BorderSizePixel = 0
                cb.Text = ""
                cb.AutoButtonColor = false
                cb.ZIndex = 12
                cb.Parent = colorRow
                Instance.new("UICorner", cb).CornerRadius = UDim.new(1, 0)
                cb.MouseButton1Click:Connect(function()
                    pcall(opt.callback, col)
                end)
            end
            y = y + 48
        end
    end
end

local function makeButton(parentTab, text, callback, rightClickOptions)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 188, 0, 38)
    btn.BackgroundColor3 = C_BTN
    btn.BorderSizePixel = 0
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.Parent = parentTab
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    local btnStroke = Instance.new("UIStroke")
    btnStroke.Color = C_BORDER
    btnStroke.Thickness = 1
    btnStroke.Transparency = 0.6
    btnStroke.Parent = btn
    local indicator = Instance.new("Frame")
    indicator.Size = UDim2.new(0, 8, 0, 8)
    indicator.Position = UDim2.new(0, 12, 0.5, -4)
    indicator.BackgroundColor3 = C_TEXT_DIM
    indicator.BorderSizePixel = 0
    indicator.Parent = btn
    Instance.new("UICorner", indicator).CornerRadius = UDim.new(1, 0)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -60, 1, 0)
    label.Position = UDim2.new(0, 28, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = C_TEXT
    label.Font = Enum.Font.Gotham
    label.TextSize = 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = btn
    if rightClickOptions then
        local gearBtn = Instance.new("TextButton")
        gearBtn.Size = UDim2.new(0, 22, 0, 22)
        gearBtn.Position = UDim2.new(1, -26, 0.5, -11)
        gearBtn.BackgroundColor3 = C_ACCENT
        gearBtn.BackgroundTransparency = 0.7
        gearBtn.BorderSizePixel = 0
        gearBtn.Text = "⚙"
        gearBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        gearBtn.Font = Enum.Font.GothamBold
        gearBtn.TextSize = 12
        gearBtn.AutoButtonColor = false
        gearBtn.ZIndex = 2
        gearBtn.Parent = btn
        Instance.new("UICorner", gearBtn).CornerRadius = UDim.new(0, 6)
        gearBtn.MouseEnter:Connect(function()
            TweenService:Create(gearBtn, TweenInfo.new(0.15), {BackgroundTransparency = 0}):Play()
        end)
        gearBtn.MouseLeave:Connect(function()
            TweenService:Create(gearBtn, TweenInfo.new(0.15), {BackgroundTransparency = 0.7}):Play()
        end)
        gearBtn.MouseButton1Click:Connect(function()
            openSettingsPanel(text, rightClickOptions)
        end)
    end
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = C_BTN_HOV}):Play()
        TweenService:Create(btnStroke, TweenInfo.new(0.15), {Transparency = 0}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = C_BTN}):Play()
        TweenService:Create(btnStroke, TweenInfo.new(0.15), {Transparency = 0.6}):Play()
    end)
    btn.MouseButton1Click:Connect(function()
        callback(btn, indicator)
    end)
    table.insert(allButtons, { btn = btn, label = label })
    return btn, indicator
end

local function setOn(btn, ind)
    TweenService:Create(ind, TweenInfo.new(0.2), {BackgroundColor3 = C_ACCENT}):Play()
    TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(55, 35, 85)}):Play()
end
local function setOff(btn, ind)
    TweenService:Create(ind, TweenInfo.new(0.2), {BackgroundColor3 = C_TEXT_DIM}):Play()
    TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = C_BTN}):Play()
end

searchInput:GetPropertyChangedSignal("Text"):Connect(function()
    local query = string.lower(searchInput.Text)
    for _, data in ipairs(allButtons) do
        if query == "" then
            data.btn.Visible = true
        else
            local match = string.find(string.lower(data.label.Text), query, 1, true)
            data.btn.Visible = match ~= nil
        end
    end
end)

bindsList = {}
bindActions = {}
local function addBind(keyCode, name, callback)
    table.insert(bindsList, { key = keyCode, name = name, callback = callback })
end
UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    for _, bind in ipairs(bindsList) do
        if input.KeyCode == bind.key then pcall(bind.callback) end
    end
end)

local config = {
    chinaHatColor = C_ACCENT,
    chinaHatSize = 1.4,
    chinaHatTransparency = 0.2,
    auraRadius = 3,
    auraSpeed = 120,
    auraColor = C_ACCENT,
    haloColor = Color3.fromRGB(255, 230, 100),
    wingsColor = C_ACCENT,
    speedValue = 50,
    flySpeed = 60,
    skyColor = C_ACCENT,
    skyFogEnd = 500,
    skyFogStart = 50,
    fullbrightBright = 3,
    particleSize = 3.0,
    particleTexture = "rbxassetid://243660364",
    skyboxName = "Default",
    skyTime = 14,
}

-- CHINA HAT
chinaHatPart = nil
chinaHatOn = false
local function createChinaHat()
    local char = LocalPlayer.Character
    if not char then return end
    local head = char:FindFirstChild("Head")
    if not head then return end
    if chinaHatPart then chinaHatPart:Destroy() end
    local hatPart = Instance.new("Part")
    hatPart.Size = Vector3.new(1, 1, 1)
    hatPart.Color = config.chinaHatColor
    hatPart.Material = Enum.Material.Neon
    hatPart.Transparency = config.chinaHatTransparency
    hatPart.Anchored = false
    hatPart.CanCollide = false
    hatPart.Massless = true
    hatPart.CFrame = head.CFrame
    local mesh = Instance.new("SpecialMesh")
    mesh.MeshType = Enum.MeshType.FileMesh
    mesh.MeshId = "rbxassetid://1033714"
    mesh.TextureId = ""
    local c = config.chinaHatColor
    mesh.VertexColor = Vector3.new(c.R, c.G, c.B)
    mesh.Scale = Vector3.new(config.chinaHatSize, config.chinaHatSize, config.chinaHatSize)
    mesh.Offset = Vector3.new(0, 0.9, 0)
    mesh.Parent = hatPart
    local light = Instance.new("PointLight")
    light.Color = config.chinaHatColor
    light.Brightness = 2.5
    light.Range = 4
    light.Shadows = false
    light.Parent = hatPart
    local weld = Instance.new("WeldConstraint")
    weld.Part0 = head
    weld.Part1 = hatPart
    weld.Parent = hatPart
    hatPart.Parent = char
    chinaHatPart = hatPart
end
local function removeChinaHat()
    if chinaHatPart then chinaHatPart:Destroy() chinaHatPart = nil end
end
local function toggleChinaHat()
    chinaHatOn = not chinaHatOn
    if chinaHatOn then createChinaHat() else removeChinaHat() end
end
makeButton(visualsTab, "China Hat", function(btn, ind)
    toggleChinaHat()
    if chinaHatOn then setOn(btn, ind) else setOff(btn, ind) end
    notify(chinaHatOn and "China Hat вкл" or "China Hat выкл")
end, {
    { type = "color", label = "Цвет", callback = function(c) config.chinaHatColor = c; if chinaHatOn then createChinaHat() end end },
    { type = "slider", label = "Размер", min = 0.5, max = 3, value = config.chinaHatSize, callback = function(v) config.chinaHatSize = v; if chinaHatOn then createChinaHat() end end },
    { type = "slider", label = "Прозрачность", min = 0, max = 1, value = config.chinaHatTransparency, callback = function(v) config.chinaHatTransparency = v; if chinaHatOn then createChinaHat() end end },
})
bindActions["China Hat"] = toggleChinaHat

rainbowHatOn = false
local function toggleRainbowHat()
    rainbowHatOn = not rainbowHatOn
    if rainbowHatOn then
        if not chinaHatOn then toggleChinaHat() end
        task.spawn(function()
            while rainbowHatOn do
                if chinaHatPart and chinaHatPart.Parent then
                    local hue = (tick() * 0.5) % 1
                    local color = Color3.fromHSV(hue, 0.7, 1)
                    chinaHatPart.Color = color
                    local mesh = chinaHatPart:FindFirstChildOfClass("SpecialMesh")
                    if mesh then mesh.VertexColor = Vector3.new(color.R, color.G, color.B) end
                end
                task.wait(0.05)
            end
        end)
    else
        if chinaHatPart then
            chinaHatPart.Color = config.chinaHatColor
            local mesh = chinaHatPart:FindFirstChildOfClass("SpecialMesh")
            if mesh then
                local c = config.chinaHatColor
                mesh.VertexColor = Vector3.new(c.R, c.G, c.B)
            end
        end
    end
end
makeButton(visualsTab, "Rainbow Hat", function(btn, ind) toggleRainbowHat(); if rainbowHatOn then setOn(btn, ind) else setOff(btn, ind) end; notify(rainbowHatOn and "Rainbow вкл" or "Rainbow выкл") end)
bindActions["Rainbow Hat"] = toggleRainbowHat

auraFolder = nil
auraOn = false
auraConnection = nil
local function createAura()
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    if auraFolder then auraFolder:Destroy() end
    auraFolder = Instance.new("Folder")
    auraFolder.Parent = workspace
    local parts = {}
    for i = 1, 30 do
        local angle = (i / 30) * math.pi * 2
        local part = Instance.new("Part")
        part.Size = Vector3.new(0.5, 0.15, 0.5)
        part.Color = config.auraColor
        part.Material = Enum.Material.Neon
        part.Transparency = 0.2
        part.Anchored = true
        part.CanCollide = false
        part.CFrame = hrp.CFrame * CFrame.new(math.cos(angle) * config.auraRadius, -2.5, math.sin(angle) * config.auraRadius)
        part.Parent = auraFolder
        table.insert(parts, part)
    end
    local rot = 0
    if auraConnection then auraConnection:Disconnect() end
    auraConnection = RunService.Heartbeat:Connect(function(dt)
        if not auraFolder or not auraFolder.Parent then
            if auraConnection then auraConnection:Disconnect() auraConnection = nil end
            return
        end
        local c = LocalPlayer.Character
        local h = c and c:FindFirstChild("HumanoidRootPart")
        if h then
            rot = rot + math.rad(config.auraSpeed) * dt
            for i, p in ipairs(parts) do
                local angle = (i / #parts) * math.pi * 2 + rot
                p.CFrame = h.CFrame * CFrame.new(math.cos(angle) * config.auraRadius, -2.5, math.sin(angle) * config.auraRadius)
            end
        end
    end)
end
local function removeAura()
    if auraConnection then auraConnection:Disconnect() auraConnection = nil end
    if auraFolder then auraFolder:Destroy() auraFolder = nil end
end
local function toggleAura()
    auraOn = not auraOn
    if auraOn then createAura() else removeAura() end
end
makeButton(visualsTab, "Aura", function(btn, ind)
    toggleAura()
    if auraOn then setOn(btn, ind) else setOff(btn, ind) end
    notify(auraOn and "Aura вкл" or "Aura выкл")
end, {
    { type = "color", label = "Цвет", callback = function(c) config.auraColor = c; if auraOn then createAura() end end },
    { type = "slider", label = "Радиус", min = 1, max = 8, value = config.auraRadius, callback = function(v) config.auraRadius = v; if auraOn then createAura() end end },
    { type = "slider", label = "Скорость", min = 30, max = 360, value = config.auraSpeed, callback = function(v) config.auraSpeed = v end },
})
bindActions["Aura"] = toggleAura

rgbAuraOn = false
local function toggleRgbAura()
    rgbAuraOn = not rgbAuraOn
    if rgbAuraOn then
        if not auraOn then toggleAura() end
        task.spawn(function()
            while rgbAuraOn do
                if auraFolder then
                    for i, p in ipairs(auraFolder:GetChildren()) do
                        if p:IsA("BasePart") then
                            local hue = ((tick() * 0.3) + (i / 30)) % 1
                            p.Color = Color3.fromHSV(hue, 0.8, 1)
                        end
                    end
                end
                task.wait(0.05)
            end
        end)
    else
        if auraFolder then
            for _, p in ipairs(auraFolder:GetChildren()) do
                if p:IsA("BasePart") then p.Color = config.auraColor end
            end
        end
    end
end
makeButton(visualsTab, "RGB Aura", function(btn, ind) toggleRgbAura(); if rgbAuraOn then setOn(btn, ind) else setOff(btn, ind) end; notify(rgbAuraOn and "RGB Aura вкл" or "RGB Aura выкл") end)
bindActions["RGB Aura"] = toggleRgbAura

-- ============================================
-- 7 НОВЫХ ВИЗУАЛОВ (в Части 1)
-- ============================================

-- WISPS
wispsOn = false
wispsFolder = nil
wispsConn = nil
local function toggleWisps()
    wispsOn = not wispsOn
    if wispsOn then
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        wispsFolder = Instance.new("Folder")
        wispsFolder.Parent = workspace
        local wisps = {}
        for i = 1, 12 do
            local p = Instance.new("Part")
            p.Shape = Enum.PartType.Ball
            p.Size = Vector3.new(0.25, 0.25, 0.25)
            p.Color = Color3.fromHSV(math.random(), 0.7, 1)
            p.Material = Enum.Material.Neon
            p.Transparency = 0.2
            p.Anchored = true
            p.CanCollide = false
            p.Parent = wispsFolder
            table.insert(wisps, { part = p, angle = (i / 12) * math.pi * 2, y = math.random() * 3, phase = math.random() * math.pi * 2 })
        end
        if wispsConn then wispsConn:Disconnect() end
        wispsConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            for _, data in ipairs(wisps) do
                local a = data.angle + tick() * 0.8
                local wave = math.sin(tick() * 2 + data.phase) * 0.5
                data.part.CFrame = h.CFrame * CFrame.new(math.cos(a) * 2.5, -1 + data.y + wave, math.sin(a) * 2.5)
                data.part.Color = Color3.fromHSV((tick() * 0.2 + data.angle / (math.pi * 2)) % 1, 0.8, 1)
            end
        end)
    else
        if wispsConn then wispsConn:Disconnect() wispsConn = nil end
        if wispsFolder then wispsFolder:Destroy() wispsFolder = nil end
    end
end
makeButton(visualsTab, "Wisps", function(btn, ind) toggleWisps(); if wispsOn then setOn(btn, ind) else setOff(btn, ind) end; notify(wispsOn and "Wisps вкл" or "Wisps выкл") end)
bindActions["Wisps"] = toggleWisps

-- STARFIELD
starfieldOn = false
starfieldFolder = nil
starfieldConn = nil
local function toggleStarfield()
    starfieldOn = not starfieldOn
    if starfieldOn then
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        starfieldFolder = Instance.new("Folder")
        starfieldFolder.Parent = workspace
        local stars = {}
        for i = 1, 60 do
            local p = Instance.new("Part")
            p.Shape = Enum.PartType.Ball
            local size = math.random(3, 10) / 100
            p.Size = Vector3.new(size, size, size)
            p.Color = Color3.fromRGB(255, 255, 255)
            p.Material = Enum.Material.Neon
            p.Anchored = true
            p.CanCollide = false
            p.Parent = starfieldFolder
            table.insert(stars, {
                part = p,
                radius = math.random() * 20 + 5,
                theta = math.random() * math.pi * 2,
                phi = math.random() * math.pi,
                speed = 0.1 + math.random() * 0.3
            })
        end
        if starfieldConn then starfieldConn:Disconnect() end
        starfieldConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            for _, data in ipairs(stars) do
                data.theta = data.theta + data.speed * 0.02
                data.phi = data.phi + data.speed * 0.01
                local x = data.radius * math.sin(data.phi) * math.cos(data.theta)
                local y = data.radius * math.cos(data.phi)
                local z = data.radius * math.sin(data.phi) * math.sin(data.theta)
                data.part.CFrame = h.CFrame * CFrame.new(x, y, z)
            end
        end)
    else
        if starfieldConn then starfieldConn:Disconnect() starfieldConn = nil end
        if starfieldFolder then starfieldFolder:Destroy() starfieldFolder = nil end
    end
end
makeButton(visualsTab, "Starfield", function(btn, ind) toggleStarfield(); if starfieldOn then setOn(btn, ind) else setOff(btn, ind) end; notify(starfieldOn and "Starfield вкл" or "Starfield выкл") end)
bindActions["Starfield"] = toggleStarfield

-- LIGHTNING BELT
beltOn = false
beltFolder = nil
beltConn = nil
local function toggleBelt()
    beltOn = not beltOn
    if beltOn then
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        beltFolder = Instance.new("Folder")
        beltFolder.Parent = workspace
        local bolts = {}
        for i = 1, 18 do
            local p = Instance.new("Part")
            p.Size = Vector3.new(0.15, 0.6, 0.15)
            p.Color = Color3.fromRGB(150, 200, 255)
            p.Material = Enum.Material.Neon
            p.Transparency = 0.2
            p.Anchored = true
            p.CanCollide = false
            p.Parent = beltFolder
            table.insert(bolts, { part = p, angle = (i / 18) * math.pi * 2 })
        end
        if beltConn then beltConn:Disconnect() end
        beltConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            local tilt = math.sin(tick() * 2) * 15
            for _, data in ipairs(bolts) do
                local a = data.angle + tick() * 4
                data.part.CFrame = h.CFrame * CFrame.new(math.cos(a) * 2.8, -1.5, math.sin(a) * 2.8) * CFrame.Angles(0, a, math.rad(tilt + math.sin(tick() * 6) * 20))
                data.part.Color = Color3.fromHSV(0.55 + math.sin(tick() * 5 + data.angle) * 0.05, 0.7, 1)
            end
        end)
    else
        if beltConn then beltConn:Disconnect() beltConn = nil end
        if beltFolder then beltFolder:Destroy() beltFolder = nil end
    end
end
makeButton(visualsTab, "Lightning Belt", function(btn, ind) toggleBelt(); if beltOn then setOn(btn, ind) else setOff(btn, ind) end; notify(beltOn and "Belt вкл" or "Belt выкл") end)
bindActions["Lightning Belt"] = toggleBelt

-- PLASMA CLOUDS
cloudsOn = false
cloudsFolder = nil
cloudsConn = nil
local function toggleClouds()
    cloudsOn = not cloudsOn
    if cloudsOn then
        cloudsFolder = Instance.new("Folder")
        cloudsFolder.Parent = workspace
        local clouds = {}
        for i = 1, 8 do
            local p = Instance.new("Part")
            p.Shape = Enum.PartType.Ball
            p.Size = Vector3.new(1.5, 1.5, 1.5)
            p.Color = Color3.fromHSV(math.random(), 0.5, 1)
            p.Material = Enum.Material.Neon
            p.Transparency = 0.6
            p.Anchored = true
            p.CanCollide = false
            p.Parent = cloudsFolder
            table.insert(clouds, { part = p, offset = Vector3.new(math.random(-5, 5), math.random(-2, 4), math.random(-5, 5)), phase = math.random() * math.pi * 2, hue = math.random() })
        end
        if cloudsConn then cloudsConn:Disconnect() end
        cloudsConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            for _, data in ipairs(clouds) do
                local float = Vector3.new(0, math.sin(tick() + data.phase) * 0.5, 0)
                data.part.CFrame = h.CFrame * CFrame.new(data.offset + float)
                data.part.Color = Color3.fromHSV((data.hue + tick() * 0.1) % 1, 0.5, 1)
                local size = 1.5 + math.sin(tick() * 2 + data.phase) * 0.3
                data.part.Size = Vector3.new(size, size, size)
            end
        end)
    else
        if cloudsConn then cloudsConn:Disconnect() cloudsConn = nil end
        if cloudsFolder then cloudsFolder:Destroy() cloudsFolder = nil end
    end
end
makeButton(visualsTab, "Plasma Clouds", function(btn, ind) toggleClouds(); if cloudsOn then setOn(btn, ind) else setOff(btn, ind) end; notify(cloudsOn and "Clouds вкл" or "Clouds выкл") end)
bindActions["Plasma Clouds"] = toggleClouds

-- ORBITAL BEAMS
beamsOn = false
beamsFolder = nil
beamsConn = nil
local function toggleBeams()
    beamsOn = not beamsOn
    if beamsOn then
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        beamsFolder = Instance.new("Folder")
        beamsFolder.Parent = workspace
        local beams = {}
        for i = 1, 6 do
            local p = Instance.new("Part")
            p.Size = Vector3.new(0.1, 0.1, 5)
            p.Color = C_ACCENT
            p.Material = Enum.Material.Neon
            p.Transparency = 0.3
            p.Anchored = true
            p.CanCollide = false
            p.Parent = beamsFolder
            table.insert(beams, { part = p, angle = (i / 6) * math.pi * 2 })
        end
        if beamsConn then beamsConn:Disconnect() end
        beamsConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            for _, data in ipairs(beams) do
                local a = data.angle + tick() * 2
                local tilt = math.sin(tick() * 3 + data.angle) * 30
                data.part.CFrame = h.CFrame * CFrame.new(math.cos(a) * 3, 0, math.sin(a) * 3) * CFrame.Angles(math.rad(tilt), a, 0)
                data.part.Color = Color3.fromHSV((tick() * 0.3 + data.angle) % 1, 0.8, 1)
            end
        end)
    else
        if beamsConn then beamsConn:Disconnect() beamsConn = nil end
        if beamsFolder then beamsFolder:Destroy() beamsFolder = nil end
    end
end
makeButton(visualsTab, "Orbital Beams", function(btn, ind) toggleBeams(); if beamsOn then setOn(btn, ind) else setOff(btn, ind) end; notify(beamsOn and "Beams вкл" or "Beams выкл") end)
bindActions["Orbital Beams"] = toggleBeams

-- PHANTOM CLONES
clonesOn = false
clonesFolder = nil
clonesConn = nil
local function toggleClones()
    clonesOn = not clonesOn
    if clonesOn then
        clonesFolder = Instance.new("Folder")
        clonesFolder.Parent = workspace
        local clones = {}
        local char = LocalPlayer.Character
        if not char then return end
        for i = 1, 3 do
            local clone = char:Clone()
            clone.Parent = clonesFolder
            local hum = clone:FindFirstChildOfClass("Humanoid")
            if hum then hum:Destroy() end
            for _, part in ipairs(clone:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Anchored = true
                    part.CanCollide = false
                    part.Transparency = 0.5
                    part.Color = C_ACCENT
                    part.Material = Enum.Material.Neon
                end
            end
            table.insert(clones, { model = clone, angle = (i / 3) * math.pi * 2, offset = i })
        end
        if clonesConn then clonesConn:Disconnect() end
        clonesConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            for _, data in ipairs(clones) do
                if not data.model.PrimaryPart then
                    for _, p in ipairs(data.model:GetDescendants()) do
                        if p.Name == "HumanoidRootPart" then data.model.PrimaryPart = p break end
                    end
                end
                local a = data.angle + tick() * 1.5
                local offsetPos = h.CFrame * CFrame.new(math.cos(a) * (3 + data.offset), 0, math.sin(a) * (3 + data.offset))
                if data.model.PrimaryPart then
                    data.model:SetPrimaryPartCFrame(offsetPos * CFrame.Angles(0, a + math.pi, 0))
                end
            end
        end)
    else
        if clonesConn then clonesConn:Disconnect() clonesConn = nil end
        if clonesFolder then clonesFolder:Destroy() clonesFolder = nil end
    end
end
makeButton(visualsTab, "Phantom Clones", function(btn, ind) toggleClones(); if clonesOn then setOn(btn, ind) else setOff(btn, ind) end; notify(clonesOn and "Clones вкл" or "Clones выкл") end)
bindActions["Phantom Clones"] = toggleClones

-- CROWN OF STARS
starCrownOn = false
starCrownFolder = nil
starCrownConn = nil
local function toggleStarCrown()
    starCrownOn = not starCrownOn
    if starCrownOn then
        local char = LocalPlayer.Character
        local head = char and char:FindFirstChild("Head")
        if not head then return end
        starCrownFolder = Instance.new("Folder")
        starCrownFolder.Parent = char
        local stars = {}
        for i = 1, 10 do
            local p = Instance.new("Part")
            p.Shape = Enum.PartType.Ball
            p.Size = Vector3.new(0.3, 0.3, 0.3)
            p.Color = Color3.fromRGB(255, 240, 150)
            p.Material = Enum.Material.Neon
            p.Anchored = false
            p.CanCollide = false
            p.Massless = true
            p.CFrame = head.CFrame * CFrame.new(0, 2, 0)
            local w = Instance.new("WeldConstraint")
            w.Part0 = head
            w.Part1 = p
            w.Parent = p
            p.Parent = starCrownFolder
            table.insert(stars, { part = p, angle = (i / 10) * math.pi * 2 })
        end
        if starCrownConn then starCrownConn:Disconnect() end
        starCrownConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("Head")
            if not h then return end
            for _, data in ipairs(stars) do
                local a = data.angle + tick() * 1.5
                local pulse = 1 + math.sin(tick() * 4 + data.angle) * 0.2
                data.part.CFrame = h.CFrame * CFrame.new(math.cos(a) * 1.5, 2 + math.sin(tick() * 3 + data.angle) * 0.2, math.sin(a) * 1.5)
                data.part.Size = Vector3.new(0.3 * pulse, 0.3 * pulse, 0.3 * pulse)
                data.part.Color = Color3.fromHSV((tick() * 0.3 + data.angle / (math.pi * 2)) % 1, 0.5, 1)
            end
        end)
    else
        if starCrownConn then starCrownConn:Disconnect() starCrownConn = nil end
        if starCrownFolder then starCrownFolder:Destroy() starCrownFolder = nil end
    end
end
makeButton(visualsTab, "Crown of Stars", function(btn, ind) toggleStarCrown(); if starCrownOn then setOn(btn, ind) else setOff(btn, ind) end; notify(starCrownOn and "Crown of Stars вкл" or "Crown of Stars выкл") end)
bindActions["Crown of Stars"] = toggleStarCrown

-- 🔻 ПРОДОЛЖЕНИЕ В ЧАСТИ 2/3 🔻-- ============================================
-- KOLBASKA HUB v3 FINAL — ЧАСТЬ 2/3
-- Visuals: Halo, Crown, Horns, Heart, Sword, Portal, Fire, Ice, Lightning
-- + Jump Circle, Particles, Name Tags, Fullbright, Custom Sky, Aspect, Crosshair, FOV Circle
-- + 12 крутых: Black Hole, Soul Flame, Energy Beam, Aura Wings, Rainbow Wave, Fire Ring,
--   Ice Crystals, Shadow Aura, Golden Aura, Laser Eyes, Snow Aura, Galaxy Orbit
-- + Trail, Head Aura, Snowflakes, Music Notes, Orbiting Orbs, Skull Aura, Galaxy Aura,
--   Lightning Aura, Tornado Aura, Fire Trail, Ice Trail, Footsteps, Angel Wings
-- ============================================

-- HALO
haloOn = false
haloFolder = nil
haloConn = nil
local function toggleHalo()
    haloOn = not haloOn
    if haloOn then
        local char = LocalPlayer.Character
        local head = char and char:FindFirstChild("Head")
        if not head then return end
        haloFolder = Instance.new("Folder")
        haloFolder.Parent = char
        local ring1 = Instance.new("Part")
        ring1.Shape = Enum.PartType.Cylinder
        ring1.Size = Vector3.new(0.12, 3, 3)
        ring1.Color = config.haloColor
        ring1.Material = Enum.Material.Neon
        ring1.Transparency = 0.1
        ring1.Anchored = false
        ring1.CanCollide = false
        ring1.Massless = true
        ring1.CFrame = head.CFrame * CFrame.new(0, 1.8, 0) * CFrame.Angles(0, 0, math.rad(90))
        local w1 = Instance.new("WeldConstraint")
        w1.Part0 = head
        w1.Part1 = ring1
        w1.Parent = ring1
        ring1.Parent = haloFolder
        local ring2 = Instance.new("Part")
        ring2.Shape = Enum.PartType.Cylinder
        ring2.Size = Vector3.new(0.08, 3.3, 3.3)
        ring2.Color = config.haloColor
        ring2.Material = Enum.Material.Neon
        ring2.Transparency = 0.55
        ring2.Anchored = false
        ring2.CanCollide = false
        ring2.Massless = true
        ring2.CFrame = head.CFrame * CFrame.new(0, 1.7, 0) * CFrame.Angles(0, 0, math.rad(90))
        local w2 = Instance.new("WeldConstraint")
        w2.Part0 = head
        w2.Part1 = ring2
        w2.Parent = ring2
        ring2.Parent = haloFolder
        local light = Instance.new("PointLight")
        light.Color = config.haloColor
        light.Brightness = 3
        light.Range = 7
        light.Parent = ring1
        if haloConn then haloConn:Disconnect() end
        haloConn = RunService.Heartbeat:Connect(function()
            if not ring1.Parent then return end
            local pulse = 1 + math.sin(tick() * 2) * 0.05
            ring1.Size = Vector3.new(0.12, 3 * pulse, 3 * pulse)
            ring2.Size = Vector3.new(0.08, 3.3 * pulse, 3.3 * pulse)
        end)
    else
        if haloConn then haloConn:Disconnect() haloConn = nil end
        if haloFolder then haloFolder:Destroy() haloFolder = nil end
    end
end
makeButton(visualsTab, "Halo", function(btn, ind) toggleHalo(); if haloOn then setOn(btn, ind) else setOff(btn, ind) end; notify(haloOn and "Halo вкл" or "Halo выкл") end, {
    { type = "color", label = "Цвет", callback = function(c) config.haloColor = c; if haloOn then toggleHalo() toggleHalo() end end },
})
bindActions["Halo"] = toggleHalo

-- CROWN
crownOn = false
crownFolder = nil
local function toggleCrown()
    crownOn = not crownOn
    if crownOn then
        local char = LocalPlayer.Character
        local head = char and char:FindFirstChild("Head")
        if not head then return end
        crownFolder = Instance.new("Folder")
        crownFolder.Parent = char
        local base = Instance.new("Part")
        base.Shape = Enum.PartType.Cylinder
        base.Size = Vector3.new(0.25, 2.2, 2.2)
        base.Color = Color3.fromRGB(255, 200, 50)
        base.Material = Enum.Material.Neon
        base.Anchored = false
        base.CanCollide = false
        base.Massless = true
        base.CFrame = head.CFrame * CFrame.new(0, 1.0, 0) * CFrame.Angles(0, 0, math.rad(90))
        local wb = Instance.new("WeldConstraint")
        wb.Part0 = head
        wb.Part1 = base
        wb.Parent = base
        base.Parent = crownFolder
        for i = 1, 8 do
            local angle = (i / 8) * math.pi * 2
            local height = (i % 2 == 0) and 1.2 or 0.8
            local spike = Instance.new("Part")
            spike.Size = Vector3.new(0.25, height, 0.25)
            spike.Color = Color3.fromRGB(255, 215, 0)
            spike.Material = Enum.Material.Neon
            spike.Anchored = false
            spike.CanCollide = false
            spike.Massless = true
            spike.CFrame = head.CFrame * CFrame.new(math.cos(angle) * 0.95, 1.3 + height / 2, math.sin(angle) * 0.95)
            local w = Instance.new("WeldConstraint")
            w.Part0 = head
            w.Part1 = spike
            w.Parent = spike
            spike.Parent = crownFolder
            local gem = Instance.new("Part")
            gem.Shape = Enum.PartType.Ball
            gem.Size = Vector3.new(0.18, 0.18, 0.18)
            gem.Color = Color3.fromHSV((i / 8), 0.8, 1)
            gem.Material = Enum.Material.Neon
            gem.Anchored = false
            gem.CanCollide = false
            gem.Massless = true
            gem.CFrame = head.CFrame * CFrame.new(math.cos(angle) * 0.95, 1.3 + height + 0.15, math.sin(angle) * 0.95)
            local wg = Instance.new("WeldConstraint")
            wg.Part0 = head
            wg.Part1 = gem
            wg.Parent = gem
            gem.Parent = crownFolder
        end
        local top = Instance.new("Part")
        top.Shape = Enum.PartType.Cylinder
        top.Size = Vector3.new(0.15, 2.0, 2.0)
        top.Color = Color3.fromRGB(255, 230, 100)
        top.Material = Enum.Material.Neon
        top.Anchored = false
        top.CanCollide = false
        top.Massless = true
        top.CFrame = head.CFrame * CFrame.new(0, 1.6, 0) * CFrame.Angles(0, 0, math.rad(90))
        local wt = Instance.new("WeldConstraint")
        wt.Part0 = head
        wt.Part1 = top
        wt.Parent = top
        top.Parent = crownFolder
        local light = Instance.new("PointLight")
        light.Color = Color3.fromRGB(255, 220, 80)
        light.Brightness = 3
        light.Range = 8
        light.Parent = base
    else
        if crownFolder then crownFolder:Destroy() crownFolder = nil end
    end
end
makeButton(visualsTab, "Crown", function(btn, ind) toggleCrown(); if crownOn then setOn(btn, ind) else setOff(btn, ind) end; notify(crownOn and "Crown вкл" or "Crown выкл") end)
bindActions["Crown"] = toggleCrown

-- HORNS (первая версия, простая)
hornsOn = false
hornsFolder = nil
local function toggleHorns()
    hornsOn = not hornsOn
    if hornsOn then
        local char = LocalPlayer.Character
        local head = char and char:FindFirstChild("Head")
        if not head then return end
        hornsFolder = Instance.new("Folder")
        hornsFolder.Parent = char
        for _, side in ipairs({-1, 1}) do
            for i = 1, 3 do
                local size = 0.35 - (i - 1) * 0.08
                local height = 0.5 - (i - 1) * 0.05
                local yOffset = 1.1 + (i - 1) * 0.45
                local xOffset = side * (0.45 + (i - 1) * 0.08)
                local tilt = side * (15 + i * 10)
                local seg = Instance.new("Part")
                seg.Size = Vector3.new(size, height, size)
                seg.Color = Color3.fromRGB(200, 50, 50)
                seg.Material = Enum.Material.Neon
                seg.Anchored = false
                seg.CanCollide = false
                seg.Massless = true
                seg.CFrame = head.CFrame * CFrame.new(xOffset, yOffset, 0) * CFrame.Angles(0, 0, math.rad(tilt))
                local w = Instance.new("WeldConstraint")
                w.Part0 = head
                w.Part1 = seg
                w.Parent = seg
                seg.Parent = hornsFolder
            end
            local tip = Instance.new("Part")
            tip.Shape = Enum.PartType.Ball
            tip.Size = Vector3.new(0.15, 0.15, 0.15)
            tip.Color = Color3.fromRGB(255, 100, 100)
            tip.Material = Enum.Material.Neon
            tip.Anchored = false
            tip.CanCollide = false
            tip.Massless = true
            tip.CFrame = head.CFrame * CFrame.new(side * 0.7, 2.4, 0)
            local wt = Instance.new("WeldConstraint")
            wt.Part0 = head
            wt.Part1 = tip
            wt.Parent = tip
            tip.Parent = hornsFolder
        end
    else
        if hornsFolder then hornsFolder:Destroy() hornsFolder = nil end
    end
end
makeButton(visualsTab, "Horns", function(btn, ind) toggleHorns(); if hornsOn then setOn(btn, ind) else setOff(btn, ind) end; notify(hornsOn and "Horns вкл" or "Horns выкл") end)
bindActions["Horns"] = toggleHorns

-- JUMP CIRCLE
jumpCircleOn = false
local function spawnJumpCircle()
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local position = Vector3.new(hrp.Position.X, hrp.Position.Y - 2.8, hrp.Position.Z)
    local parts = {}
    for i = 1, 20 do
        local angle = (i / 20) * math.pi * 2
        local part = Instance.new("Part")
        part.Size = Vector3.new(0.8, 0.12, 0.4)
        part.Color = C_ACCENT
        part.Material = Enum.Material.Neon
        part.Transparency = 0.15
        part.Anchored = true
        part.CanCollide = false
        part.CFrame = CFrame.new(position + Vector3.new(math.cos(angle) * 2.5, 0, math.sin(angle) * 2.5), position)
        part.Parent = workspace
        table.insert(parts, part)
    end
    for _, p in ipairs(parts) do
        local dir = (p.Position - position).Unit
        TweenService:Create(p, TweenInfo.new(4.0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Position = p.Position + dir * 5 + Vector3.new(0, 2.5, 0), Transparency = 1}):Play()
    end
    task.delay(4.5, function()
        for _, p in ipairs(parts) do if p and p.Parent then p:Destroy() end end
    end)
end
makeButton(visualsTab, "Jump Circle", function(btn, ind)
    jumpCircleOn = not jumpCircleOn
    if jumpCircleOn then setOn(btn, ind) else setOff(btn, ind) end
    notify(jumpCircleOn and "Jump Circle вкл" or "Jump Circle выкл")
end)
local function hookCharacter(char)
    local hum = char:WaitForChild("Humanoid")
    hum.Jumping:Connect(function()
        if jumpCircleOn then spawnJumpCircle() end
    end)
end
if LocalPlayer.Character then hookCharacter(LocalPlayer.Character) end
LocalPlayer.CharacterAdded:Connect(hookCharacter)
bindActions["Jump Circle"] = function() jumpCircleOn = not jumpCircleOn end

-- PARTICLES
skyFolder = nil
skyParticlesOn = false
local function createSkyParticles()
    if skyFolder then skyFolder:Destroy() end
    skyFolder = Instance.new("Folder")
    skyFolder.Parent = workspace
    local attachPart = Instance.new("Part")
    attachPart.Size = Vector3.new(60, 1, 60)
    attachPart.Transparency = 1
    attachPart.Anchored = true
    attachPart.CanCollide = false
    attachPart.Parent = skyFolder
    local attachment = Instance.new("Attachment")
    attachment.Parent = attachPart
    local textures = {
        "rbxassetid://243660364",
        "rbxassetid://243661226",
        "rbxassetid://243660983",
    }
    for _, tex in ipairs(textures) do
        local emitter = Instance.new("ParticleEmitter")
        emitter.Texture = tex
        emitter.Rate = 90
        emitter.Lifetime = NumberRange.new(5, 9)
        emitter.Speed = NumberRange.new(20, 45)
        emitter.SpreadAngle = Vector2.new(180, 180)
        emitter.Acceleration = Vector3.new(0, -3, 0)
        emitter.Drag = 0.8
        emitter.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 120, 255)),
            ColorSequenceKeypoint.new(0.5, C_ACCENT),
            ColorSequenceKeypoint.new(1, C_ACCENT2),
        })
        emitter.Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.3, 3.0),
            NumberSequenceKeypoint.new(0.7, 2.0),
            NumberSequenceKeypoint.new(1, 0),
        })
        emitter.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.15, 0),
            NumberSequenceKeypoint.new(0.85, 0),
            NumberSequenceKeypoint.new(1, 1),
        })
        emitter.LightEmission = 1
        emitter.LightInfluence = 0
        emitter.Rotation = NumberRange.new(0, 360)
        emitter.RotSpeed = NumberRange.new(-180, 180)
        emitter.Parent = attachment
    end
    task.spawn(function()
        while skyFolder and skyFolder.Parent do
            local cam = workspace.CurrentCamera
            if cam then
                local pos = cam.CFrame.Position
                attachPart.Position = Vector3.new(pos.X, pos.Y + 25, pos.Z)
            end
            task.wait(0.1)
        end
    end)
end
local function toggleParticles()
    skyParticlesOn = not skyParticlesOn
    if skyParticlesOn then createSkyParticles()
    else if skyFolder then skyFolder:Destroy() skyFolder = nil end end
end
makeButton(visualsTab, "Particles", function(btn, ind)
    toggleParticles()
    if skyParticlesOn then setOn(btn, ind) else setOff(btn, ind) end
    notify(skyParticlesOn and "Particles вкл" or "Particles выкл")
end)
bindActions["Particles"] = toggleParticles

-- HEART AURA
heartOn = false
heartFolder = nil
heartConn = nil
local function toggleHeart()
    heartOn = not heartOn
    if heartOn then
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        heartFolder = Instance.new("Folder")
        heartFolder.Parent = workspace
        local hearts = {}
        for i = 1, 8 do
            local half1 = Instance.new("Part")
            half1.Shape = Enum.PartType.Ball
            half1.Size = Vector3.new(0.45, 0.45, 0.35)
            half1.Color = Color3.fromRGB(255, 60, 130)
            half1.Material = Enum.Material.Neon
            half1.Transparency = 0.1
            half1.Anchored = true
            half1.CanCollide = false
            half1.Parent = heartFolder
            local half2 = Instance.new("Part")
            half2.Shape = Enum.PartType.Ball
            half2.Size = Vector3.new(0.45, 0.45, 0.35)
            half2.Color = Color3.fromRGB(255, 60, 130)
            half2.Material = Enum.Material.Neon
            half2.Transparency = 0.1
            half2.Anchored = true
            half2.CanCollide = false
            half2.Parent = heartFolder
            local tip = Instance.new("WedgePart")
            tip.Size = Vector3.new(0.5, 0.4, 0.35)
            tip.Color = Color3.fromRGB(255, 80, 150)
            tip.Material = Enum.Material.Neon
            tip.Transparency = 0.1
            tip.Anchored = true
            tip.CanCollide = false
            tip.Parent = heartFolder
            local glow = Instance.new("Part")
            glow.Shape = Enum.PartType.Ball
            glow.Size = Vector3.new(0.15, 0.15, 0.15)
            glow.Color = Color3.fromRGB(255, 255, 255)
            glow.Material = Enum.Material.Neon
            glow.Anchored = true
            glow.CanCollide = false
            glow.Parent = heartFolder
            table.insert(hearts, { half1 = half1, half2 = half2, tip = tip, glow = glow, angle = (i / 8) * math.pi * 2, y = math.random() * 4 })
        end
        if heartConn then heartConn:Disconnect() end
        heartConn = RunService.Heartbeat:Connect(function(dt)
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            for _, data in ipairs(hearts) do
                data.y = data.y + dt * 1.5
                if data.y > 5 then data.y = 0 end
                local a = data.angle + tick() * 0.5
                local pos = h.CFrame * CFrame.new(math.cos(a) * 2.5, -2 + data.y, math.sin(a) * 2.5)
                local look = CFrame.new(pos.Position, h.Position)
                data.half1.CFrame = look * CFrame.new(-0.18, 0.12, 0) * CFrame.Angles(0, 0, math.rad(-15))
                data.half2.CFrame = look * CFrame.new(0.18, 0.12, 0) * CFrame.Angles(0, 0, math.rad(15))
                data.tip.CFrame = look * CFrame.new(0, -0.35, 0) * CFrame.Angles(0, 0, math.rad(180))
                data.glow.CFrame = look * CFrame.new(0, 0.15, 0.2)
            end
        end)
    else
        if heartConn then heartConn:Disconnect() heartConn = nil end
        if heartFolder then heartFolder:Destroy() heartFolder = nil end
    end
end
makeButton(visualsTab, "Heart Aura", function(btn, ind) toggleHeart(); if heartOn then setOn(btn, ind) else setOff(btn, ind) end; notify(heartOn and "Heart вкл" or "Heart выкл") end)
bindActions["Heart Aura"] = toggleHeart

-- SWORD CIRCLE
swordOn = false
swordFolder = nil
swordConn = nil
local function toggleSword()
    swordOn = not swordOn
    if swordOn then
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        swordFolder = Instance.new("Folder")
        swordFolder.Parent = workspace
        local swords = {}
        for i = 1, 8 do
            local angle = (i / 8) * math.pi * 2
            local blade = Instance.new("Part")
            blade.Size = Vector3.new(0.12, 2.5, 0.35)
            blade.Color = Color3.fromRGB(220, 220, 240)
            blade.Material = Enum.Material.Metal
            blade.Anchored = true
            blade.CanCollide = false
            blade.Parent = swordFolder
            local tip = Instance.new("WedgePart")
            tip.Size = Vector3.new(0.12, 0.4, 0.35)
            tip.Color = Color3.fromRGB(220, 220, 240)
            tip.Material = Enum.Material.Metal
            tip.Anchored = true
            tip.CanCollide = false
            tip.Parent = swordFolder
            local guard = Instance.new("Part")
            guard.Size = Vector3.new(0.7, 0.15, 0.15)
            guard.Color = Color3.fromRGB(255, 200, 50)
            guard.Material = Enum.Material.Neon
            guard.Anchored = true
            guard.CanCollide = false
            guard.Parent = swordFolder
            local handle = Instance.new("Part")
            handle.Size = Vector3.new(0.2, 0.5, 0.2)
            handle.Color = Color3.fromRGB(80, 40, 20)
            handle.Material = Enum.Material.Wood
            handle.Anchored = true
            handle.CanCollide = false
            handle.Parent = swordFolder
            table.insert(swords, { blade = blade, tip = tip, guard = guard, handle = handle, angle = angle })
        end
        if swordConn then swordConn:Disconnect() end
        swordConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            for _, data in ipairs(swords) do
                local a = data.angle + tick() * 1.5
                local basePos = h.CFrame * CFrame.new(math.cos(a) * 3, 1, math.sin(a) * 3)
                local look = CFrame.new(basePos.Position, h.Position)
                local tilted = look * CFrame.Angles(0, 0, math.rad(20))
                data.blade.CFrame = tilted * CFrame.new(0, 0.5, 0)
                data.tip.CFrame = tilted * CFrame.new(0, 1.95, 0)
                data.guard.CFrame = tilted * CFrame.new(0, -0.75, 0)
                data.handle.CFrame = tilted * CFrame.new(0, -1.15, 0)
            end
        end)
    else
        if swordConn then swordConn:Disconnect() swordConn = nil end
        if swordFolder then swordFolder:Destroy() swordFolder = nil end
    end
end
makeButton(visualsTab, "Sword Circle", function(btn, ind) toggleSword(); if swordOn then setOn(btn, ind) else setOff(btn, ind) end; notify(swordOn and "Sword вкл" or "Sword выкл") end)
bindActions["Sword Circle"] = toggleSword

-- PORTAL
portalOn = false
portalFolder = nil
portalConn = nil
local function togglePortal()
    portalOn = not portalOn
    if portalOn then
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        portalFolder = Instance.new("Folder")
        portalFolder.Parent = workspace
        local rings = {}
        for layer = 1, 3 do
            local ringParts = {}
            local radius = 1.5 + layer * 0.5
            local count = 24
            for i = 1, count do
                local p = Instance.new("Part")
                p.Size = Vector3.new(0.35, 0.35, 0.1)
                p.Color = Color3.fromHSV(layer / 3, 0.8, 1)
                p.Material = Enum.Material.Neon
                p.Transparency = 0.2 + layer * 0.1
                p.Anchored = true
                p.CanCollide = false
                p.Parent = portalFolder
                table.insert(ringParts, { part = p, angle = (i / count) * math.pi * 2 })
            end
            table.insert(rings, { parts = ringParts, radius = radius, speed = layer })
        end
        if portalConn then portalConn:Disconnect() end
        portalConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            local portalCF = h.CFrame * CFrame.new(0, 0, -3)
            for _, ring in ipairs(rings) do
                for i, data in ipairs(ring.parts) do
                    local a = data.angle + tick() * ring.speed
                    local r = ring.radius + math.sin(tick() * 2 + i * 0.2) * 0.15
                    data.part.CFrame = portalCF * CFrame.new(math.cos(a) * r, math.sin(a) * r, 0)
                end
            end
        end)
    else
        if portalConn then portalConn:Disconnect() portalConn = nil end
        if portalFolder then portalFolder:Destroy() portalFolder = nil end
    end
end
makeButton(visualsTab, "Portal Effect", function(btn, ind) togglePortal(); if portalOn then setOn(btn, ind) else setOff(btn, ind) end; notify(portalOn and "Portal вкл" or "Portal выкл") end)
bindActions["Portal Effect"] = togglePortal

-- FIRE AURA
fireAuraOn = false
fireAuraFolder = nil
fireAuraConn = nil
local function toggleFireAura()
    fireAuraOn = not fireAuraOn
    if fireAuraOn then
        fireAuraFolder = Instance.new("Folder")
        fireAuraFolder.Parent = workspace
        local parts = {}
        for i = 1, 20 do
            local part = Instance.new("Part")
            part.Shape = Enum.PartType.Ball
            part.Size = Vector3.new(0.4, 0.4, 0.4)
            part.Color = Color3.fromRGB(255, 100, 0)
            part.Material = Enum.Material.Neon
            part.Transparency = 0.3
            part.Anchored = true
            part.CanCollide = false
            part.Parent = fireAuraFolder
            table.insert(parts, { part = part, angle = (i / 20) * math.pi * 2 })
        end
        fireAuraConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            for i, data in ipairs(parts) do
                local a = data.angle + tick() * 2
                local y = -2.5 + math.sin(tick() * 4 + i) * 0.5
                data.part.CFrame = h.CFrame * CFrame.new(math.cos(a) * 2.5, y, math.sin(a) * 2.5)
                data.part.Color = Color3.fromHSV((tick() * 0.3) % 0.15 + 0.02, 1, 1)
            end
        end)
    else
        if fireAuraConn then fireAuraConn:Disconnect() fireAuraConn = nil end
        if fireAuraFolder then fireAuraFolder:Destroy() fireAuraFolder = nil end
    end
end
makeButton(visualsTab, "Fire Aura", function(btn, ind) toggleFireAura(); if fireAuraOn then setOn(btn, ind) else setOff(btn, ind) end; notify(fireAuraOn and "Fire вкл" or "Fire выкл") end)
bindActions["Fire Aura"] = toggleFireAura

-- ICE AURA
iceAuraOn = false
iceAuraFolder = nil
iceAuraConn = nil
local function toggleIceAura()
    iceAuraOn = not iceAuraOn
    if iceAuraOn then
        iceAuraFolder = Instance.new("Folder")
        iceAuraFolder.Parent = workspace
        local parts = {}
        for i = 1, 20 do
            local part = Instance.new("Part")
            part.Size = Vector3.new(0.4, 0.8, 0.4)
            part.Color = Color3.fromRGB(100, 200, 255)
            part.Material = Enum.Material.Ice
            part.Transparency = 0.3
            part.Anchored = true
            part.CanCollide = false
            part.Parent = iceAuraFolder
            table.insert(parts, { part = part, angle = (i / 20) * math.pi * 2 })
        end
        iceAuraConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            for i, data in ipairs(parts) do
                local a = data.angle + tick() * 1.5
                data.part.CFrame = h.CFrame * CFrame.new(math.cos(a) * 2.5, -1, math.sin(a) * 2.5) * CFrame.Angles(0, a, 0)
            end
        end)
    else
        if iceAuraConn then iceAuraConn:Disconnect() iceAuraConn = nil end
        if iceAuraFolder then iceAuraFolder:Destroy() iceAuraFolder = nil end
    end
end
makeButton(visualsTab, "Ice Aura", function(btn, ind) toggleIceAura(); if iceAuraOn then setOn(btn, ind) else setOff(btn, ind) end; notify(iceAuraOn and "Ice вкл" or "Ice выкл") end)
bindActions["Ice Aura"] = toggleIceAura

-- LIGHTNING
lightningOn = false
lightningFolder = nil
lightningConn = nil
local function toggleLightning()
    lightningOn = not lightningOn
    if lightningOn then
        lightningFolder = Instance.new("Folder")
        lightningFolder.Parent = workspace
        lightningConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            if math.random() < 0.15 then
                local bolt = Instance.new("Part")
                bolt.Size = Vector3.new(0.15, math.random(5, 12), 0.15)
                bolt.Color = Color3.fromRGB(200, 150, 255)
                bolt.Material = Enum.Material.Neon
                bolt.Transparency = 0.2
                bolt.Anchored = true
                bolt.CanCollide = false
                bolt.CFrame = h.CFrame * CFrame.new(math.random(-5, 5), math.random(3, 8), math.random(-5, 5))
                bolt.Parent = lightningFolder
                task.delay(0.15, function() if bolt then bolt:Destroy() end end)
            end
        end)
    else
        if lightningConn then lightningConn:Disconnect() lightningConn = nil end
        if lightningFolder then lightningFolder:Destroy() lightningFolder = nil end
    end
end
makeButton(visualsTab, "Lightning", function(btn, ind) toggleLightning(); if lightningOn then setOn(btn, ind) else setOff(btn, ind) end; notify(lightningOn and "Lightning вкл" or "Lightning выкл") end)
bindActions["Lightning"] = toggleLightning

-- SPIN
spinOn = false
spinConn = nil
local function toggleSpin()
    spinOn = not spinOn
    if spinOn then
        spinConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if h then h.CFrame = h.CFrame * CFrame.Angles(0, math.rad(20), 0) end
        end)
    else
        if spinConn then spinConn:Disconnect() spinConn = nil end
    end
end
makeButton(visualsTab, "Spin", function(btn, ind) toggleSpin(); if spinOn then setOn(btn, ind) else setOff(btn, ind) end; notify(spinOn and "Spin вкл" or "Spin выкл") end)
bindActions["Spin"] = toggleSpin

-- EXPLODE
makeButton(visualsTab, "Explode", function(btn, ind)
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local explode = Instance.new("Explosion")
    explode.Position = hrp.Position
    explode.BlastRadius = 10
    explode.BlastPressure = 0
    explode.DestroyJointRadiusPercent = 0
    explode.Parent = workspace
    notify("Explode!")
end)

-- NAME TAGS
nameTagsOn = false
nameTagFolder = nil
local function createNameTags()
    if nameTagFolder then nameTagFolder:Destroy() end
    nameTagFolder = Instance.new("Folder")
    nameTagFolder.Parent = workspace
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local head = plr.Character:FindFirstChild("Head")
            if head then
                local bb = Instance.new("BillboardGui")
                bb.Size = UDim2.new(0, 140, 0, 40)
                bb.StudsOffset = Vector3.new(0, 3, 0)
                bb.AlwaysOnTop = true
                bb.Adornee = head
                bb.Parent = nameTagFolder
                bb:SetAttribute("PlayerName", plr.Name)
                local lbl = Instance.new("TextLabel")
                lbl.Name = "NameLabel"
                lbl.Size = UDim2.new(1, 0, 0, 20)
                lbl.BackgroundTransparency = 1
                lbl.Text = plr.Name
                lbl.TextColor3 = C_ACCENT2
                lbl.Font = Enum.Font.GothamBold
                lbl.TextSize = 14
                lbl.TextStrokeTransparency = 0
                lbl.Parent = bb
                local dl = Instance.new("TextLabel")
                dl.Name = "DistLabel"
                dl.Size = UDim2.new(1, 0, 0, 16)
                dl.Position = UDim2.new(0, 0, 0, 20)
                dl.BackgroundTransparency = 1
                dl.Text = "0 studs"
                dl.TextColor3 = C_ACCENT
                dl.Font = Enum.Font.Gotham
                dl.TextSize = 12
                dl.TextStrokeTransparency = 0
                dl.Parent = bb
            end
        end
    end
end
task.spawn(function()
    while gui.Parent do
        if nameTagsOn and nameTagFolder then
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local myPos = hrp.Position
                for _, bb in ipairs(nameTagFolder:GetChildren()) do
                    local pName = bb:GetAttribute("PlayerName")
                    local plr = pName and Players:FindFirstChild(pName)
                    if plr and plr.Character then
                        local th = plr.Character:FindFirstChild("Head")
                        if th then
                            local dist = (th.Position - myPos).Magnitude
                            local dl = bb:FindFirstChild("DistLabel")
                            if dl then dl.Text = math.floor(dist) .. " studs" end
                        end
                    end
                end
            end
        end
        task.wait(0.2)
    end
end)
local function toggleNameTags()
    nameTagsOn = not nameTagsOn
    if nameTagsOn then createNameTags()
    else if nameTagFolder then nameTagFolder:Destroy() nameTagFolder = nil end end
end
makeButton(visualsTab, "Name Tags", function(btn, ind) toggleNameTags(); if nameTagsOn then setOn(btn, ind) else setOff(btn, ind) end; notify(nameTagsOn and "Name Tags вкл" or "Name Tags выкл") end)
bindActions["Name Tags"] = toggleNameTags

-- FULLBRIGHT
fullbrightOn = false
origAmbient = Lighting.Ambient
origOutdoor = Lighting.OutdoorAmbient
origBright = Lighting.Brightness
local function toggleFullbright()
    fullbrightOn = not fullbrightOn
    if fullbrightOn then
        Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
        Lighting.Brightness = config.fullbrightBright
    else
        Lighting.Ambient = origAmbient
        Lighting.OutdoorAmbient = origOutdoor
        Lighting.Brightness = origBright
    end
end
makeButton(visualsTab, "Fullbright", function(btn, ind) toggleFullbright(); if fullbrightOn then setOn(btn, ind) else setOff(btn, ind) end; notify(fullbrightOn and "Fullbright вкл" or "Fullbright выкл") end, {
    { type = "slider", label = "Яркость", min = 1, max = 10, value = config.fullbrightBright, callback = function(v) config.fullbrightBright = v; if fullbrightOn then Lighting.Brightness = v end end },
})
bindActions["Fullbright"] = toggleFullbright

-- CUSTOM SKY
customSkyOn = false
origFogColor = Lighting.FogColor
origFogEnd = Lighting.FogEnd
origFogStart = Lighting.FogStart
origSky = Lighting:FindFirstChildOfClass("Sky")
local function toggleCustomSky()
    customSkyOn = not customSkyOn
    if customSkyOn then
        Lighting.FogColor = config.skyColor
        Lighting.FogEnd = config.skyFogEnd
        Lighting.FogStart = config.skyFogStart
        if origSky then origSky.Parent = nil end
    else
        Lighting.FogColor = origFogColor
        Lighting.FogEnd = origFogEnd
        Lighting.FogStart = origFogStart
        if origSky then origSky.Parent = Lighting end
    end
end
makeButton(visualsTab, "Custom Sky", function(btn, ind) toggleCustomSky(); if customSkyOn then setOn(btn, ind) else setOff(btn, ind) end; notify(customSkyOn and "Custom Sky вкл" or "Custom Sky выкл") end, {
    { type = "color", label = "Цвет тумана", callback = function(c) config.skyColor = c; if customSkyOn then Lighting.FogColor = c end end },
    { type = "slider", label = "Дальность", min = 100, max = 2000, value = config.skyFogEnd, callback = function(v) config.skyFogEnd = v; if customSkyOn then Lighting.FogEnd = v end end },
    { type = "slider", label = "Начало", min = 0, max = 500, value = config.skyFogStart, callback = function(v) config.skyFogStart = v; if customSkyOn then Lighting.FogStart = v end end },
})
bindActions["Custom Sky"] = toggleCustomSky

-- ASPECT RADIO
aspectOn = false
origAspectFOV = workspace.CurrentCamera.FieldOfView
local function toggleAspect()
    aspectOn = not aspectOn
    if aspectOn then workspace.CurrentCamera.FieldOfView = 120
    else workspace.CurrentCamera.FieldOfView = origAspectFOV end
end
makeButton(visualsTab, "Aspect Radio", function(btn, ind) toggleAspect(); if aspectOn then setOn(btn, ind) else setOff(btn, ind) end; notify(aspectOn and "Aspect Radio вкл" or "Aspect Radio выкл") end)
bindActions["Aspect Radio"] = toggleAspect

-- CROSSHAIR
crosshairOn = false
crosshairGui = nil
local function toggleCrosshair()
    crosshairOn = not crosshairOn
    if crosshairOn then
        crosshairGui = Instance.new("ScreenGui")
        crosshairGui.ResetOnSpawn = false
        crosshairGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
        local container = Instance.new("Frame")
        container.Size = UDim2.new(0, 30, 0, 30)
        container.Position = UDim2.new(0.5, -15, 0.5, -15)
        container.BackgroundTransparency = 1
        container.Parent = crosshairGui
        for _, cfg in ipairs({
            { size = UDim2.new(0, 10, 0, 2), pos = UDim2.new(0, 0, 0.5, -1) },
            { size = UDim2.new(0, 10, 0, 2), pos = UDim2.new(1, -10, 0.5, -1) },
            { size = UDim2.new(0, 2, 0, 10), pos = UDim2.new(0.5, -1, 0, 0) },
            { size = UDim2.new(0, 2, 0, 10), pos = UDim2.new(0.5, -1, 1, -10) },
        }) do
            local f = Instance.new("Frame")
            f.Size = cfg.size
            f.Position = cfg.pos
            f.BackgroundColor3 = C_ACCENT
            f.BorderSizePixel = 0
            f.Parent = container
        end
    else
        if crosshairGui then crosshairGui:Destroy() crosshairGui = nil end
    end
end
makeButton(visualsTab, "Crosshair", function(btn, ind) toggleCrosshair(); if crosshairOn then setOn(btn, ind) else setOff(btn, ind) end; notify(crosshairOn and "Crosshair вкл" or "Crosshair выкл") end)
bindActions["Crosshair"] = toggleCrosshair

-- FOV CIRCLE
fovCircleOn = false
fovCircleGui = nil
local function toggleFovCircle()
    fovCircleOn = not fovCircleOn
    if fovCircleOn then
        fovCircleGui = Instance.new("ScreenGui")
        fovCircleGui.ResetOnSpawn = false
        fovCircleGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
        local c = Instance.new("Frame")
        c.Size = UDim2.new(0, 200, 0, 200)
        c.Position = UDim2.new(0.5, -100, 0.5, -100)
        c.BackgroundTransparency = 1
        c.Parent = fovCircleGui
        local cc = Instance.new("UICorner")
        cc.CornerRadius = UDim.new(1, 0)
        cc.Parent = c
        local cs = Instance.new("UIStroke")
        cs.Color = C_ACCENT
        cs.Thickness = 2
        cs.Transparency = 0.3
        cs.Parent = c
    else
        if fovCircleGui then fovCircleGui:Destroy() fovCircleGui = nil end
    end
end
makeButton(visualsTab, "FOV Circle", function(btn, ind) toggleFovCircle(); if fovCircleOn then setOn(btn, ind) else setOff(btn, ind) end; notify(fovCircleOn and "FOV Circle вкл" or "FOV Circle выкл") end)
bindActions["FOV Circle"] = toggleFovCircle

-- STAR PARTICLES
starParticlesOn = false
starFolder = nil
starConn = nil
local function toggleStarParticles()
    starParticlesOn = not starParticlesOn
    if starParticlesOn then
        starFolder = Instance.new("Folder")
        starFolder.Parent = workspace
        local parts = {}
        for i = 1, 24 do
            local p = Instance.new("Part")
            p.Size = Vector3.new(0.3, 0.3, 0.1)
            p.Color = Color3.fromRGB(255, 240, 200)
            p.Material = Enum.Material.Neon
            p.Anchored = true
            p.CanCollide = false
            p.Parent = starFolder
            table.insert(parts, { part = p, angle = (i / 24) * math.pi * 2, offset = math.random() * math.pi * 2 })
        end
        starConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            for _, data in ipairs(parts) do
                local a = data.angle + tick() * 1.5
                data.part.CFrame = h.CFrame * CFrame.new(math.cos(a) * 4, math.sin(tick() * 3 + data.offset) * 2, math.sin(a) * 4) * CFrame.Angles(tick() * 2, tick() * 3, 0)
            end
        end)
    else
        if starConn then starConn:Disconnect() starConn = nil end
        if starFolder then starFolder:Destroy() starFolder = nil end
    end
end
makeButton(visualsTab, "Star Particles", function(btn, ind) toggleStarParticles(); if starParticlesOn then setOn(btn, ind) else setOff(btn, ind) end; notify(starParticlesOn and "Stars вкл" or "Stars выкл") end)
bindActions["Star Particles"] = toggleStarParticles

-- RAINBOW CHARACTER
rainbowCharOn = false
rainbowCharConn = nil
rainbowOrigColors = {}
local function toggleRainbowChar()
    rainbowCharOn = not rainbowCharOn
    if rainbowCharOn then
        rainbowOrigColors = {}
        rainbowCharConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            if not c then return end
            local hue = (tick() * 0.3) % 1
            for _, part in ipairs(c:GetDescendants()) do
                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                    if not rainbowOrigColors[part] then rainbowOrigColors[part] = part.Color end
                    part.Color = Color3.fromHSV(hue, 0.7, 1)
                    part.Material = Enum.Material.Neon
                end
            end
        end)
    else
        if rainbowCharConn then rainbowCharConn:Disconnect() rainbowCharConn = nil end
        local c = LocalPlayer.Character
        if c then
            for _, part in ipairs(c:GetDescendants()) do
                if part:IsA("BasePart") and rainbowOrigColors[part] then
                    part.Color = rainbowOrigColors[part]
                    part.Material = Enum.Material.Plastic
                end
            end
        end
        rainbowOrigColors = {}
    end
end
makeButton(visualsTab, "Rainbow Character", function(btn, ind) toggleRainbowChar(); if rainbowCharOn then setOn(btn, ind) else setOff(btn, ind) end; notify(rainbowCharOn and "Rainbow Char вкл" or "Rainbow Char выкл") end)
bindActions["Rainbow Character"] = toggleRainbowChar

-- RAINBOW TRAIL
rainbowTrailOn = false
rainbowTrailObj = nil
rainbowTrailConn = nil
local function toggleRainbowTrail()
    rainbowTrailOn = not rainbowTrailOn
    if rainbowTrailOn then
        local char = LocalPlayer.Character
        if not char then return end
        local torso = char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")
        if not torso then return end
        local a0 = Instance.new("Attachment")
        a0.Position = Vector3.new(0, 1, 0)
        a0.Parent = torso
        local a1 = Instance.new("Attachment")
        a1.Position = Vector3.new(0, -1, 0)
        a1.Parent = torso
        rainbowTrailObj = Instance.new("Trail")
        rainbowTrailObj.Attachment0 = a0
        rainbowTrailObj.Attachment1 = a1
        rainbowTrailObj.Lifetime = 2
        rainbowTrailObj.LightEmission = 1
        rainbowTrailObj.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.2),
            NumberSequenceKeypoint.new(1, 1),
        })
        rainbowTrailObj.Parent = torso
        rainbowTrailConn = RunService.Heartbeat:Connect(function()
            if not rainbowTrailObj then return end
            local hue = (tick() * 0.3) % 1
            local color = Color3.fromHSV(hue, 0.8, 1)
            rainbowTrailObj.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, color),
                ColorSequenceKeypoint.new(1, Color3.fromHSV((hue + 0.3) % 1, 0.8, 1)),
            })
        end)
    else
        if rainbowTrailConn then rainbowTrailConn:Disconnect() rainbowTrailConn = nil end
        if rainbowTrailObj then rainbowTrailObj:Destroy() rainbowTrailObj = nil end
    end
end
makeButton(visualsTab, "Rainbow Trail", function(btn, ind) toggleRainbowTrail(); if rainbowTrailOn then setOn(btn, ind) else setOff(btn, ind) end; notify(rainbowTrailOn and "Rainbow Trail вкл" or "Rainbow Trail выкл") end)
bindActions["Rainbow Trail"] = toggleRainbowTrail

-- TRAIL (обычный, из v1)
trailOn = false
trailObj = nil
trailA0 = nil
trailA1 = nil
local function createTrail()
    local char = LocalPlayer.Character
    if not char then return end
    local torso = char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")
    if not torso then return end
    trailA0 = Instance.new("Attachment")
    trailA0.Position = Vector3.new(0, 0.5, 0)
    trailA0.Parent = torso
    trailA1 = Instance.new("Attachment")
    trailA1.Position = Vector3.new(0, -0.5, 0)
    trailA1.Parent = torso
    trailObj = Instance.new("Trail")
    trailObj.Attachment0 = trailA0
    trailObj.Attachment1 = trailA1
    trailObj.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, C_ACCENT),
        ColorSequenceKeypoint.new(1, C_ACCENT2),
    })
    trailObj.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.2),
        NumberSequenceKeypoint.new(1, 1),
    })
    trailObj.Lifetime = 1.5
    trailObj.LightEmission = 1
    trailObj.Parent = torso
end
local function removeTrail()
    if trailObj then trailObj:Destroy() trailObj = nil end
    if trailA0 then trailA0:Destroy() trailA0 = nil end
    if trailA1 then trailA1:Destroy() trailA1 = nil end
end
local function toggleTrail()
    trailOn = not trailOn
    if trailOn then createTrail() else removeTrail() end
end
makeButton(visualsTab, "Trail", function(btn, ind) toggleTrail(); if trailOn then setOn(btn, ind) else setOff(btn, ind) end; notify(trailOn and "Trail вкл" or "Trail выкл") end)
bindActions["Trail"] = toggleTrail

-- HEAD AURA
headAuraOn = false
headAuraFolder = nil
headAuraConn = nil
local function toggleHeadAura()
    headAuraOn = not headAuraOn
    if headAuraOn then
        headAuraFolder = Instance.new("Folder")
        headAuraFolder.Parent = workspace
        local parts = {}
        for i = 1, 16 do
            local part = Instance.new("Part")
            part.Shape = Enum.PartType.Ball
            part.Size = Vector3.new(0.2, 0.2, 0.2)
            part.Color = C_ACCENT
            part.Material = Enum.Material.Neon
            part.Transparency = 0.2
            part.Anchored = true
            part.CanCollide = false
            part.Parent = headAuraFolder
            table.insert(parts, { part = part, angle = (i / 16) * math.pi * 2 })
        end
        headAuraConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local head = c and c:FindFirstChild("Head")
            if not head then return end
            for i, data in ipairs(parts) do
                local a = data.angle + tick() * 3
                data.part.CFrame = head.CFrame * CFrame.new(math.cos(a) * 1.2, math.sin(tick() * 4 + i) * 0.3, math.sin(a) * 1.2)
            end
        end)
    else
        if headAuraConn then headAuraConn:Disconnect() headAuraConn = nil end
        if headAuraFolder then headAuraFolder:Destroy() headAuraFolder = nil end
    end
end
makeButton(visualsTab, "Head Aura", function(btn, ind) toggleHeadAura(); if headAuraOn then setOn(btn, ind) else setOff(btn, ind) end; notify(headAuraOn and "Head Aura вкл" or "Head Aura выкл") end)
bindActions["Head Aura"] = toggleHeadAura

-- SNOWFLAKES
snowflakesOn = false
snowflakesFolder = nil
snowflakesConn = nil
local function toggleSnowflakes()
    snowflakesOn = not snowflakesOn
    if snowflakesOn then
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        snowflakesFolder = Instance.new("Folder")
        snowflakesFolder.Parent = workspace
        local flakes = {}
        for i = 1, 15 do
            local flake = Instance.new("Part")
            flake.Size = Vector3.new(0.2, 0.2, 0.2)
            flake.Shape = Enum.PartType.Ball
            flake.Color = Color3.fromRGB(200, 230, 255)
            flake.Material = Enum.Material.Neon
            flake.Anchored = true
            flake.CanCollide = false
            flake.Parent = snowflakesFolder
            table.insert(flakes, { part = flake, angle = math.random() * math.pi * 2, y = math.random() * 6, radius = math.random() * 3 + 1 })
        end
        snowflakesConn = RunService.Heartbeat:Connect(function(dt)
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            for _, data in ipairs(flakes) do
                data.y = data.y - dt * 2
                if data.y < -3 then data.y = 6 end
                data.angle = data.angle + dt * 0.5
                data.part.CFrame = h.CFrame * CFrame.new(math.cos(data.angle) * data.radius, data.y, math.sin(data.angle) * data.radius)
            end
        end)
    else
        if snowflakesConn then snowflakesConn:Disconnect() snowflakesConn = nil end
        if snowflakesFolder then snowflakesFolder:Destroy() snowflakesFolder = nil end
    end
end
makeButton(visualsTab, "Snowflakes", function(btn, ind) toggleSnowflakes(); if snowflakesOn then setOn(btn, ind) else setOff(btn, ind) end; notify(snowflakesOn and "Snowflakes вкл" or "Snowflakes выкл") end)
bindActions["Snowflakes"] = toggleSnowflakes

-- MUSIC NOTES
notesOn = false
notesFolder = nil
notesConn = nil
local function toggleNotes()
    notesOn = not notesOn
    if notesOn then
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        notesFolder = Instance.new("Folder")
        notesFolder.Parent = workspace
        local notes = {}
        for i = 1, 10 do
            local note = Instance.new("Part")
            note.Size = Vector3.new(0.3, 0.3, 0.1)
            note.Color = Color3.fromRGB(255, 200, 255)
            note.Material = Enum.Material.Neon
            note.Anchored = true
            note.CanCollide = false
            note.Parent = notesFolder
            table.insert(notes, { part = note, angle = (i / 10) * math.pi * 2, y = 0 })
        end
        notesConn = RunService.Heartbeat:Connect(function(dt)
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            for _, data in ipairs(notes) do
                data.y = data.y + dt * 2
                if data.y > 5 then data.y = 0 end
                local a = data.angle + tick() * 0.5
                data.part.CFrame = h.CFrame * CFrame.new(math.cos(a) * 2, -2 + data.y, math.sin(a) * 2)
            end
        end)
    else
        if notesConn then notesConn:Disconnect() notesConn = nil end
        if notesFolder then notesFolder:Destroy() notesFolder = nil end
    end
end
makeButton(visualsTab, "Music Notes", function(btn, ind) toggleNotes(); if notesOn then setOn(btn, ind) else setOff(btn, ind) end; notify(notesOn and "Notes вкл" or "Notes выкл") end)
bindActions["Music Notes"] = toggleNotes

-- ORBITING ORBS
orbsOn = false
orbsFolder = nil
orbsConn = nil
local function toggleOrbs()
    orbsOn = not orbsOn
    if orbsOn then
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        orbsFolder = Instance.new("Folder")
        orbsFolder.Parent = workspace
        local parts = {}
        for i = 1, 6 do
            local orb = Instance.new("Part")
            orb.Shape = Enum.PartType.Ball
            orb.Size = Vector3.new(0.5, 0.5, 0.5)
            orb.Color = C_ACCENT
            orb.Material = Enum.Material.Neon
            orb.Anchored = true
            orb.CanCollide = false
            orb.Parent = orbsFolder
            table.insert(parts, { part = orb, angle = (i / 6) * math.pi * 2 })
        end
        orbsConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            for _, data in ipairs(parts) do
                local a = data.angle + tick() * 2
                data.part.CFrame = h.CFrame * CFrame.new(math.cos(a) * 3, 0, math.sin(a) * 3)
            end
        end)
    else
        if orbsConn then orbsConn:Disconnect() orbsConn = nil end
        if orbsFolder then orbsFolder:Destroy() orbsFolder = nil end
    end
end
makeButton(visualsTab, "Orbiting Orbs", function(btn, ind) toggleOrbs(); if orbsOn then setOn(btn, ind) else setOff(btn, ind) end; notify(orbsOn and "Orbs вкл" or "Orbs выкл") end)
bindActions["Orbiting Orbs"] = toggleOrbs

-- SKULL AURA
skullOn = false
skullFolder = nil
skullConn = nil
local function toggleSkull()
    skullOn = not skullOn
    if skullOn then
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        skullFolder = Instance.new("Folder")
        skullFolder.Parent = workspace
        local skulls = {}
        for i = 1, 5 do
            local skull = Instance.new("Part")
            skull.Shape = Enum.PartType.Ball
            skull.Size = Vector3.new(0.9, 0.9, 0.9)
            skull.Color = Color3.fromRGB(230, 225, 210)
            skull.Material = Enum.Material.SmoothPlastic
            skull.Anchored = true
            skull.CanCollide = false
            skull.Parent = skullFolder
            local jaw = Instance.new("Part")
            jaw.Size = Vector3.new(0.7, 0.25, 0.7)
            jaw.Color = Color3.fromRGB(220, 215, 200)
            jaw.Material = Enum.Material.SmoothPlastic
            jaw.Anchored = true
            jaw.CanCollide = false
            jaw.Parent = skullFolder
            local eyeL = Instance.new("Part")
            eyeL.Shape = Enum.PartType.Ball
            eyeL.Size = Vector3.new(0.25, 0.25, 0.1)
            eyeL.Color = Color3.fromRGB(255, 50, 50)
            eyeL.Material = Enum.Material.Neon
            eyeL.Anchored = true
            eyeL.CanCollide = false
            eyeL.Parent = skullFolder
            local eyeR = Instance.new("Part")
            eyeR.Shape = Enum.PartType.Ball
            eyeR.Size = Vector3.new(0.25, 0.25, 0.1)
            eyeR.Color = Color3.fromRGB(255, 50, 50)
            eyeR.Material = Enum.Material.Neon
            eyeR.Anchored = true
            eyeR.CanCollide = false
            eyeR.Parent = skullFolder
            table.insert(skulls, { skull = skull, jaw = jaw, eyeL = eyeL, eyeR = eyeR, angle = (i / 5) * math.pi * 2 })
        end
        skullConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            for _, data in ipairs(skulls) do
                local a = data.angle + tick() * 1
                local basePos = h.CFrame * CFrame.new(math.cos(a) * 2.8, 0.5 + math.sin(tick() * 3) * 0.4, math.sin(a) * 2.8)
                local lookAt = CFrame.new(basePos.Position, h.Position + Vector3.new(0, 1, 0))
                data.skull.CFrame = lookAt
                data.jaw.CFrame = lookAt * CFrame.new(0, -0.5, 0.1)
                data.eyeL.CFrame = lookAt * CFrame.new(-0.25, 0.1, 0.4)
                data.eyeR.CFrame = lookAt * CFrame.new(0.25, 0.1, 0.4)
            end
        end)
    else
        if skullConn then skullConn:Disconnect() skullConn = nil end
        if skullFolder then skullFolder:Destroy() skullFolder = nil end
    end
end
makeButton(visualsTab, "Skull Aura", function(btn, ind) toggleSkull(); if skullOn then setOn(btn, ind) else setOff(btn, ind) end; notify(skullOn and "Skulls вкл" or "Skulls выкл") end)
bindActions["Skull Aura"] = toggleSkull

-- GALAXY AURA
galaxyOn = false
galaxyFolder = nil
galaxyConn = nil
local function toggleGalaxy()
    galaxyOn = not galaxyOn
    if galaxyOn then
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        galaxyFolder = Instance.new("Folder")
        galaxyFolder.Parent = workspace
        local parts = {}
        for i = 1, 40 do
            local star = Instance.new("Part")
            star.Shape = Enum.PartType.Ball
            star.Size = Vector3.new(0.15, 0.15, 0.15)
            star.Color = Color3.fromHSV(math.random(), 0.7, 1)
            star.Material = Enum.Material.Neon
            star.Anchored = true
            star.CanCollide = false
            star.Parent = galaxyFolder
            table.insert(parts, { part = star, angle = math.random() * math.pi * 2, radius = math.random() * 3 + 1, y = math.random() * 6 - 3 })
        end
        galaxyConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            for _, data in ipairs(parts) do
                local a = data.angle + tick() * 0.5
                data.part.CFrame = h.CFrame * CFrame.new(math.cos(a) * data.radius, data.y, math.sin(a) * data.radius)
            end
        end)
    else
        if galaxyConn then galaxyConn:Disconnect() galaxyConn = nil end
        if galaxyFolder then galaxyFolder:Destroy() galaxyFolder = nil end
    end
end
makeButton(visualsTab, "Galaxy Aura", function(btn, ind) toggleGalaxy(); if galaxyOn then setOn(btn, ind) else setOff(btn, ind) end; notify(galaxyOn and "Galaxy вкл" or "Galaxy выкл") end)
bindActions["Galaxy Aura"] = toggleGalaxy

-- LIGHTNING AURA
lightningAuraOn = false
lightningAuraFolder = nil
lightningAuraConn = nil
local function toggleLightningAura()
    lightningAuraOn = not lightningAuraOn
    if lightningAuraOn then
        lightningAuraFolder = Instance.new("Folder")
        lightningAuraFolder.Parent = workspace
        lightningAuraConn = RunService.Heartbeat:Connect(function()
            if not lightningAuraFolder then return end
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            if math.random() < 0.2 then
                local bolt = Instance.new("Part")
                bolt.Size = Vector3.new(0.1, math.random(3, 8), 0.1)
                bolt.Color = Color3.fromRGB(200, 200, 255)
                bolt.Material = Enum.Material.Neon
                bolt.Anchored = true
                bolt.CanCollide = false
                bolt.CFrame = h.CFrame * CFrame.new(math.random(-3, 3), math.random(0, 5), math.random(-3, 3))
                bolt.Parent = lightningAuraFolder
                task.delay(0.1, function() if bolt then bolt:Destroy() end end)
            end
        end)
    else
        if lightningAuraConn then lightningAuraConn:Disconnect() lightningAuraConn = nil end
        if lightningAuraFolder then lightningAuraFolder:Destroy() lightningAuraFolder = nil end
    end
end
makeButton(visualsTab, "Lightning Aura", function(btn, ind) toggleLightningAura(); if lightningAuraOn then setOn(btn, ind) else setOff(btn, ind) end; notify(lightningAuraOn and "Lightning Aura вкл" or "Lightning Aura выкл") end)
bindActions["Lightning Aura"] = toggleLightningAura

-- TORNADO AURA
tornadoOn = false
tornadoFolder = nil
tornadoConn = nil
local function toggleTornado()
    tornadoOn = not tornadoOn
    if tornadoOn then
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        tornadoFolder = Instance.new("Folder")
        tornadoFolder.Parent = workspace
        local parts = {}
        for i = 1, 30 do
            local p = Instance.new("Part")
            p.Size = Vector3.new(0.3, 0.3, 0.3)
            p.Color = C_ACCENT2
            p.Material = Enum.Material.Neon
            p.Anchored = true
            p.CanCollide = false
            p.Parent = tornadoFolder
            table.insert(parts, { part = p, angle = (i / 30) * math.pi * 2, y = (i / 30) * 6 - 3 })
        end
        tornadoConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            for _, data in ipairs(parts) do
                local a = data.angle + tick() * 3
                local r = 1 + (data.y + 3) / 6 * 2
                data.part.CFrame = h.CFrame * CFrame.new(math.cos(a) * r, data.y, math.sin(a) * r)
            end
        end)
    else
        if tornadoConn then tornadoConn:Disconnect() tornadoConn = nil end
        if tornadoFolder then tornadoFolder:Destroy() tornadoFolder = nil end
    end
end
makeButton(visualsTab, "Tornado Aura", function(btn, ind) toggleTornado(); if tornadoOn then setOn(btn, ind) else setOff(btn, ind) end; notify(tornadoOn and "Tornado вкл" or "Tornado выкл") end)
bindActions["Tornado Aura"] = toggleTornado

-- FIRE TRAIL
fireTrailOn = false
fireTrailFolder = nil
fireTrailConn = nil
local function toggleFireTrail()
    fireTrailOn = not fireTrailOn
    if fireTrailOn then
        fireTrailFolder = Instance.new("Folder")
        fireTrailFolder.Parent = workspace
        local lastPos = nil
        if fireTrailConn then fireTrailConn:Disconnect() end
        fireTrailConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            if lastPos and (h.Position - lastPos).Magnitude < 0.5 then return end
            lastPos = h.Position
            local fire = Instance.new("Part")
            fire.Size = Vector3.new(0.5, 0.5, 0.5)
            fire.Shape = Enum.PartType.Ball
            fire.Color = Color3.fromRGB(255, 100, 0)
            fire.Material = Enum.Material.Neon
            fire.Anchored = true
            fire.CanCollide = false
            fire.Position = h.Position - Vector3.new(0, 2.5, 0)
            fire.Parent = fireTrailFolder
            TweenService:Create(fire, TweenInfo.new(1.5), {Size = Vector3.new(0.1, 0.1, 0.1), Transparency = 1, Position = fire.Position + Vector3.new(0, 2, 0)}):Play()
            task.delay(1.5, function() if fire then fire:Destroy() end end)
        end)
    else
        if fireTrailConn then fireTrailConn:Disconnect() fireTrailConn = nil end
        if fireTrailFolder then fireTrailFolder:Destroy() fireTrailFolder = nil end
    end
end
makeButton(visualsTab, "Fire Trail", function(btn, ind) toggleFireTrail(); if fireTrailOn then setOn(btn, ind) else setOff(btn, ind) end; notify(fireTrailOn and "Fire Trail вкл" or "Fire Trail выкл") end)
bindActions["Fire Trail"] = toggleFireTrail

-- ICE TRAIL
iceTrailOn = false
iceTrailFolder = nil
iceTrailConn = nil
local function toggleIceTrail()
    iceTrailOn = not iceTrailOn
    if iceTrailOn then
        iceTrailFolder = Instance.new("Folder")
        iceTrailFolder.Parent = workspace
        local lastPos = nil
        if iceTrailConn then iceTrailConn:Disconnect() end
        iceTrailConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            if lastPos and (h.Position - lastPos).Magnitude < 0.5 then return end
            lastPos = h.Position
            local ice = Instance.new("Part")
            ice.Size = Vector3.new(0.5, 0.5, 0.5)
            ice.Shape = Enum.PartType.Ball
            ice.Color = Color3.fromRGB(150, 220, 255)
            ice.Material = Enum.Material.Ice
            ice.Anchored = true
            ice.CanCollide = false
            ice.Position = h.Position - Vector3.new(0, 2.5, 0)
            ice.Parent = iceTrailFolder
            TweenService:Create(ice, TweenInfo.new(2), {Size = Vector3.new(0.1, 0.1, 0.1), Transparency = 1}):Play()
            task.delay(2, function() if ice then ice:Destroy() end end)
        end)
    else
        if iceTrailConn then iceTrailConn:Disconnect() iceTrailConn = nil end
        if iceTrailFolder then iceTrailFolder:Destroy() iceTrailFolder = nil end
    end
end
makeButton(visualsTab, "Ice Trail", function(btn, ind) toggleIceTrail(); if iceTrailOn then setOn(btn, ind) else setOff(btn, ind) end; notify(iceTrailOn and "Ice Trail вкл" or "Ice Trail выкл") end)
bindActions["Ice Trail"] = toggleIceTrail

-- FOOTSTEPS
footstepsOn = false
footstepsFolder = nil
footstepsConn = nil
local function toggleFootsteps()
    footstepsOn = not footstepsOn
    if footstepsOn then
        footstepsFolder = Instance.new("Folder")
        footstepsFolder.Parent = workspace
        local lastPos = nil
        if footstepsConn then footstepsConn:Disconnect() end
        footstepsConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            if lastPos and (h.Position - lastPos).Magnitude < 3 then return end
            lastPos = h.Position
            local foot = Instance.new("Part")
            foot.Size = Vector3.new(0.8, 0.1, 0.8)
            foot.Shape = Enum.PartType.Cylinder
            foot.Color = C_ACCENT
            foot.Material = Enum.Material.Neon
            foot.Transparency = 0.3
            foot.Anchored = true
            foot.CanCollide = false
            foot.Position = h.Position - Vector3.new(0, 2.8, 0)
            foot.Orientation = Vector3.new(0, 0, 90)
            foot.Parent = footstepsFolder
            TweenService:Create(foot, TweenInfo.new(1.5), {Transparency = 1}):Play()
            task.delay(1.5, function() if foot then foot:Destroy() end end)
        end)
    else
        if footstepsConn then footstepsConn:Disconnect() footstepsConn = nil end
        if footstepsFolder then footstepsFolder:Destroy() footstepsFolder = nil end
    end
end
makeButton(visualsTab, "Footsteps", function(btn, ind) toggleFootsteps(); if footstepsOn then setOn(btn, ind) else setOff(btn, ind) end; notify(footstepsOn and "Footsteps вкл" or "Footsteps выкл") end)
bindActions["Footsteps"] = toggleFootsteps

-- ============================================
-- 12 КРУТЫХ ВИЗУАЛОВ
-- ============================================

-- BLACK HOLE
blackHoleOn = false
blackHoleFolder = nil
blackHoleConn = nil
local function toggleBlackHole()
    blackHoleOn = not blackHoleOn
    if blackHoleOn then
        local char = LocalPlayer.Character
        local head = char and char:FindFirstChild("Head")
        if not head then return end
        blackHoleFolder = Instance.new("Folder")
        blackHoleFolder.Parent = char
        local core = Instance.new("Part")
        core.Shape = Enum.PartType.Ball
        core.Size = Vector3.new(1.5, 1.5, 1.5)
        core.Color = Color3.fromRGB(0, 0, 0)
        core.Material = Enum.Material.SmoothPlastic
        core.Anchored = false
        core.CanCollide = false
        core.Massless = true
        core.CFrame = head.CFrame * CFrame.new(0, 3, 0)
        local w = Instance.new("WeldConstraint")
        w.Part0 = head
        w.Part1 = core
        w.Parent = core
        core.Parent = blackHoleFolder
        local diskParts = {}
        for ring = 1, 3 do
            for i = 1, 24 do
                local p = Instance.new("Part")
                p.Size = Vector3.new(0.4, 0.1, 0.2)
                p.Color = Color3.fromHSV((ring / 4) + 0.75, 0.8, 1)
                p.Material = Enum.Material.Neon
                p.Transparency = 0.2
                p.Anchored = false
                p.CanCollide = false
                p.Massless = true
                p.CFrame = head.CFrame * CFrame.new(0, 3, 0)
                local wp = Instance.new("WeldConstraint")
                wp.Part0 = head
                wp.Part1 = p
                wp.Parent = p
                p.Parent = blackHoleFolder
                table.insert(diskParts, { part = p, angle = (i / 24) * math.pi * 2, ring = ring })
            end
        end
        local light = Instance.new("PointLight")
        light.Color = Color3.fromRGB(150, 80, 255)
        light.Brightness = 5
        light.Range = 12
        light.Parent = core
        if blackHoleConn then blackHoleConn:Disconnect() end
        blackHoleConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("Head")
            if not h or not core.Parent then return end
            core.CFrame = h.CFrame * CFrame.new(0, 3, 0) * CFrame.Angles(tick() * 0.5, tick() * 0.8, 0)
            for _, data in ipairs(diskParts) do
                local speed = 5 - data.ring * 0.5
                local a = data.angle + tick() * speed
                local r = data.ring * 0.8 + 0.6
                data.part.CFrame = h.CFrame * CFrame.new(0, 3, 0) * CFrame.new(math.cos(a) * r, math.sin(tick() * 3 + data.ring) * 0.15, math.sin(a) * r) * CFrame.Angles(0, a, math.rad(90))
            end
        end)
    else
        if blackHoleConn then blackHoleConn:Disconnect() blackHoleConn = nil end
        if blackHoleFolder then blackHoleFolder:Destroy() blackHoleFolder = nil end
    end
end
makeButton(visualsTab, "Black Hole", function(btn, ind) toggleBlackHole(); if blackHoleOn then setOn(btn, ind) else setOff(btn, ind) end; notify(blackHoleOn and "Black Hole вкл" or "Black Hole выкл") end)
bindActions["Black Hole"] = toggleBlackHole

-- SOUL FLAME
soulFlameOn = false
soulFlameFolder = nil
soulFlameConn = nil
local function toggleSoulFlame()
    soulFlameOn = not soulFlameOn
    if soulFlameOn then
        soulFlameFolder = Instance.new("Folder")
        soulFlameFolder.Parent = workspace
        soulFlameConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            if math.random() < 0.6 then
                local flame = Instance.new("Part")
                flame.Shape = Enum.PartType.Ball
                flame.Size = Vector3.new(math.random(3, 6) / 10, math.random(5, 10) / 10, math.random(3, 6) / 10)
                flame.Color = Color3.fromRGB(100, 150, 255)
                flame.Material = Enum.Material.Neon
                flame.Transparency = 0.2
                flame.Anchored = true
                flame.CanCollide = false
                local a = math.random() * math.pi * 2
                local r = math.random() * 2
                flame.Position = h.Position + Vector3.new(math.cos(a) * r, math.random(-3, 3), math.sin(a) * r)
                flame.Parent = soulFlameFolder
                local endPos = flame.Position + Vector3.new(0, 3, 0)
                TweenService:Create(flame, TweenInfo.new(1.2), {Position = endPos, Size = Vector3.new(0.1, 0.1, 0.1), Transparency = 1}):Play()
                task.delay(1.2, function() if flame then flame:Destroy() end end)
            end
        end)
    else
        if soulFlameConn then soulFlameConn:Disconnect() soulFlameConn = nil end
        if soulFlameFolder then soulFlameFolder:Destroy() soulFlameFolder = nil end
    end
end
makeButton(visualsTab, "Soul Flame", function(btn, ind) toggleSoulFlame(); if soulFlameOn then setOn(btn, ind) else setOff(btn, ind) end; notify(soulFlameOn and "Soul Flame вкл" or "Soul Flame выкл") end)
bindActions["Soul Flame"] = toggleSoulFlame

-- ENERGY BEAM
energyBeamOn = false
energyBeamPart = nil
energyBeamCore = nil
energyBeamConn = nil
local function toggleEnergyBeam()
    energyBeamOn = not energyBeamOn
    if energyBeamOn then
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        energyBeamPart = Instance.new("Part")
        energyBeamPart.Size = Vector3.new(1.5, 60, 1.5)
        energyBeamPart.Color = C_ACCENT
        energyBeamPart.Material = Enum.Material.Neon
        energyBeamPart.Transparency = 0.4
        energyBeamPart.Anchored = false
        energyBeamPart.CanCollide = false
        energyBeamPart.Massless = true
        energyBeamPart.CFrame = hrp.CFrame * CFrame.new(0, 30, 0)
        local w = Instance.new("WeldConstraint")
        w.Part0 = hrp
        w.Part1 = energyBeamPart
        w.Parent = energyBeamPart
        energyBeamPart.Parent = char
        energyBeamCore = Instance.new("Part")
        energyBeamCore.Shape = Enum.PartType.Ball
        energyBeamCore.Size = Vector3.new(2, 2, 2)
        energyBeamCore.Color = C_ACCENT2
        energyBeamCore.Material = Enum.Material.Neon
        energyBeamCore.Anchored = false
        energyBeamCore.CanCollide = false
        energyBeamCore.Massless = true
        energyBeamCore.CFrame = hrp.CFrame * CFrame.new(0, 3, 0)
        local w2 = Instance.new("WeldConstraint")
        w2.Part0 = hrp
        w2.Part1 = energyBeamCore
        w2.Parent = energyBeamCore
        energyBeamCore.Parent = char
        local light = Instance.new("PointLight")
        light.Color = C_ACCENT
        light.Brightness = 8
        light.Range = 20
        light.Parent = energyBeamCore
        if energyBeamConn then energyBeamConn:Disconnect() end
        energyBeamConn = RunService.Heartbeat:Connect(function()
            if energyBeamPart then
                local scale = 1 + math.sin(tick() * 8) * 0.15
                energyBeamPart.Size = Vector3.new(1.5 * scale, 60, 1.5 * scale)
                energyBeamPart.Transparency = 0.3 + math.sin(tick() * 5) * 0.1
            end
        end)
    else
        if energyBeamConn then energyBeamConn:Disconnect() energyBeamConn = nil end
        if energyBeamPart then energyBeamPart:Destroy() energyBeamPart = nil end
        if energyBeamCore then energyBeamCore:Destroy() energyBeamCore = nil end
    end
end
makeButton(visualsTab, "Energy Beam", function(btn, ind) toggleEnergyBeam(); if energyBeamOn then setOn(btn, ind) else setOff(btn, ind) end; notify(energyBeamOn and "Energy Beam вкл" or "Energy Beam выкл") end)
bindActions["Energy Beam"] = toggleEnergyBeam

-- AURA WINGS
auraWingsOn = false
auraWingsFolder = nil
auraWingsConn = nil
local function toggleAuraWings()
    auraWingsOn = not auraWingsOn
    if auraWingsOn then
        auraWingsFolder = Instance.new("Folder")
        auraWingsFolder.Parent = workspace
        local wings = {}
        for side = -1, 1, 2 do
            for i = 1, 6 do
                local p = Instance.new("Part")
                p.Size = Vector3.new(0.3, 3 + i * 0.3, 0.15)
                p.Color = C_ACCENT
                p.Material = Enum.Material.Neon
                p.Transparency = 0.2
                p.Anchored = true
                p.CanCollide = false
                p.Parent = auraWingsFolder
                table.insert(wings, { part = p, side = side, i = i })
            end
        end
        if auraWingsConn then auraWingsConn:Disconnect() end
        auraWingsConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local t = c and (c:FindFirstChild("UpperTorso") or c:FindFirstChild("Torso"))
            if not t then return end
            for _, data in ipairs(wings) do
                local flap = math.sin(tick() * 3 + data.i * 0.4) * 20
                local spread = data.i * 0.6
                local angle = math.rad(60 + flap)
                data.part.CFrame = t.CFrame * CFrame.new(data.side * spread * math.cos(angle), spread * 0.3, 1) * CFrame.Angles(0, 0, data.side * (angle - math.rad(45)))
                data.part.Color = Color3.fromHSV((tick() * 0.4 + data.i * 0.1) % 1, 0.7, 1)
            end
        end)
    else
        if auraWingsConn then auraWingsConn:Disconnect() auraWingsConn = nil end
        if auraWingsFolder then auraWingsFolder:Destroy() auraWingsFolder = nil end
    end
end
makeButton(visualsTab, "Aura Wings", function(btn, ind) toggleAuraWings(); if auraWingsOn then setOn(btn, ind) else setOff(btn, ind) end; notify(auraWingsOn and "Aura Wings вкл" or "Aura Wings выкл") end)
bindActions["Aura Wings"] = toggleAuraWings

-- RAINBOW WAVE
rainbowWaveOn = false
rainbowWaveFolder = nil
rainbowWaveConn = nil
local function toggleRainbowWave()
    rainbowWaveOn = not rainbowWaveOn
    if rainbowWaveOn then
        rainbowWaveFolder = Instance.new("Folder")
        rainbowWaveFolder.Parent = workspace
        local waves = {}
        for i = 1, 36 do
            local p = Instance.new("Part")
            p.Size = Vector3.new(0.6, 0.15, 0.3)
            p.Material = Enum.Material.Neon
            p.Transparency = 0.3
            p.Anchored = true
            p.CanCollide = false
            p.Parent = rainbowWaveFolder
            table.insert(waves, { part = p, angle = (i / 36) * math.pi * 2 })
        end
        if rainbowWaveConn then rainbowWaveConn:Disconnect() end
        rainbowWaveConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            local groundY = h.Position.Y - 3
            for i, data in ipairs(waves) do
                local a = data.angle + tick() * 0.3
                local wave = math.sin(tick() * 3 + i * 0.2) * 0.5
                local r = 3 + wave
                data.part.CFrame = CFrame.new(h.Position.X + math.cos(a) * r, groundY + wave * 0.5, h.Position.Z + math.sin(a) * r) * CFrame.Angles(0, -a, 0)
                data.part.Color = Color3.fromHSV(((tick() * 0.5) + i / 36) % 1, 0.9, 1)
            end
        end)
    else
        if rainbowWaveConn then rainbowWaveConn:Disconnect() rainbowWaveConn = nil end
        if rainbowWaveFolder then rainbowWaveFolder:Destroy() rainbowWaveFolder = nil end
    end
end
makeButton(visualsTab, "Rainbow Wave", function(btn, ind) toggleRainbowWave(); if rainbowWaveOn then setOn(btn, ind) else setOff(btn, ind) end; notify(rainbowWaveOn and "Rainbow Wave вкл" or "Rainbow Wave выкл") end)
bindActions["Rainbow Wave"] = toggleRainbowWave

-- FIRE RING
fireRingOn = false
fireRingFolder = nil
fireRingConn = nil
local function toggleFireRing()
    fireRingOn = not fireRingOn
    if fireRingOn then
        fireRingFolder = Instance.new("Folder")
        fireRingFolder.Parent = workspace
        local parts = {}
        for i = 1, 30 do
            local p = Instance.new("Part")
            p.Shape = Enum.PartType.Ball
            p.Size = Vector3.new(0.5, 0.5, 0.5)
            p.Color = Color3.fromRGB(255, 100, 0)
            p.Material = Enum.Material.Neon
            p.Transparency = 0.2
            p.Anchored = true
            p.CanCollide = false
            p.Parent = fireRingFolder
            table.insert(parts, { part = p, angle = (i / 30) * math.pi * 2 })
        end
        if fireRingConn then fireRingConn:Disconnect() end
        fireRingConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            local tilt = math.sin(tick() * 0.5) * 30
            for i, data in ipairs(parts) do
                local a = data.angle + tick() * 3
                local r = 2.5
                data.part.CFrame = h.CFrame * CFrame.new(math.cos(a) * r, -2.5, math.sin(a) * r) * CFrame.Angles(0, 0, math.rad(tilt))
                data.part.Color = Color3.fromHSV(0.02 + math.sin(tick() * 5 + i) * 0.05, 1, 1)
            end
        end)
    else
        if fireRingConn then fireRingConn:Disconnect() fireRingConn = nil end
        if fireRingFolder then fireRingFolder:Destroy() fireRingFolder = nil end
    end
end
makeButton(visualsTab, "Fire Ring", function(btn, ind) toggleFireRing(); if fireRingOn then setOn(btn, ind) else setOff(btn, ind) end; notify(fireRingOn and "Fire Ring вкл" or "Fire Ring выкл") end)
bindActions["Fire Ring"] = toggleFireRing

-- ICE CRYSTALS
iceCrystalsOn = false
iceCrystalsFolder = nil
iceCrystalsConn = nil
local function toggleIceCrystals()
    iceCrystalsOn = not iceCrystalsOn
    if iceCrystalsOn then
        iceCrystalsFolder = Instance.new("Folder")
        iceCrystalsFolder.Parent = workspace
        local crystals = {}
        for i = 1, 10 do
            local crystal = Instance.new("Part")
            crystal.Size = Vector3.new(0.3, 0.8, 0.3)
            crystal.Color = Color3.fromRGB(150, 220, 255)
            crystal.Material = Enum.Material.Ice
            crystal.Transparency = 0.2
            crystal.Anchored = true
            crystal.CanCollide = false
            crystal.Parent = iceCrystalsFolder
            table.insert(crystals, { part = crystal, angle = (i / 10) * math.pi * 2, y = math.random() * 4 })
        end
        if iceCrystalsConn then iceCrystalsConn:Disconnect() end
        iceCrystalsConn = RunService.Heartbeat:Connect(function(dt)
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            for _, data in ipairs(crystals) do
                data.y = data.y + dt * 0.5
                if data.y > 5 then data.y = 0 end
                local a = data.angle + tick() * 1
                data.part.CFrame = h.CFrame * CFrame.new(math.cos(a) * 2.5, -2 + data.y, math.sin(a) * 2.5) * CFrame.Angles(tick() * 2, a, tick() * 1.5)
            end
        end)
    else
        if iceCrystalsConn then iceCrystalsConn:Disconnect() iceCrystalsConn = nil end
        if iceCrystalsFolder then iceCrystalsFolder:Destroy() iceCrystalsFolder = nil end
    end
end
makeButton(visualsTab, "Ice Crystals", function(btn, ind) toggleIceCrystals(); if iceCrystalsOn then setOn(btn, ind) else setOff(btn, ind) end; notify(iceCrystalsOn and "Ice Crystals вкл" or "Ice Crystals выкл") end)
bindActions["Ice Crystals"] = toggleIceCrystals

-- SHADOW AURA
shadowOn = false
shadowFolder = nil
shadowConn = nil
local function toggleShadow()
    shadowOn = not shadowOn
    if shadowOn then
        shadowFolder = Instance.new("Folder")
        shadowFolder.Parent = workspace
        local parts = {}
        for i = 1, 25 do
            local p = Instance.new("Part")
            p.Size = Vector3.new(0.4, 0.8, 0.4)
            p.Color = Color3.fromRGB(30, 0, 50)
            p.Material = Enum.Material.Neon
            p.Transparency = 0.4
            p.Anchored = true
            p.CanCollide = false
            p.Parent = shadowFolder
            table.insert(parts, { part = p, angle = (i / 25) * math.pi * 2, y = math.random() * 4 })
        end
        if shadowConn then shadowConn:Disconnect() end
        shadowConn = RunService.Heartbeat:Connect(function(dt)
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            for _, data in ipairs(parts) do
                data.y = data.y + dt * 2
                if data.y > 5 then data.y = 0 end
                local a = data.angle + tick() * 2
                data.part.CFrame = h.CFrame * CFrame.new(math.cos(a) * 2.5, -3 + data.y, math.sin(a) * 2.5) * CFrame.Angles(math.sin(tick() * 3) * 0.5, a, math.cos(tick() * 3) * 0.5)
            end
        end)
    else
        if shadowConn then shadowConn:Disconnect() shadowConn = nil end
        if shadowFolder then shadowFolder:Destroy() shadowFolder = nil end
    end
end
makeButton(visualsTab, "Shadow Aura", function(btn, ind) toggleShadow(); if shadowOn then setOn(btn, ind) else setOff(btn, ind) end; notify(shadowOn and "Shadow Aura вкл" or "Shadow Aura выкл") end)
bindActions["Shadow Aura"] = toggleShadow

-- GOLDEN AURA
goldenOn = false
goldenFolder = nil
goldenConn = nil
local function toggleGolden()
    goldenOn = not goldenOn
    if goldenOn then
        goldenFolder = Instance.new("Folder")
        goldenFolder.Parent = workspace
        local parts = {}
        for i = 1, 24 do
            local p = Instance.new("Part")
            p.Shape = Enum.PartType.Ball
            p.Size = Vector3.new(0.3, 0.3, 0.3)
            p.Color = Color3.fromRGB(255, 215, 0)
            p.Material = Enum.Material.Neon
            p.Transparency = 0.15
            p.Anchored = true
            p.CanCollide = false
            p.Parent = goldenFolder
            table.insert(parts, { part = p, angle = (i / 24) * math.pi * 2, y = math.random() * 5 })
        end
        if goldenConn then goldenConn:Disconnect() end
        goldenConn = RunService.Heartbeat:Connect(function(dt)
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            for _, data in ipairs(parts) do
                data.y = data.y + dt * 1.5
                if data.y > 6 then data.y = 0 end
                local a = data.angle + tick() * 1.5
                local r = 2.5 + math.sin(tick() * 2 + data.y) * 0.3
                data.part.CFrame = h.CFrame * CFrame.new(math.cos(a) * r, -3 + data.y, math.sin(a) * r)
            end
        end)
    else
        if goldenConn then goldenConn:Disconnect() goldenConn = nil end
        if goldenFolder then goldenFolder:Destroy() goldenFolder = nil end
    end
end
makeButton(visualsTab, "Golden Aura", function(btn, ind) toggleGolden(); if goldenOn then setOn(btn, ind) else setOff(btn, ind) end; notify(goldenOn and "Golden Aura вкл" or "Golden Aura выкл") end)
bindActions["Golden Aura"] = toggleGolden

-- LASER EYES
laserEyesOn = false
laserEyesFolder = nil
laserEyesConn = nil
local function toggleLaserEyes()
    laserEyesOn = not laserEyesOn
    if laserEyesOn then
        laserEyesFolder = Instance.new("Folder")
        laserEyesFolder.Parent = workspace
        local lasers = {}
        for _, side in ipairs({-0.15, 0.15}) do
            local p = Instance.new("Part")
            p.Size = Vector3.new(0.1, 0.1, 50)
            p.Color = Color3.fromRGB(255, 0, 0)
            p.Material = Enum.Material.Neon
            p.Transparency = 0.3
            p.Anchored = true
            p.CanCollide = false
            p.Parent = laserEyesFolder
            table.insert(lasers, { part = p, side = side })
        end
        if laserEyesConn then laserEyesConn:Disconnect() end
        laserEyesConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local head = c and c:FindFirstChild("Head")
            if not head then return end
            local cam = workspace.CurrentCamera
            for _, data in ipairs(lasers) do
                local startCF = head.CFrame * CFrame.new(data.side, 0.3, -0.6)
                local dir = cam.CFrame.LookVector
                data.part.CFrame = CFrame.new(startCF.Position + dir * 25, startCF.Position + dir * 50)
                data.part.Size = Vector3.new(0.1 + math.sin(tick() * 20) * 0.03, 0.1 + math.sin(tick() * 20) * 0.03, 50)
            end
        end)
    else
        if laserEyesConn then laserEyesConn:Disconnect() laserEyesConn = nil end
        if laserEyesFolder then laserEyesFolder:Destroy() laserEyesFolder = nil end
    end
end
makeButton(visualsTab, "Laser Eyes", function(btn, ind) toggleLaserEyes(); if laserEyesOn then setOn(btn, ind) else setOff(btn, ind) end; notify(laserEyesOn and "Laser Eyes вкл" or "Laser Eyes выкл") end)
bindActions["Laser Eyes"] = toggleLaserEyes

-- SNOW AURA
snowAuraOn = false
snowAuraFolder = nil
snowAuraConn = nil
local function toggleSnowAura()
    snowAuraOn = not snowAuraOn
    if snowAuraOn then
        snowAuraFolder = Instance.new("Folder")
        snowAuraFolder.Parent = workspace
        local flakes = {}
        for i = 1, 20 do
            local flake = Instance.new("Part")
            flake.Size = Vector3.new(0.25, 0.05, 0.25)
            flake.Color = Color3.fromRGB(220, 240, 255)
            flake.Material = Enum.Material.Neon
            flake.Transparency = 0.2
            flake.Anchored = true
            flake.CanCollide = false
            flake.Parent = snowAuraFolder
            table.insert(flakes, { part = flake, angle = math.random() * math.pi * 2, r = 1.5 + math.random() * 2, y = math.random() * 6, rot = math.random() * 360 })
        end
        if snowAuraConn then snowAuraConn:Disconnect() end
        snowAuraConn = RunService.Heartbeat:Connect(function(dt)
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            for _, data in ipairs(flakes) do
                data.y = data.y - dt * 1.5
                if data.y < -3 then data.y = 6 end
                data.angle = data.angle + dt * 0.5
                data.rot = data.rot + dt * 120
                data.part.CFrame = h.CFrame * CFrame.new(math.cos(data.angle) * data.r, data.y, math.sin(data.angle) * data.r) * CFrame.Angles(0, math.rad(data.rot), 0)
            end
        end)
    else
        if snowAuraConn then snowAuraConn:Disconnect() snowAuraConn = nil end
        if snowAuraFolder then snowAuraFolder:Destroy() snowAuraFolder = nil end
    end
end
makeButton(visualsTab, "Snow Aura", function(btn, ind) toggleSnowAura(); if snowAuraOn then setOn(btn, ind) else setOff(btn, ind) end; notify(snowAuraOn and "Snow Aura вкл" or "Snow Aura выкл") end)
bindActions["Snow Aura"] = toggleSnowAura

-- GALAXY ORBIT
galaxyOrbitOn = false
galaxyOrbitFolder = nil
galaxyOrbitConn = nil
local function toggleGalaxyOrbit()
    galaxyOrbitOn = not galaxyOrbitOn
    if galaxyOrbitOn then
        galaxyOrbitFolder = Instance.new("Folder")
        galaxyOrbitFolder.Parent = workspace
        local planets = {}
        for i = 1, 5 do
            local planet = Instance.new("Part")
            planet.Shape = Enum.PartType.Ball
            planet.Size = Vector3.new(0.5 + i * 0.1, 0.5 + i * 0.1, 0.5 + i * 0.1)
            planet.Color = Color3.fromHSV(i / 5, 0.7, 1)
            planet.Material = Enum.Material.Neon
            planet.Anchored = true
            planet.CanCollide = false
            planet.Parent = galaxyOrbitFolder
            local ring = Instance.new("Part")
            ring.Shape = Enum.PartType.Cylinder
            ring.Size = Vector3.new(0.05, 1 + i * 0.2, 1 + i * 0.2)
            ring.Color = Color3.fromHSV(i / 5, 0.5, 1)
            ring.Material = Enum.Material.Neon
            ring.Transparency = 0.4
            ring.Anchored = true
            ring.CanCollide = false
            ring.Parent = galaxyOrbitFolder
            table.insert(planets, { planet = planet, ring = ring, angle = (i / 5) * math.pi * 2, dist = 3 + i * 0.3, yOffset = (i - 3) * 0.5 })
        end
        if galaxyOrbitConn then galaxyOrbitConn:Disconnect() end
        galaxyOrbitConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            for _, data in ipairs(planets) do
                local a = data.angle + tick() * (1 + data.dist * 0.1)
                local pos = h.Position + Vector3.new(math.cos(a) * data.dist, data.yOffset, math.sin(a) * data.dist)
                data.planet.CFrame = CFrame.new(pos) * CFrame.Angles(tick() * 2, tick() * 2, 0)
                data.ring.CFrame = CFrame.new(pos) * CFrame.Angles(math.rad(70), tick() * 1.5, 0)
            end
        end)
    else
        if galaxyOrbitConn then galaxyOrbitConn:Disconnect() galaxyOrbitConn = nil end
        if galaxyOrbitFolder then galaxyOrbitFolder:Destroy() galaxyOrbitFolder = nil end
    end
end
makeButton(visualsTab, "Galaxy Orbit", function(btn, ind) toggleGalaxyOrbit(); if galaxyOrbitOn then setOn(btn, ind) else setOff(btn, ind) end; notify(galaxyOrbitOn and "Galaxy Orbit вкл" or "Galaxy Orbit выкл") end)
bindActions["Galaxy Orbit"] = toggleGalaxyOrbit

-- ANGEL WINGS
wingsOn = false
wingsFolder = nil
wingsConnection = nil
wingsParts = { left = {}, right = {} }
FLAP_SPEED = 2.0
FLAP_ANGLE = 5
local function createWings()
    local char = LocalPlayer.Character
    if not char then return end
    local torso = char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")
    if not torso then return end
    if wingsFolder then wingsFolder:Destroy() end
    wingsFolder = Instance.new("Folder")
    wingsFolder.Parent = char
    wingsParts = { left = {}, right = {} }
    for side = -1, 1, 2 do
        local sideName = (side == -1) and "left" or "right"
        for i = 1, 8 do
            local t = (i - 1) / 7
            local angle = -15 + 110 * t
            local angleRad = math.rad(angle)
            local radius = 2.0 + t * 8.0
            local part = Instance.new("Part")
            part.Size = Vector3.new(1.5 + t * 0.5, 6.0 + t * 2.0, 0.3)
            part.Color = config.wingsColor
            part.Material = Enum.Material.Neon
            part.Transparency = 0.15 - t * 0.05
            part.Anchored = true
            part.CanCollide = false
            part.Massless = true
            part.Parent = wingsFolder
            local offset = Vector3.new(side * (0.4 + math.sin(angleRad) * radius), -1.4 + math.cos(angleRad) * radius * 0.5, 0.5)
            part.CFrame = torso.CFrame * CFrame.new(offset) * CFrame.Angles(0, 0, side * (angleRad - math.rad(90)))
            table.insert(wingsParts[sideName], { part = part, angle = angle, radius = radius, side = side, t = t, isTop = false })
        end
        for i = 1, 6 do
            local t = (i - 1) / 5
            local angle = -5 + 90 * t
            local angleRad = math.rad(angle)
            local radius = 2.5 + t * 7.0
            local part = Instance.new("Part")
            part.Size = Vector3.new(1.2 + t * 0.3, 5.0 + t * 1.5, 0.2)
            part.Color = C_ACCENT2
            part.Material = Enum.Material.Neon
            part.Transparency = 0.3 - t * 0.05
            part.Anchored = true
            part.CanCollide = false
            part.Massless = true
            part.Parent = wingsFolder
            local offset = Vector3.new(side * (0.4 + math.sin(angleRad) * radius), -1.4 + math.cos(angleRad) * radius * 0.5, 0.8)
            part.CFrame = torso.CFrame * CFrame.new(offset) * CFrame.Angles(0, 0, side * (angleRad - math.rad(90)))
            table.insert(wingsParts[sideName], { part = part, angle = angle, radius = radius, side = side, t = t, isTop = true })
        end
    end
    for _, parts in pairs(wingsParts) do
        for _, data in ipairs(parts) do
            local light = Instance.new("PointLight")
            light.Color = config.wingsColor
            light.Brightness = 1.2
            light.Range = 5
            light.Parent = data.part
        end
    end
    if wingsConnection then wingsConnection:Disconnect() end
    wingsConnection = RunService.Heartbeat:Connect(function()
        local c = LocalPlayer.Character
        if not c then return end
        local t2 = c:FindFirstChild("UpperTorso") or c:FindFirstChild("Torso")
        if not t2 then return end
        local t = tick()
        for _, parts in pairs(wingsParts) do
            for _, data in ipairs(parts) do
                local delay = data.t * 0.3
                local flap = math.sin(t * FLAP_SPEED - delay) * FLAP_ANGLE
                local currentAngle = math.rad(data.angle + flap)
                local z = data.isTop and 0.8 or 0.5
                local offset = Vector3.new(data.side * (0.4 + math.sin(currentAngle) * data.radius), -1.4 + math.cos(currentAngle) * data.radius * 0.5, z)
                data.part.CFrame = t2.CFrame * CFrame.new(offset) * CFrame.Angles(0, 0, data.side * (currentAngle - math.rad(90)))
            end
        end
    end)
end
local function removeWings()
    if wingsConnection then wingsConnection:Disconnect() wingsConnection = nil end
    if wingsFolder then wingsFolder:Destroy() wingsFolder = nil end
    wingsParts = { left = {}, right = {} }
end
local function toggleWings()
    wingsOn = not wingsOn
    if wingsOn then createWings() else removeWings() end
end
makeButton(visualsTab, "Angel Wings", function(btn, ind) toggleWings(); if wingsOn then setOn(btn, ind) else setOff(btn, ind) end; notify(wingsOn and "Wings вкл" or "Wings выкл") end, {
    { type = "color", label = "Цвет", callback = function(c) config.wingsColor = c; if wingsOn then createWings() end end },
    { type = "slider", label = "Скорость взмаха", min = 0.5, max = 5, value = FLAP_SPEED, callback = function(v) FLAP_SPEED = v end },
})
bindActions["Angel Wings"] = toggleWings

-- 🔻 ПРОДОЛЖЕНИЕ В ЧАСТИ 3/3 🔻-- ============================================
-- KOLBASKA HUB v3 FINAL — ЧАСТЬ 3/3
-- Exploits, Scripts, Fun, Dev, Settings, Восстановление
-- ============================================

-- ============================================
-- EXPLOITS
-- ============================================

-- NOCLIP
noclipOn = false
noclipConn = nil
local function toggleNoclip()
    noclipOn = not noclipOn
    if noclipOn then
        noclipConn = RunService.Stepped:Connect(function()
            local char = LocalPlayer.Character
            if char then
                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end
        end)
    else
        if noclipConn then noclipConn:Disconnect() noclipConn = nil end
        local char = LocalPlayer.Character
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then part.CanCollide = true end
            end
        end
    end
end
makeButton(exploitsTab, "Noclip", function(btn, ind) toggleNoclip(); if noclipOn then setOn(btn, ind) else setOff(btn, ind) end; notify(noclipOn and "Noclip вкл" or "Noclip выкл") end)
bindActions["Noclip"] = toggleNoclip

-- SPEED
speedOn = false
speedConn = nil
origSpeed = 16
local function toggleSpeed()
    speedOn = not speedOn
    if speedOn then
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChild("Humanoid")
        if hum then origSpeed = hum.WalkSpeed end
        speedConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("Humanoid")
            if h then h.WalkSpeed = config.speedValue end
        end)
    else
        if speedConn then speedConn:Disconnect() speedConn = nil end
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChild("Humanoid")
        if hum then hum.WalkSpeed = origSpeed end
    end
end
makeButton(exploitsTab, "Speed", function(btn, ind) toggleSpeed(); if speedOn then setOn(btn, ind) else setOff(btn, ind) end; notify(speedOn and "Speed вкл" or "Speed выкл") end, {
    { type = "slider", label = "Скорость", min = 16, max = 500, value = config.speedValue, callback = function(v) config.speedValue = v end },
})
bindActions["Speed"] = toggleSpeed

-- ESP
espOn = false
espFolder = nil
local function createESP()
    if espFolder then espFolder:Destroy() end
    espFolder = Instance.new("Folder")
    espFolder.Parent = workspace
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local hl = Instance.new("Highlight")
            hl.FillColor = C_ACCENT
            hl.FillTransparency = 0.5
            hl.OutlineColor = C_ACCENT2
            hl.Adornee = plr.Character
            hl.Parent = espFolder
        end
    end
end
local function toggleESP()
    espOn = not espOn
    if espOn then createESP()
    else if espFolder then espFolder:Destroy() espFolder = nil end end
end
makeButton(exploitsTab, "ESP", function(btn, ind) toggleESP(); if espOn then setOn(btn, ind) else setOff(btn, ind) end; notify(espOn and "ESP вкл" or "ESP выкл") end)
bindActions["ESP"] = toggleESP

Players.PlayerAdded:Connect(function(plr)
    if not espOn then return end
    plr.CharacterAdded:Connect(function(char)
        task.wait(0.5)
        if espOn and espFolder then
            local hl = Instance.new("Highlight")
            hl.FillColor = C_ACCENT
            hl.FillTransparency = 0.5
            hl.OutlineColor = C_ACCENT2
            hl.Adornee = char
            hl.Parent = espFolder
        end
    end)
end)

-- BUNNY HOP
bunnyHopOn = false
bunnyHopConn = nil
local function toggleBunnyHop()
    bunnyHopOn = not bunnyHopOn
    if bunnyHopOn then
        bunnyHopConn = RunService.Heartbeat:Connect(function()
            local char = LocalPlayer.Character
            local hum = char and char:FindFirstChild("Humanoid")
            if hum and hum:GetState() == Enum.HumanoidStateType.Landed then
                hum:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    else
        if bunnyHopConn then bunnyHopConn:Disconnect() bunnyHopConn = nil end
    end
end
makeButton(exploitsTab, "Bunny Hop", function(btn, ind) toggleBunnyHop(); if bunnyHopOn then setOn(btn, ind) else setOff(btn, ind) end; notify(bunnyHopOn and "Bunny Hop вкл" or "Bunny Hop выкл") end)
bindActions["Bunny Hop"] = toggleBunnyHop

-- AIR JUMP
airJumpOn = false
airJumpConn = nil
lastJumpTime = 0
local function toggleAirJump()
    airJumpOn = not airJumpOn
    if airJumpOn then
        airJumpConn = UserInputService.JumpRequest:Connect(function()
            local char = LocalPlayer.Character
            local hum = char and char:FindFirstChild("Humanoid")
            if not hum then return end
            local now = tick()
            if now - lastJumpTime < 0.15 then return end
            lastJumpTime = now
            if hum:GetState() ~= Enum.HumanoidStateType.Jumping then
                hum:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    else
        if airJumpConn then airJumpConn:Disconnect() airJumpConn = nil end
    end
end
makeButton(exploitsTab, "Air Jump", function(btn, ind) toggleAirJump(); if airJumpOn then setOn(btn, ind) else setOff(btn, ind) end; notify(airJumpOn and "Air Jump вкл" or "Air Jump выкл") end)
bindActions["Air Jump"] = toggleAirJump

-- CLICK TP
clickTpOn = false
clickTpConn = nil
local function toggleClickTP()
    clickTpOn = not clickTpOn
    if clickTpOn then
        clickTpConn = UserInputService.InputBegan:Connect(function(input, gpe)
            if gpe then return end
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                local char = LocalPlayer.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if not hrp then return end
                local mouse = LocalPlayer:GetMouse()
                if not mouse.Hit then return end
                local targetPos = mouse.Hit.Position + Vector3.new(0, 3, 0)
                task.spawn(function()
                    local startPos = hrp.Position
                    local steps = math.max(math.ceil((targetPos - startPos).Magnitude / 10), 1)
                    for i = 1, steps do
                        if not hrp or not hrp.Parent then break end
                        hrp.CFrame = CFrame.new(startPos:Lerp(targetPos, i / steps))
                        task.wait(0.05)
                    end
                end)
            end
        end)
    else
        if clickTpConn then clickTpConn:Disconnect() clickTpConn = nil end
    end
end
makeButton(exploitsTab, "Click TP", function(btn, ind) toggleClickTP(); if clickTpOn then setOn(btn, ind) else setOff(btn, ind) end; notify(clickTpOn and "Click TP вкл" or "Click TP выкл") end)
bindActions["Click TP"] = toggleClickTP

-- AIM ASSIST
aimAssistOn = false
aimAssistConn = nil
local function toggleAimAssist()
    aimAssistOn = not aimAssistOn
    if aimAssistOn then
        aimAssistConn = RunService.RenderStepped:Connect(function()
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            local cam = workspace.CurrentCamera
            local myPos = cam.CFrame.Position
            local closest, closestDist = nil, 200
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and plr.Character then
                    local tHrp = plr.Character:FindFirstChild("HumanoidRootPart")
                    local tHum = plr.Character:FindFirstChild("Humanoid")
                    if tHrp and tHum and tHum.Health > 0 then
                        local dist = (tHrp.Position - myPos).Magnitude
                        if dist < closestDist then
                            closestDist = dist
                            closest = tHrp
                        end
                    end
                end
            end
            if closest then
                local target = closest.Position
                local current = cam.CFrame.LookVector
                local desired = (target - myPos).Unit
                local newDir = current:Lerp(desired, 0.05)
                cam.CFrame = CFrame.new(myPos, myPos + newDir)
            end
        end)
    else
        if aimAssistConn then aimAssistConn:Disconnect() aimAssistConn = nil end
    end
end
makeButton(exploitsTab, "Aim Assist", function(btn, ind) toggleAimAssist(); if aimAssistOn then setOn(btn, ind) else setOff(btn, ind) end; notify(aimAssistOn and "Aim Assist вкл" or "Aim Assist выкл") end)
bindActions["Aim Assist"] = toggleAimAssist

-- AIMBOT
aimbotOn = false
aimbotConn = nil
local function toggleAimbot()
    aimbotOn = not aimbotOn
    if aimbotOn then
        aimbotConn = RunService.RenderStepped:Connect(function()
            if not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then return end
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            local cam = workspace.CurrentCamera
            local myPos = cam.CFrame.Position
            local closest, closestDist = nil, 500
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and plr.Character then
                    local tHrp = plr.Character:FindFirstChild("HumanoidRootPart")
                    local tHum = plr.Character:FindFirstChild("Humanoid")
                    if tHrp and tHum and tHum.Health > 0 then
                        local dist = (tHrp.Position - myPos).Magnitude
                        if dist < closestDist then
                            closestDist = dist
                            closest = tHrp
                        end
                    end
                end
            end
            if closest then
                cam.CFrame = CFrame.new(myPos, closest.Position)
            end
        end)
    else
        if aimbotConn then aimbotConn:Disconnect() aimbotConn = nil end
    end
end
makeButton(exploitsTab, "Aimbot", function(btn, ind) toggleAimbot(); if aimbotOn then setOn(btn, ind) else setOff(btn, ind) end; notify(aimbotOn and "Aimbot вкл" or "Aimbot выкл") end)
bindActions["Aimbot"] = toggleAimbot

-- TRIGGER BOT
triggerBotOn = false
triggerBotConn = nil
lastActivate = 0
local function toggleTriggerBot()
    triggerBotOn = not triggerBotOn
    if triggerBotOn then
        triggerBotConn = RunService.RenderStepped:Connect(function()
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            local cam = workspace.CurrentCamera
            local ray = Ray.new(cam.CFrame.Position, cam.CFrame.LookVector * 500)
            local hit = workspace:FindPartOnRay(ray, char)
            if hit then
                local targetChar = hit:FindFirstAncestorOfClass("Model")
                if targetChar and targetChar ~= char then
                    local targetHum = targetChar:FindFirstChild("Humanoid")
                    if targetHum and targetHum.Health > 0 then
                        local now = tick()
                        if now - lastActivate < 0.1 then return end
                        lastActivate = now
                        local tool = char:FindFirstChildOfClass("Tool")
                        if tool then pcall(function() tool:Activate() end) end
                        pcall(function()
                            local vu = game:GetService("VirtualUser")
                            vu:CaptureController()
                            vu:ClickButton1(Vector2.new())
                        end)
                    end
                end
            end
        end)
    else
        if triggerBotConn then triggerBotConn:Disconnect() triggerBotConn = nil end
    end
end
makeButton(exploitsTab, "Trigger Bot", function(btn, ind) toggleTriggerBot(); if triggerBotOn then setOn(btn, ind) else setOff(btn, ind) end; notify(triggerBotOn and "Trigger Bot вкл" or "Trigger Bot выкл") end)
bindActions["Trigger Bot"] = toggleTriggerBot

-- ANTI-FLING
antiFlingOn = false
antiFlingConn = nil
antiLastPos = nil
local function toggleAntiFling()
    antiFlingOn = not antiFlingOn
    if antiFlingOn then
        antiFlingConn = RunService.Heartbeat:Connect(function()
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            local vel = hrp.AssemblyLinearVelocity
            if vel.Magnitude > 100 then
                hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                hrp.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
            end
            if antiLastPos and (hrp.Position - antiLastPos).Magnitude > 30 then
                hrp.CFrame = CFrame.new(antiLastPos)
            end
            antiLastPos = hrp.Position
        end)
    else
        if antiFlingConn then antiFlingConn:Disconnect() antiFlingConn = nil end
        antiLastPos = nil
    end
end
makeButton(exploitsTab, "Anti-Fling", function(btn, ind) toggleAntiFling(); if antiFlingOn then setOn(btn, ind) else setOff(btn, ind) end; notify(antiFlingOn and "Anti-Fling вкл" or "Anti-Fling выкл") end)
bindActions["Anti-Fling"] = toggleAntiFling

-- VELOCITY (бывший Anti-Knockback)
velocityOn = false
velocityConn = nil
local function toggleVelocity()
    velocityOn = not velocityOn
    if velocityOn then
        velocityConn = RunService.Heartbeat:Connect(function()
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChild("Humanoid")
            if not hrp or not hum then return end
            for _, child in ipairs(hrp:GetChildren()) do
                if child:IsA("BodyVelocity") or child:IsA("BodyForce") then
                    if child.Name ~= "FlyBV" then child:Destroy() end
                end
            end
            local vel = hrp.AssemblyLinearVelocity
            if vel.Magnitude > hum.WalkSpeed * 2 and not hrp:FindFirstChild("FlyBV") then
                hrp.AssemblyLinearVelocity = Vector3.new(0, vel.Y, 0)
            end
        end)
    else
        if velocityConn then velocityConn:Disconnect() velocityConn = nil end
    end
end
makeButton(exploitsTab, "Velocity", function(btn, ind) toggleVelocity(); if velocityOn then setOn(btn, ind) else setOff(btn, ind) end; notify(velocityOn and "Velocity вкл" or "Velocity выкл") end)
bindActions["Velocity"] = toggleVelocity

-- ANTI-AFK
antiAfkOn = false
antiAfkConn = nil
local function toggleAntiAfk()
    antiAfkOn = not antiAfkOn
    if antiAfkOn then
        antiAfkConn = LocalPlayer.Idled:Connect(function()
            local vu = game:GetService("VirtualUser")
            vu:CaptureController()
            vu:ClickButton2(Vector2.new())
        end)
    else
        if antiAfkConn then antiAfkConn:Disconnect() antiAfkConn = nil end
    end
end
makeButton(exploitsTab, "Anti-AFK", function(btn, ind) toggleAntiAfk(); if antiAfkOn then setOn(btn, ind) else setOff(btn, ind) end; notify(antiAfkOn and "Anti-AFK вкл" or "Anti-AFK выкл") end)
bindActions["Anti-AFK"] = toggleAntiAfk

-- FLY
flyOn = false
flyConn = nil
local function toggleFly()
    flyOn = not flyOn
    if flyOn then
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChild("Humanoid")
        if hrp and hum then
            hum.PlatformStand = true
            local bv = Instance.new("BodyVelocity")
            bv.Name = "FlyBV"
            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bv.Velocity = Vector3.new(0, 0, 0)
            bv.Parent = hrp
            local bg = Instance.new("BodyGyro")
            bg.Name = "FlyBG"
            bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            bg.P = 9e4
            bg.CFrame = hrp.CFrame
            bg.Parent = hrp
            flyConn = RunService.RenderStepped:Connect(function()
                local c = LocalPlayer.Character
                local h = c and c:FindFirstChild("HumanoidRootPart")
                if not h then return end
                local cam = workspace.CurrentCamera
                local dir = Vector3.new(0, 0, 0)
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + cam.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - cam.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - cam.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + cam.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0, 1, 0) end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then dir = dir - Vector3.new(0, 1, 0) end
                bv.Velocity = dir.Magnitude > 0 and dir.Unit * config.flySpeed or Vector3.new(0, 0, 0)
                bg.CFrame = cam.CFrame
            end)
        end
    else
        if flyConn then flyConn:Disconnect() flyConn = nil end
        local char = LocalPlayer.Character
        if char then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            local hum = char:FindFirstChild("Humanoid")
            if hrp then
                if hrp:FindFirstChild("FlyBV") then hrp.FlyBV:Destroy() end
                if hrp:FindFirstChild("FlyBG") then hrp.FlyBG:Destroy() end
            end
            if hum then hum.PlatformStand = false end
        end
    end
end
makeButton(exploitsTab, "Fly", function(btn, ind) toggleFly(); if flyOn then setOn(btn, ind) else setOff(btn, ind) end; notify(flyOn and "Fly вкл" or "Fly выкл") end, {
    { type = "slider", label = "Скорость", min = 20, max = 500, value = config.flySpeed, callback = function(v) config.flySpeed = v end },
})
bindActions["Fly"] = toggleFly

-- GRAVITY
gravityOn = false
gravityValue = 20
origGravity = workspace.Gravity
local function toggleGravity()
    gravityOn = not gravityOn
    if gravityOn then workspace.Gravity = gravityValue
    else workspace.Gravity = origGravity end
end
makeButton(exploitsTab, "Gravity", function(btn, ind) toggleGravity(); if gravityOn then setOn(btn, ind) else setOff(btn, ind) end; notify(gravityOn and "Gravity вкл" or "Gravity выкл") end, {
    { type = "slider", label = "Гравитация", min = 0, max = 200, value = gravityValue, callback = function(v) gravityValue = v; if gravityOn then workspace.Gravity = v end end },
})
bindActions["Gravity"] = toggleGravity

-- FREEZE
freezeOn = false
freezeConn = nil
freezePos = nil
local function toggleFreeze()
    freezeOn = not freezeOn
    if freezeOn then
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if hrp then freezePos = hrp.CFrame end
        freezeConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if h and freezePos then
                h.CFrame = freezePos
                h.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                h.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
            end
        end)
    else
        if freezeConn then freezeConn:Disconnect() freezeConn = nil end
        freezePos = nil
    end
end
makeButton(exploitsTab, "Freeze", function(btn, ind) toggleFreeze(); if freezeOn then setOn(btn, ind) else setOff(btn, ind) end; notify(freezeOn and "Freeze вкл" or "Freeze выкл") end)
bindActions["Freeze"] = toggleFreeze

-- AUTO CLICKER
autoClickerOn = false
autoClickerInterval = 0.1
local function toggleAutoClicker()
    autoClickerOn = not autoClickerOn
    if autoClickerOn then
        task.spawn(function()
            while autoClickerOn do
                pcall(function()
                    local vu = game:GetService("VirtualUser")
                    vu:CaptureController()
                    vu:ClickButton1(Vector2.new())
                end)
                task.wait(autoClickerInterval)
            end
        end)
    end
end
makeButton(exploitsTab, "Auto Clicker", function(btn, ind) toggleAutoClicker(); if autoClickerOn then setOn(btn, ind) else setOff(btn, ind) end; notify(autoClickerOn and "Auto Clicker вкл" or "Auto Clicker выкл") end)
bindActions["Auto Clicker"] = toggleAutoClicker

-- TP TO PLAYER
tpGui = nil
local function createTpGui()
    if tpGui then tpGui:Destroy() end
    tpGui = Instance.new("Frame")
    tpGui.Size = UDim2.new(0, 240, 0, 120)
    tpGui.Position = UDim2.new(0.5, -120, 0.5, -60)
    tpGui.BackgroundColor3 = C_BG
    tpGui.BorderSizePixel = 0
    tpGui.Active = true
    tpGui.Draggable = true
    tpGui.ZIndex = 10
    tpGui.Parent = gui
    Instance.new("UICorner", tpGui).CornerRadius = UDim.new(0, 12)
    local s = Instance.new("UIStroke")
    s.Color = C_ACCENT
    s.Thickness = 1
    s.Parent = tpGui
    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, 0, 0, 30)
    t.BackgroundTransparency = 1
    t.Text = "TP TO PLAYER"
    t.TextColor3 = C_ACCENT
    t.Font = Enum.Font.GothamBold
    t.TextSize = 13
    t.Parent = tpGui
    local inp = Instance.new("TextBox")
    inp.Size = UDim2.new(1, -20, 0, 30)
    inp.Position = UDim2.new(0, 10, 0, 35)
    inp.BackgroundColor3 = C_BTN
    inp.BorderSizePixel = 0
    inp.Text = ""
    inp.PlaceholderText = "Ник игрока..."
    inp.PlaceholderColor3 = C_TEXT_DIM
    inp.TextColor3 = C_TEXT
    inp.Font = Enum.Font.Gotham
    inp.TextSize = 12
    inp.ClearTextOnFocus = false
    inp.Parent = tpGui
    Instance.new("UICorner", inp).CornerRadius = UDim.new(0, 6)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, -20, 0, 30)
    b.Position = UDim2.new(0, 10, 0, 75)
    b.BackgroundColor3 = C_ACCENT
    b.BorderSizePixel = 0
    b.Text = "Телепортироваться"
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 12
    b.AutoButtonColor = false
    b.Parent = tpGui
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    b.MouseButton1Click:Connect(function()
        local target = Players:FindFirstChild(inp.Text)
        if not target then
            for _, plr in ipairs(Players:GetPlayers()) do
                if string.lower(plr.Name):find(string.lower(inp.Text)) then
                    target = plr
                    break
                end
            end
        end
        if not target then return end
        local char = LocalPlayer.Character
        local myHrp = char and char:FindFirstChild("HumanoidRootPart")
        local tc = target.Character
        local tHrp = tc and tc:FindFirstChild("HumanoidRootPart")
        if myHrp and tHrp then myHrp.CFrame = tHrp.CFrame * CFrame.new(0, 0, 3) end
    end)
end
makeButton(exploitsTab, "TP to Player", function(btn, ind)
    if tpGui then tpGui:Destroy() tpGui = nil setOff(btn, ind)
    else createTpGui() setOn(btn, ind) end
end)

-- BINDS GUI
bindsGui = nil
local function createBindsGui()
    if bindsGui then bindsGui:Destroy() end
    bindsGui = Instance.new("Frame")
    bindsGui.Size = UDim2.new(0, 320, 0, 400)
    bindsGui.Position = UDim2.new(0.5, -160, 0.5, -200)
    bindsGui.BackgroundColor3 = C_BG
    bindsGui.BorderSizePixel = 0
    bindsGui.Active = true
    bindsGui.Draggable = true
    bindsGui.ZIndex = 10
    bindsGui.Parent = gui
    Instance.new("UICorner", bindsGui).CornerRadius = UDim.new(0, 12)
    local s = Instance.new("UIStroke")
    s.Color = C_ACCENT
    s.Thickness = 1.5
    s.Parent = bindsGui
    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, 0, 0, 30)
    t.BackgroundTransparency = 1
    t.Text = "⚙ НАСТРОЙКА БИНДОВ"
    t.TextColor3 = C_ACCENT
    t.Font = Enum.Font.GothamBold
    t.TextSize = 13
    t.Parent = bindsGui
    local funcNames = {}
    for name, _ in pairs(bindActions) do table.insert(funcNames, name) end
    table.sort(funcNames)
    local fl = Instance.new("TextLabel")
    fl.Size = UDim2.new(1, -20, 0, 16)
    fl.Position = UDim2.new(0, 10, 0, 34)
    fl.BackgroundTransparency = 1
    fl.Text = "Функция:"
    fl.TextColor3 = C_TEXT_DIM
    fl.Font = Enum.Font.Gotham
    fl.TextSize = 10
    fl.TextXAlignment = Enum.TextXAlignment.Left
    fl.Parent = bindsGui
    local fb = Instance.new("TextButton")
    fb.Size = UDim2.new(1, -20, 0, 28)
    fb.Position = UDim2.new(0, 10, 0, 52)
    fb.BackgroundColor3 = C_BTN
    fb.BorderSizePixel = 0
    fb.Text = funcNames[1] or "Нет"
    fb.TextColor3 = C_TEXT
    fb.Font = Enum.Font.Gotham
    fb.TextSize = 12
    fb.AutoButtonColor = false
    fb.Parent = bindsGui
    Instance.new("UICorner", fb).CornerRadius = UDim.new(0, 6)
    local fi = 1
    fb.MouseButton1Click:Connect(function()
        if #funcNames == 0 then return end
        fi = fi + 1
        if fi > #funcNames then fi = 1 end
        fb.Text = funcNames[fi]
    end)
    local kl = Instance.new("TextLabel")
    kl.Size = UDim2.new(1, -20, 0, 16)
    kl.Position = UDim2.new(0, 10, 0, 86)
    kl.BackgroundTransparency = 1
    kl.Text = "Клавиша:"
    kl.TextColor3 = C_TEXT_DIM
    kl.Font = Enum.Font.Gotham
    kl.TextSize = 10
    kl.TextXAlignment = Enum.TextXAlignment.Left
    kl.Parent = bindsGui
    local kb = Instance.new("TextButton")
    kb.Size = UDim2.new(1, -20, 0, 28)
    kb.Position = UDim2.new(0, 10, 0, 106)
    kb.BackgroundColor3 = C_BTN
    kb.BorderSizePixel = 0
    kb.Text = "Нажми клавишу..."
    kb.TextColor3 = C_TEXT
    kb.Font = Enum.Font.Gotham
    kb.TextSize = 12
    kb.AutoButtonColor = false
    kb.Parent = bindsGui
    Instance.new("UICorner", kb).CornerRadius = UDim.new(0, 6)
    local selectedKey = nil
    local listening = false
    kb.MouseButton1Click:Connect(function()
        listening = true
        kb.Text = "Слушаю..."
        kb.BackgroundColor3 = Color3.fromRGB(80, 40, 100)
    end)
    UserInputService.InputBegan:Connect(function(input, gpe)
        if not listening then return end
        if gpe then return end
        if input.UserInputType == Enum.UserInputType.Keyboard then
            selectedKey = input.KeyCode
            kb.Text = selectedKey.Name
            kb.BackgroundColor3 = C_BTN
            listening = false
        end
    end)
    local ab = Instance.new("TextButton")
    ab.Size = UDim2.new(1, -20, 0, 30)
    ab.Position = UDim2.new(0, 10, 0, 144)
    ab.BackgroundColor3 = C_ACCENT
    ab.BorderSizePixel = 0
    ab.Text = "Добавить бинд"
    ab.TextColor3 = Color3.fromRGB(255, 255, 255)
    ab.Font = Enum.Font.GothamBold
    ab.TextSize = 12
    ab.AutoButtonColor = false
    ab.Parent = bindsGui
    Instance.new("UICorner", ab).CornerRadius = UDim.new(0, 6)
    local blf = Instance.new("ScrollingFrame")
    blf.Size = UDim2.new(1, -20, 0, 200)
    blf.Position = UDim2.new(0, 10, 0, 184)
    blf.BackgroundColor3 = C_PANEL
    blf.BorderSizePixel = 0
    blf.ScrollBarThickness = 4
    blf.ScrollBarImageColor3 = C_ACCENT
    blf.CanvasSize = UDim2.new(0, 0, 0, 0)
    blf.AutomaticCanvasSize = Enum.AutomaticSize.Y
    blf.Parent = bindsGui
    Instance.new("UICorner", blf).CornerRadius = UDim.new(0, 6)
    local ll = Instance.new("UIListLayout")
    ll.Padding = UDim.new(0, 4)
    ll.SortOrder = Enum.SortOrder.LayoutOrder
    ll.Parent = blf
    local function refresh()
        for _, c in ipairs(blf:GetChildren()) do
            if c:IsA("TextButton") then c:Destroy() end
        end
        for i, bind in ipairs(bindsList) do
            local row = Instance.new("TextButton")
            row.Size = UDim2.new(1, -8, 0, 24)
            row.BackgroundColor3 = C_BTN
            row.BorderSizePixel = 0
            row.Text = bind.key.Name .. " → " .. bind.name
            row.TextColor3 = C_TEXT
            row.Font = Enum.Font.Gotham
            row.TextSize = 11
            row.AutoButtonColor = false
            row.Parent = blf
            Instance.new("UICorner", row).CornerRadius = UDim.new(0, 4)
            row.MouseButton1Click:Connect(function()
                table.remove(bindsList, i)
                refresh()
            end)
        end
    end
    ab.MouseButton1Click:Connect(function()
        if not selectedKey then notify("Сначала клавишу", C_RED) return end
        local fn = fb.Text
        if not bindActions[fn] then notify("Функция не найдена", C_RED) return end
        addBind(selectedKey, fn, bindActions[fn])
        selectedKey = nil
        kb.Text = "Нажми клавишу..."
        refresh()
    end)
    refresh()
end
makeButton(exploitsTab, "Binds", function(btn, ind)
    if bindsGui then bindsGui:Destroy() bindsGui = nil setOff(btn, ind)
    else createBindsGui() setOn(btn, ind) end
end)

-- ============================================
-- SCRIPTS
-- ============================================
local scriptList = {
    { name = "DropKick", url = "https://raw.githubusercontent.com/platinww/CrustyMain/refs/heads/main/universal/DropKick.lua" },
    { name = "Bundle Animations", url = "https://raw.githubusercontent.com/Bac0nHck/Scripts/refs/heads/main/BundleAnimations.lua" },
    { name = "Infinite Yield", url = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source" },
    { name = "Universal ESP", url = "https://raw.githubusercontent.com/L5ks8/Esp/main/loader" },
    { name = "Volt Hub", url = "https://raw.githubusercontent.com/Dev-VoltHub/Blox-fruits/main/volt.lua" },
    { name = "TigerX Hub 4.5", url = "https://raw.githubusercontent.com/BalintTheDevXBack/Universal/refs/heads/main/TigerXHub4.5" },
    { name = "FastTravel", url = "https://raw.githubusercontent.com/tomatotxt/-/raw/!/FastTravel" },
    { name = "Owl Hub", url = "https://raw.githubusercontent.com/OwlHUB/OwlHub/main/Main.lua" },
    { name = "Rayfield UI", url = "https://raw.githubusercontent.com/rayfield-library/Rayfield/main/Rayfield.lua" },
    { name = "Calamari Hub", url = "https://raw.githubusercontent.com/CalamariHub/CalamariHub/main/source" },
    { name = "Kavo UI", url = "https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua" },
    { name = "Hydroxide", url = "https://raw.githubusercontent.com/Upbolt/Hydroxide/master/main.lua" },
    { name = "MM2 Mozql Hub", url = "https://raw.githubusercontent.com/snxpzscripts/mm2/refs/heads/main/MozqlHub" },
    { name = "MM2 Fury Hub", url = "https://codeberg.org/dev-str/Loader/raw/branch/main/mm2.loader" },
    { name = "MM2 Vant Hub", url = "https://raw.githubusercontent.com/ilickyourmum21-cmd/my-mm2-script/refs/heads/main/main.lua" },
    { name = "Goon ESP", url = "https://raw.githubusercontent.com/LynX99-9/komtolmmek2script/refs/heads/main/CyraaHub.lua" },
}
local function loadScript(url)
    local s, e = pcall(function() loadstring(game:HttpGet(url))() end)
    if not s then warn("[Scripts] Ошибка: " .. tostring(e)) end
end
for _, script in ipairs(scriptList) do
    makeButton(scriptsTab, script.name, function(btn, ind)
        loadScript(script.url)
        TweenService:Create(ind, TweenInfo.new(0.1), {BackgroundColor3 = C_ACCENT}):Play()
        task.wait(0.3)
        TweenService:Create(ind, TweenInfo.new(0.2), {BackgroundColor3 = C_TEXT_DIM}):Play()
        notify("Загружен: " .. script.name)
    end)
end

local customFrame = Instance.new("Frame")
customFrame.Size = UDim2.new(0, 380, 0, 100)
customFrame.BackgroundColor3 = C_PANEL
customFrame.BorderSizePixel = 0
customFrame.Parent = scriptsTab
Instance.new("UICorner", customFrame).CornerRadius = UDim.new(0, 8)
local ct = Instance.new("TextLabel")
ct.Size = UDim2.new(1, -10, 0, 20)
ct.Position = UDim2.new(0, 5, 0, 2)
ct.BackgroundTransparency = 1
ct.Text = "СВОЯ ССЫЛКА (RAW)"
ct.TextColor3 = C_ACCENT
ct.Font = Enum.Font.GothamBold
ct.TextSize = 11
ct.TextXAlignment = Enum.TextXAlignment.Left
ct.Parent = customFrame
local ci = Instance.new("TextBox")
ci.Size = UDim2.new(1, -10, 0, 26)
ci.Position = UDim2.new(0, 5, 0, 24)
ci.BackgroundColor3 = C_BTN
ci.BorderSizePixel = 0
ci.Text = ""
ci.PlaceholderText = "https://..."
ci.PlaceholderColor3 = C_TEXT_DIM
ci.TextColor3 = C_TEXT
ci.Font = Enum.Font.Gotham
ci.TextSize = 11
ci.ClearTextOnFocus = false
ci.Parent = customFrame
Instance.new("UICorner", ci).CornerRadius = UDim.new(0, 6)
local cb = Instance.new("TextButton")
cb.Size = UDim2.new(1, -10, 0, 26)
cb.Position = UDim2.new(0, 5, 0, 54)
cb.BackgroundColor3 = C_ACCENT
cb.BorderSizePixel = 0
cb.Text = "Запустить"
cb.TextColor3 = Color3.fromRGB(255, 255, 255)
cb.Font = Enum.Font.GothamBold
cb.TextSize = 12
cb.AutoButtonColor = false
cb.Parent = customFrame
Instance.new("UICorner", cb).CornerRadius = UDim.new(0, 6)
cb.MouseButton1Click:Connect(function()
    local url = ci.Text
    if url == "" or not url:match("^https?://") then notify("Неверная ссылка", C_RED) return end
    loadScript(url)
    notify("Загружено из ссылки")
end)

-- ============================================
-- FUN
-- ============================================
makeButton(funTab, "Particle Burst", function(btn, ind)
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local burst = Instance.new("Part")
    burst.Size = Vector3.new(1, 1, 1)
    burst.Transparency = 1
    burst.Anchored = true
    burst.CanCollide = false
    burst.Position = hrp.Position
    burst.Parent = workspace
    local attach = Instance.new("Attachment", burst)
    local emitter = Instance.new("ParticleEmitter")
    emitter.Texture = "rbxassetid://243660364"
    emitter.Rate = 0
    emitter.Lifetime = NumberRange.new(3, 6)
    emitter.Speed = NumberRange.new(80, 200)
    emitter.SpreadAngle = Vector2.new(180, 180)
    emitter.Color = ColorSequence.new(C_ACCENT, C_ACCENT2)
    emitter.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.2, 8),
        NumberSequenceKeypoint.new(1, 0),
    })
    emitter.LightEmission = 1
    emitter.LightInfluence = 0
    emitter.Parent = attach
    emitter:Emit(320)
    task.delay(7, function() burst:Destroy() end)
    notify("Particle Burst!")
end)

-- ============================================
-- DEV
-- ============================================
makeButton(devTab, "TikTok", function(btn, ind)
    pcall(function() setclipboard("@kolbaska_vkusnoa") end)
    notify("Скопировано: @kolbaska_vkusnoa")
end)
makeButton(devTab, "Telegram", function(btn, ind)
    pcall(function() setclipboard("https://t.me/kolbaska_vkusnoa") end)
    notify("Скопировано: t.me/kolbaska_vkusnoa")
end)

-- ============================================
-- SETTINGS
-- ============================================
local infoLabel = Instance.new("TextLabel")
infoLabel.Size = UDim2.new(1, -12, 0, 90)
infoLabel.BackgroundColor3 = C_PANEL
infoLabel.BorderSizePixel = 0
infoLabel.Text = "KOLBASKA HUB v3 FINAL\n@kolbaska_vkusnoa\n\nInjector: " .. (getexecutorname and getexecutorname() or "Unknown")
infoLabel.TextColor3 = C_TEXT_DIM
infoLabel.Font = Enum.Font.Gotham
infoLabel.TextSize = 11
infoLabel.TextWrapped = true
infoLabel.Parent = settingsTab
Instance.new("UICorner", infoLabel).CornerRadius = UDim.new(0, 8)

-- ============================================
-- ВОССТАНОВЛЕНИЕ ПОСЛЕ РЕСПАВНА
-- ============================================
LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(1)
    if chinaHatOn then createChinaHat() end
    if auraOn then createAura() end
    if wingsOn then createWings() end
    if haloOn then toggleHalo() toggleHalo() end
    if crownOn then toggleCrown() toggleCrown() end
    if hornsOn then toggleHorns() toggleHorns() end
    if espOn then createESP() end
    if nameTagsOn then createNameTags() end
    if trailOn then toggleTrail() toggleTrail() end
    if rainbowTrailOn then toggleRainbowTrail() toggleRainbowTrail() end
end)

notify("KOLBASKA HUB v3 FINAL загружен!", C_ACCENT2)
-- ============================================
-- ПАТЧ: Возврат Panic, HUD Counter, Freeze + новый Telegram
-- ============================================

-- PANIC (Exploits)
panicOn = false
panicConn = nil
panicOrigin = nil
local function togglePanic()
    panicOn = not panicOn
    if panicOn then
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        panicOrigin = hrp.Position
        if panicConn then panicConn:Disconnect() end
        panicConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if not h or not panicOrigin then return end
            local angle = math.random() * math.pi * 2
            local radius = math.random() * 30
            local offset = Vector3.new(math.cos(angle) * radius, math.random(0, 10), math.sin(angle) * radius)
            h.CFrame = CFrame.new(panicOrigin + offset)
        end)
    else
        if panicConn then panicConn:Disconnect() panicConn = nil end
        panicOrigin = nil
    end
end
makeButton(exploitsTab, "Panic", function(btn, ind) togglePanic(); if panicOn then setOn(btn, ind) else setOff(btn, ind) end; notify(panicOn and "Panic вкл" or "Panic выкл") end)
bindActions["Panic"] = togglePanic

-- FREEZE (Exploits)
freezeOn = false
freezeConn = nil
freezePos = nil
local function toggleFreeze()
    freezeOn = not freezeOn
    if freezeOn then
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if hrp then freezePos = hrp.CFrame end
        freezeConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if h and freezePos then
                h.CFrame = freezePos
                h.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                h.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
            end
        end)
    else
        if freezeConn then freezeConn:Disconnect() freezeConn = nil end
        freezePos = nil
    end
end
makeButton(exploitsTab, "Freeze", function(btn, ind) toggleFreeze(); if freezeOn then setOn(btn, ind) else setOff(btn, ind) end; notify(freezeOn and "Freeze вкл" or "Freeze выкл") end)
bindActions["Freeze"] = toggleFreeze

-- HUD COUNTER (Visuals)
hudVisible = false
hudFrame = nil
local function createHUD()
    if hudFrame then hudFrame:Destroy() end
    hudFrame = Instance.new("Frame")
    hudFrame.Name = "HUD"
    hudFrame.Size = UDim2.new(0, 190, 0, 120)
    hudFrame.Position = UDim2.new(1, -210, 0, 20)
    hudFrame.BackgroundColor3 = C_BG
    hudFrame.BackgroundTransparency = 0.2
    hudFrame.BorderSizePixel = 0
    hudFrame.Active = true
    hudFrame.Draggable = true
    hudFrame.ZIndex = 5
    hudFrame.Parent = gui
    Instance.new("UICorner", hudFrame).CornerRadius = UDim.new(0, 10)
    local hudStroke = Instance.new("UIStroke")
    hudStroke.Color = C_ACCENT
    hudStroke.Thickness = 1
    hudStroke.Transparency = 0.3
    hudStroke.Parent = hudFrame
    local hudTitle = Instance.new("TextLabel")
    hudTitle.Size = UDim2.new(1, -12, 0, 20)
    hudTitle.Position = UDim2.new(0, 6, 0, 4)
    hudTitle.BackgroundTransparency = 1
    hudTitle.Text = "KOLBASKA HUD"
    hudTitle.TextColor3 = C_ACCENT
    hudTitle.Font = Enum.Font.GothamBold
    hudTitle.TextSize = 11
    hudTitle.TextXAlignment = Enum.TextXAlignment.Left
    hudTitle.Parent = hudFrame
    local hudLabel = Instance.new("TextLabel")
    hudLabel.Name = "HUDLabel"
    hudLabel.Size = UDim2.new(1, -12, 1, -30)
    hudLabel.Position = UDim2.new(0, 6, 0, 24)
    hudLabel.BackgroundTransparency = 1
    hudLabel.Text = ""
    hudLabel.TextColor3 = C_TEXT
    hudLabel.Font = Enum.Font.Gotham
    hudLabel.TextSize = 12
    hudLabel.TextXAlignment = Enum.TextXAlignment.Left
    hudLabel.TextYAlignment = Enum.TextYAlignment.Top
    hudLabel.Parent = hudFrame
    task.spawn(function()
        local lastPos, lastTime = nil, tick()
        while hudFrame and hudFrame.Parent do
            local fps = math.floor(1 / RunService.RenderStepped:Wait())
            local ping = math.floor(LocalPlayer:GetNetworkPing() * 1000)
            local bps = 0
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local now = tick()
                local dt = now - lastTime
                if lastPos and dt > 0 then
                    bps = math.floor((hrp.Position - lastPos).Magnitude / dt)
                end
                lastPos = hrp.Position
                lastTime = now
            end
            local injectorName = "Unknown"
            if getexecutorname then pcall(function() injectorName = getexecutorname() end)
            elseif identifyexecutor then pcall(function() injectorName = identifyexecutor() end) end
            hudLabel.Text = string.format("FPS: %d\nPing: %d ms\nBPS: %d studs/s\nInjector: %s\nTime: %s",
                fps, ping, bps, injectorName, os.date("%H:%M:%S"))
            task.wait(0.1)
        end
    end)
end
makeButton(visualsTab, "HUD Counter", function(btn, ind)
    hudVisible = not hudVisible
    if hudVisible then createHUD() setOn(btn, ind)
    else if hudFrame then hudFrame:Destroy() hudFrame = nil end setOff(btn, ind) end
    notify(hudVisible and "HUD вкл" or "HUD выкл")
end)
bindActions["HUD Counter"] = function() hudVisible = not hudVisible end

-- Удаляем старую кнопку Telegram и создаём новую с новым каналом
for _, data in ipairs(allButtons) do
    if data.label.Text == "Telegram" then
        data.btn:Destroy()
        break
    end
end

makeButton(devTab, "Telegram", function(btn, ind)
    pcall(function() setclipboard("https://t.me/kolbaska_scripts") end)
    notify("Скопировано: t.me/kolbaska_scripts")
end)

print("Патч загружен: Panic, Freeze, HUD Counter + Telegram обновлён")
print("Release25 — KOLBASKA HUB v3 FINAL — COMPLETE")
