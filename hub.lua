-- ============================================
-- KOLBASKA HUB v2 ELITE — FULL + 12 VISUALS
-- ============================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local GuiService = game:GetService("GuiService")
local LocalPlayer = Players.LocalPlayer

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
versionLabel.Text = "v2 ELITE"
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
watermark.Text = "KOLBASKA HUB v2 ELITE • @kolbaska_vkusnoa"
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

aspectOn = false
origAspectFOV = workspace.CurrentCamera.FieldOfView
local function toggleAspect()
    aspectOn = not aspectOn
    if aspectOn then workspace.CurrentCamera.FieldOfView = 120
    else workspace.CurrentCamera.FieldOfView = origAspectFOV end
end
makeButton(visualsTab, "Aspect Radio", function(btn, ind) toggleAspect(); if aspectOn then setOn(btn, ind) else setOff(btn, ind) end; notify(aspectOn and "Aspect Radio вкл" or "Aspect Radio выкл") end)
bindActions["Aspect Radio"] = toggleAspect

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

-- ============================================
-- 12 КРУТЫХ ВИЗУАЛОВ
-- ============================================

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

-- SCRIPTS
local scriptList = {
    { name = "DropKick", url = "https://raw.githubusercontent.com/platinww/CrustyMain/refs/heads/main/universal/DropKick.lua" },
    { name = "Bundle Animations", url = "https://raw.githubusercontent.com/Bac0nHck/Scripts/refs/heads/main/BundleAnimations.lua" },
    { name = "Infinite Yield", url = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source" },
    { name = "Universal ESP", url = "https://raw.githubusercontent.com/L5ks8/Esp/main/loader" },
    { name = "Volt Hub", url = "https://raw.githubusercontent.com/Dev-VoltHub/Blox-fruits/main/volt.lua" },
    { name = "TigerX Hub 4.5", url = "https://raw.githubusercontent.com/BalintTheDevXBack/Universal/refs/heads/main/TigerXHub4.5" },
    { name = "Owl Hub", url = "https://raw.githubusercontent.com/OwlHUB/OwlHub/main/Main.lua" },
    { name = "Rayfield UI", url = "https://raw.githubusercontent.com/rayfield-library/Rayfield/main/Rayfield.lua" },
    { name = "Kavo UI", url = "https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua" },
    { name = "Hydroxide", url = "https://raw.githubusercontent.com/Upbolt/Hydroxide/master/main.lua" },
    { name = "MM2 Mozql", url = "https://raw.githubusercontent.com/snxpzscripts/mm2/refs/heads/main/MozqlHub" },
    { name = "MM2 Fury", url = "https://codeberg.org/dev-str/Loader/raw/branch/main/mm2.loader" },
}
local function loadScript(url)
    local s, e = pcall(function() loadstring(game:HttpGet(url))() end)
    if not s then warn("[Scripts] " .. tostring(e)) end
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
ct.Text = "СВОЯ ССЫЛКА"
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

-- EXPLOITS
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
    end
end
makeButton(exploitsTab, "Noclip", function(btn, ind) toggleNoclip(); if noclipOn then setOn(btn, ind) else setOff(btn, ind) end; notify(noclipOn and "Noclip вкл" or "Noclip выкл") end)
bindActions["Noclip"] = toggleNoclip

speedOn = false
speedConn = nil
local function toggleSpeed()
    speedOn = not speedOn
    if speedOn then
        speedConn = RunService.Heartbeat:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("Humanoid")
            if h then h.WalkSpeed = config.speedValue end
        end)
    else
        if speedConn then speedConn:Disconnect() speedConn = nil end
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChild("Humanoid")
        if hum then hum.WalkSpeed = 16 end
    end
end
makeButton(exploitsTab, "Speed", function(btn, ind) toggleSpeed(); if speedOn then setOn(btn, ind) else setOff(btn, ind) end; notify(speedOn and "Speed вкл" or "Speed выкл") end, {
    { type = "slider", label = "Скорость", min = 16, max = 500, value = config.speedValue, callback = function(v) config.speedValue = v end },
})
bindActions["Speed"] = toggleSpeed

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
    end
end
makeButton(exploitsTab, "Anti-Fling", function(btn, ind) toggleAntiFling(); if antiFlingOn then setOn(btn, ind) else setOff(btn, ind) end; notify(antiFlingOn and "Anti-Fling вкл" or "Anti-Fling выкл") end)
bindActions["Anti-Fling"] = toggleAntiFling

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

-- FUN
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

makeButton(devTab, "TikTok", function(btn, ind)
    pcall(function() setclipboard("@kolbaska_vkusnoa") end)
    notify("Скопировано")
end)
makeButton(devTab, "Telegram", function(btn, ind)
    pcall(function() setclipboard("https://t.me/kolbaska_vkusnoa") end)
    notify("Скопировано")
end)

local infoLabel = Instance.new("TextLabel")
infoLabel.Size = UDim2.new(1, -12, 0, 90)
infoLabel.BackgroundColor3 = C_PANEL
infoLabel.BorderSizePixel = 0
infoLabel.Text = "KOLBASKA HUB v2 ELITE\n@kolbaska_vkusnoa\n\nInjector: " .. (getexecutorname and getexecutorname() or "Unknown")
infoLabel.TextColor3 = C_TEXT_DIM
infoLabel.Font = Enum.Font.Gotham
infoLabel.TextSize = 11
infoLabel.TextWrapped = true
infoLabel.Parent = settingsTab
Instance.new("UICorner", infoLabel).CornerRadius = UDim.new(0, 8)

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
end)

notify("KOLBASKA HUB v2 ELITE загружен!", C_ACCENT2)
print("Release24 — KOLBASKA HUB v2 ELITE — FULL + 12 VISUALS")
