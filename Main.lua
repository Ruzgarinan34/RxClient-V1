local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Hata ayıklama için log fonksiyonu
local function debugLog(message)
    print("[RxClientGui] " .. message)
end

-- Ana ScreenGui oluştur
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RxClientGui"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.DisplayOrder = 1000

-- Ana GUI Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.BackgroundTransparency = 0.5
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false -- GUI başlangıçta kapalı
mainFrame.ZIndex = 1000
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = mainFrame

-- Üst çubuk
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 30)
topBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
topBar.BorderSizePixel = 0
topBar.ZIndex = 1001
topBar.Parent = mainFrame

local topBarCorner = Instance.new("UICorner")
topBarCorner.CornerRadius = UDim.new(0, 10)
topBarCorner.Parent = topBar

-- RxClient yazısı
local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(0, 200, 1, 0)
titleText.Position = UDim2.new(0, 10, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "RxClient"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.TextSize = 20
titleText.Font = Enum.Font.GothamBold
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.ZIndex = 1002
titleText.Parent = topBar

-- Kapatma düğmesi
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -40, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 16
closeButton.Font = Enum.Font.GothamBold
closeButton.ZIndex = 1002
closeButton.Parent = topBar

local closeButtonCorner = Instance.new("UICorner")
closeButtonCorner.CornerRadius = UDim.new(0, 5)
closeButtonCorner.Parent = closeButton

-- Highlight Butonu
local highlightButton = Instance.new("TextButton")
highlightButton.Size = UDim2.new(0, 150, 0, 40)
highlightButton.Position = UDim2.new(0, 10, 0, 40)
highlightButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
highlightButton.Text = "Toggle Highlight"
highlightButton.TextColor3 = Color3.fromRGB(255, 255, 255)
highlightButton.TextSize = 18
highlightButton.Font = Enum.Font.GothamBold
highlightButton.ZIndex = 1001
highlightButton.Parent = mainFrame

local highlightButtonCorner = Instance.new("UICorner")
highlightButtonCorner.CornerRadius = UDim.new(0, 8)
highlightButtonCorner.Parent = highlightButton

-- Infinite Jump Butonu
local infiniteJumpButton = Instance.new("TextButton")
infiniteJumpButton.Size = UDim2.new(0, 150, 0, 40)
infiniteJumpButton.Position = UDim2.new(0, 10, 0, 90)
infiniteJumpButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
infiniteJumpButton.Text = "Toggle Infinite Jump"
infiniteJumpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
infiniteJumpButton.TextSize = 18
infiniteJumpButton.Font = Enum.Font.GothamBold
infiniteJumpButton.ZIndex = 1001
infiniteJumpButton.Parent = mainFrame

local infiniteJumpButtonCorner = Instance.new("UICorner")
infiniteJumpButtonCorner.CornerRadius = UDim.new(0, 8)
infiniteJumpButtonCorner.Parent = infiniteJumpButton

-- Player Speed Butonu
local playerSpeedButton = Instance.new("TextButton")
playerSpeedButton.Size = UDim2.new(0, 150, 0, 40)
playerSpeedButton.Position = UDim2.new(0, 10, 0, 140)
playerSpeedButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
playerSpeedButton.Text = "Toggle Speed"
playerSpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
playerSpeedButton.TextSize = 18
playerSpeedButton.Font = Enum.Font.GothamBold
playerSpeedButton.ZIndex = 1001
playerSpeedButton.Parent = mainFrame

local playerSpeedButtonCorner = Instance.new("UICorner")
playerSpeedButtonCorner.CornerRadius = UDim.new(0, 8)
playerSpeedButtonCorner.Parent = playerSpeedButton

-- Ayarlar Butonu (Player Speed altına)
local settingsButton = Instance.new("TextButton")
settingsButton.Size = UDim2.new(0, 100, 0, 30)
settingsButton.Position = UDim2.new(0, 10, 0, 185)
settingsButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
settingsButton.Text = "Settings"
settingsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
settingsButton.TextSize = 16
settingsButton.Font = Enum.Font.GothamBold
settingsButton.ZIndex = 1001
settingsButton.Parent = mainFrame

local settingsButtonCorner = Instance.new("UICorner")
settingsButtonCorner.CornerRadius = UDim.new(0, 8)
settingsButtonCorner.Parent = settingsButton

-- Highlight Ayarlar Frame'i
local highlightSettingsFrame = Instance.new("Frame")
highlightSettingsFrame.Size = UDim2.new(0, 400, 0, 300)
highlightSettingsFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
highlightSettingsFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
highlightSettingsFrame.BackgroundTransparency = 0.5
highlightSettingsFrame.BorderSizePixel = 0
highlightSettingsFrame.Visible = false
highlightSettingsFrame.ZIndex = 1000
highlightSettingsFrame.Parent = screenGui

local highlightSettingsCorner = Instance.new("UICorner")
highlightSettingsCorner.CornerRadius = UDim.new(0, 10)
highlightSettingsCorner.Parent = highlightSettingsFrame

-- Highlight Ayarlar Üst çubuk
local highlightSettingsTopBar = Instance.new("Frame")
highlightSettingsTopBar.Size = UDim2.new(1, 0, 0, 30)
highlightSettingsTopBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
highlightSettingsTopBar.BorderSizePixel = 0
highlightSettingsTopBar.ZIndex = 1001
highlightSettingsTopBar.Parent = highlightSettingsFrame

local highlightSettingsTopBarCorner = Instance.new("UICorner")
highlightSettingsTopBarCorner.CornerRadius = UDim.new(0, 10)
highlightSettingsTopBarCorner.Parent = highlightSettingsTopBar

-- Highlight Ayarlar Başlık
local highlightSettingsTitleText = Instance.new("TextLabel")
highlightSettingsTitleText.Size = UDim2.new(0, 200, 1, 0)
highlightSettingsTitleText.Position = UDim2.new(0, 10, 0, 0)
highlightSettingsTitleText.BackgroundTransparency = 1
highlightSettingsTitleText.Text = "Highlight Settings"
highlightSettingsTitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
highlightSettingsTitleText.TextSize = 20
highlightSettingsTitleText.Font = Enum.Font.GothamBold
highlightSettingsTitleText.TextXAlignment = Enum.TextXAlignment.Left
highlightSettingsTitleText.ZIndex = 1002
highlightSettingsTitleText.Parent = highlightSettingsTopBar

-- Highlight Ayarlar Kapatma düğmesi
local highlightSettingsCloseButton = Instance.new("TextButton")
highlightSettingsCloseButton.Size = UDim2.new(0, 30, 0, 30)
highlightSettingsCloseButton.Position = UDim2.new(1, -40, 0, 0)
highlightSettingsCloseButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
highlightSettingsCloseButton.Text = "X"
highlightSettingsCloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
highlightSettingsCloseButton.TextSize = 16
highlightSettingsCloseButton.Font = Enum.Font.GothamBold
highlightSettingsCloseButton.ZIndex = 1002
highlightSettingsCloseButton.Parent = highlightSettingsTopBar

local highlightSettingsCloseButtonCorner = Instance.new("UICorner")
highlightSettingsCloseButtonCorner.CornerRadius = UDim.new(0, 5)
highlightSettingsCloseButtonCorner.Parent = highlightSettingsCloseButton

-- Highlight rengi seçici
local highlightColorLabel = Instance.new("TextLabel")
highlightColorLabel.Size = UDim2.new(0, 200, 0, 30)
highlightColorLabel.Position = UDim2.new(0, 10, 0, 40)
highlightColorLabel.BackgroundTransparency = 1
highlightColorLabel.Text = "Highlight Color:"
highlightColorLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
highlightColorLabel.TextSize = 16
highlightColorLabel.Font = Enum.Font.Gotham
highlightColorLabel.TextXAlignment = Enum.TextXAlignment.Left
highlightColorLabel.ZIndex = 1001
highlightColorLabel.Parent = highlightSettingsFrame

-- Önceden tanımlı renk butonları
local presetColors = {
    { Name = "Red", Color = Color3.fromRGB(255, 0, 0) },
    { Name = "Green", Color = Color3.fromRGB(0, 255, 0) },
    { Name = "Blue", Color = Color3.fromRGB(0, 0, 255) },
    { Name = "Yellow", Color = Color3.fromRGB(255, 255, 0) },
    { Name = "Purple", Color = Color3.fromRGB(128, 0, 128) },
    { Name = "Orange", Color = Color3.fromRGB(255, 165, 0) },
    { Name = "White", Color = Color3.fromRGB(255, 255, 255) },
    { Name = "Black", Color = Color3.fromRGB(0, 0, 0) }
}

local presetColorFrame = Instance.new("Frame")
presetColorFrame.Size = UDim2.new(0, 380, 0, 60)
presetColorFrame.Position = UDim2.new(0, 10, 0, 70)
presetColorFrame.BackgroundTransparency = 1
presetColorFrame.ZIndex = 1001
presetColorFrame.Parent = highlightSettingsFrame

local uIListLayout = Instance.new("UIListLayout")
uIListLayout.FillDirection = Enum.FillDirection.Horizontal
uIListLayout.Wraps = true
uIListLayout.Padding = UDim.new(0, 10)
uIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
uIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
uIListLayout.Parent = presetColorFrame

for _, colorInfo in ipairs(presetColors) do
    local colorButton = Instance.new("TextButton")
    colorButton.Size = UDim2.new(0, 40, 0, 40)
    colorButton.BackgroundColor3 = colorInfo.Color
    colorButton.Text = ""
    colorButton.ZIndex = 1001
    colorButton.Parent = presetColorFrame

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 5)
    buttonCorner.Parent = colorButton
end

-- Highlight RGB sliders
local rgbLabel = Instance.new("TextLabel")
rgbLabel.Size = UDim2.new(0, 200, 0, 30)
rgbLabel.Position = UDim2.new(0, 10, 0, 140)
rgbLabel.BackgroundTransparency = 1
rgbLabel.Text = "RGB Values:"
rgbLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
rgbLabel.TextSize = 16
rgbLabel.Font = Enum.Font.Gotham
rgbLabel.TextXAlignment = Enum.TextXAlignment.Left
rgbLabel.ZIndex = 1001
rgbLabel.Parent = highlightSettingsFrame

local highlightRedSlider = Instance.new("TextBox")
highlightRedSlider.Size = UDim2.new(0, 180, 0, 20)
highlightRedSlider.Position = UDim2.new(0, 10, 0, 170)
highlightRedSlider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
highlightRedSlider.Text = "255"
highlightRedSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
highlightRedSlider.TextSize = 14
highlightRedSlider.Font = Enum.Font.Gotham
highlightRedSlider.ZIndex = 1001
highlightRedSlider.Parent = highlightSettingsFrame

local highlightRedLabel = Instance.new("TextLabel")
highlightRedLabel.Size = UDim2.new(0, 30, 0, 20)
highlightRedLabel.Position = UDim2.new(0, 190, 0, 170)
highlightRedLabel.BackgroundTransparency = 1
highlightRedLabel.Text = "R"
highlightRedLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
highlightRedLabel.TextSize = 14
highlightRedLabel.Font = Enum.Font.Gotham
highlightRedLabel.ZIndex = 1001
highlightRedLabel.Parent = highlightSettingsFrame

local highlightGreenSlider = Instance.new("TextBox")
highlightGreenSlider.Size = UDim2.new(0, 180, 0, 20)
highlightGreenSlider.Position = UDim2.new(0, 10, 0, 195)
highlightGreenSlider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
highlightGreenSlider.Text = "0"
highlightGreenSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
highlightGreenSlider.TextSize = 14
highlightGreenSlider.Font = Enum.Font.Gotham
highlightGreenSlider.ZIndex = 1001
highlightGreenSlider.Parent = highlightSettingsFrame

local highlightGreenLabel = Instance.new("TextLabel")
highlightGreenLabel.Size = UDim2.new(0, 30, 0, 20)
highlightGreenLabel.Position = UDim2.new(0, 190, 0, 195)
highlightGreenLabel.BackgroundTransparency = 1
highlightGreenLabel.Text = "G"
highlightGreenLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
highlightGreenLabel.TextSize = 14
highlightGreenLabel.Font = Enum.Font.Gotham
highlightGreenLabel.ZIndex = 1001
highlightGreenLabel.Parent = highlightSettingsFrame

local highlightBlueSlider = Instance.new("TextBox")
highlightBlueSlider.Size = UDim2.new(0, 180, 0, 20)
highlightBlueSlider.Position = UDim2.new(0, 10, 0, 220)
highlightBlueSlider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
highlightBlueSlider.Text = "0"
highlightBlueSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
highlightBlueSlider.TextSize = 14
highlightBlueSlider.Font = Enum.Font.Gotham
highlightBlueSlider.ZIndex = 1001
highlightBlueSlider.Parent = highlightSettingsFrame

local highlightBlueLabel = Instance.new("TextLabel")
highlightBlueLabel.Size = UDim2.new(0, 30, 0, 20)
highlightBlueLabel.Position = UDim2.new(0, 190, 0, 220)
highlightBlueLabel.BackgroundTransparency = 1
highlightBlueLabel.Text = "B"
highlightBlueLabel.TextColor3 = Color3.fromRGB(0, 0, 255)
highlightBlueLabel.TextSize = 14
highlightBlueLabel.Font = Enum.Font.Gotham
highlightBlueLabel.ZIndex = 1001
highlightBlueLabel.Parent = highlightSettingsFrame

local highlightColorPreview = Instance.new("Frame")
highlightColorPreview.Size = UDim2.new(0, 50, 0, 50)
highlightColorPreview.Position = UDim2.new(0, 220, 0, 170)
highlightColorPreview.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
highlightColorPreview.BorderSizePixel = 0
highlightColorPreview.ZIndex = 1001
highlightColorPreview.Parent = highlightSettingsFrame

local highlightColorPreviewCorner = Instance.new("UICorner")
highlightColorPreviewCorner.CornerRadius = UDim.new(0, 5)
highlightColorPreviewCorner.Parent = highlightColorPreview

-- Name Butonu (Highlight Ayarlar frame'inde)
local nameButton = Instance.new("TextButton")
nameButton.Size = UDim2.new(0, 150, 0, 40)
nameButton.Position = UDim2.new(0, 10, 0, 250)
nameButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
nameButton.Text = "Toggle Names"
nameButton.TextColor3 = Color3.fromRGB(255, 255, 255)
nameButton.TextSize = 18
nameButton.Font = Enum.Font.GothamBold
nameButton.ZIndex = 1001
nameButton.Parent = highlightSettingsFrame

local nameButtonCorner = Instance.new("UICorner")
nameButtonCorner.CornerRadius = UDim.new(0, 8)
nameButtonCorner.Parent = nameButton

-- Speed Ayarlar Frame'i
local speedSettingsFrame = Instance.new("Frame")
speedSettingsFrame.Size = UDim2.new(0, 400, 0, 300)
speedSettingsFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
speedSettingsFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
speedSettingsFrame.BackgroundTransparency = 0.5
speedSettingsFrame.BorderSizePixel = 0
speedSettingsFrame.Visible = false
speedSettingsFrame.ZIndex = 1000
speedSettingsFrame.Parent = screenGui

local speedSettingsCorner = Instance.new("UICorner")
speedSettingsCorner.CornerRadius = UDim.new(0, 10)
speedSettingsCorner.Parent = speedSettingsFrame

-- Speed Ayarlar Üst çubuk
local speedSettingsTopBar = Instance.new("Frame")
speedSettingsTopBar.Size = UDim2.new(1, 0, 0, 30)
speedSettingsTopBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
speedSettingsTopBar.BorderSizePixel = 0
speedSettingsTopBar.ZIndex = 1001
speedSettingsTopBar.Parent = speedSettingsFrame

local speedSettingsTopBarCorner = Instance.new("UICorner")
speedSettingsTopBarCorner.CornerRadius = UDim.new(0, 10)
speedSettingsTopBarCorner.Parent = speedSettingsTopBar

-- Speed Ayarlar Başlık
local speedSettingsTitleText = Instance.new("TextLabel")
speedSettingsTitleText.Size = UDim2.new(0, 200, 1, 0)
speedSettingsTitleText.Position = UDim2.new(0, 10, 0, 0)
speedSettingsTitleText.BackgroundTransparency = 1
speedSettingsTitleText.Text = "Speed Settings"
speedSettingsTitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
speedSettingsTitleText.TextSize = 20
speedSettingsTitleText.Font = Enum.Font.GothamBold
speedSettingsTitleText.TextXAlignment = Enum.TextXAlignment.Left
speedSettingsTitleText.ZIndex = 1002
speedSettingsTitleText.Parent = speedSettingsTopBar

-- Speed Ayarlar Kapatma düğmesi
local speedSettingsCloseButton = Instance.new("TextButton")
speedSettingsCloseButton.Size = UDim2.new(0, 30, 0, 30)
speedSettingsCloseButton.Position = UDim2.new(1, -40, 0, 0)
speedSettingsCloseButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
speedSettingsCloseButton.Text = "X"
speedSettingsCloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
speedSettingsCloseButton.TextSize = 16
speedSettingsCloseButton.Font = Enum.Font.GothamBold
speedSettingsCloseButton.ZIndex = 1002
speedSettingsCloseButton.Parent = speedSettingsTopBar

local speedSettingsCloseButtonCorner = Instance.new("UICorner")
speedSettingsCloseButtonCorner.CornerRadius = UDim.new(0, 5)
speedSettingsCloseButtonCorner.Parent = speedSettingsCloseButton

-- Speed Textbox
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(0, 200, 0, 30)
speedLabel.Position = UDim2.new(0, 10, 0, 40)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Walk Speed:"
speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
speedLabel.TextSize = 16
speedLabel.Font = Enum.Font.Gotham
speedLabel.TextXAlignment = Enum.TextXAlignment.Left
speedLabel.ZIndex = 1001
speedLabel.Parent = speedSettingsFrame

local speedTextbox = Instance.new("TextBox")
speedTextbox.Size = UDim2.new(0, 180, 0, 30)
speedTextbox.Position = UDim2.new(0, 10, 0, 70)
speedTextbox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
speedTextbox.Text = "16"
speedTextbox.TextColor3 = Color3.fromRGB(255, 255, 255)
speedTextbox.TextSize = 14
speedTextbox.Font = Enum.Font.Gotham
speedTextbox.ZIndex = 1001
speedTextbox.Parent = speedSettingsFrame

local speedTextboxCorner = Instance.new("UICorner")
speedTextboxCorner.CornerRadius = UDim.new(0, 5)
speedTextboxCorner.Parent = speedTextbox

-- Highlight ve Name durumu
local highlights = {}
local nameTags = {}
local isHighlighting = false
local isShowingNames = false
local isInfiniteJump = false
local isSpeedBoost = false
local highlightFillColor = Color3.fromRGB(255, 0, 0)
local defaultSpeed = 16
local customSpeed = 16

-- Slider input validation
local function validateSliderInput(textBox)
    local value = tonumber(textBox.Text)
    if value then
        value = math.clamp(value, 0, 255)
        textBox.Text = tostring(value)
    else
        textBox.Text = "0"
    end
    return tonumber(textBox.Text)
end

-- Speed input validation
local function validateSpeedInput()
    local value = tonumber(speedTextbox.Text)
    if value then
        value = math.clamp(value, 0, 1000)
        speedTextbox.Text = tostring(value)
    else
        speedTextbox.Text = tostring(defaultSpeed)
    end
    customSpeed = value
    debugLog("Set custom speed to: " .. customSpeed)
    -- Hız açıksa hemen uygula
    if isSpeedBoost and player.Character then
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = customSpeed
            debugLog("Applied custom speed: " .. customSpeed)
        else
            debugLog("Humanoid not found for speed update")
        end
    end
    return value
end

-- Update highlight color from sliders
local function updateHighlightColor()
    local r = validateSliderInput(highlightRedSlider)
    local g = validateSliderInput(highlightGreenSlider)
    local b = validateSliderInput(highlightBlueSlider)
    highlightFillColor = Color3.fromRGB(r, g, b)
    highlightColorPreview.BackgroundColor3 = highlightFillColor
    updateHighlights()
end

-- Update highlight color from preset button
local function setPresetColor(color)
    highlightFillColor = color
    highlightColorPreview.BackgroundColor3 = color
    highlightRedSlider.Text = math.floor(color.R * 255)
    highlightGreenSlider.Text = math.floor(color.G * 255)
    highlightBlueSlider.Text = math.floor(color.B * 255)
    updateHighlights()
end

-- Connect preset color buttons
for _, button in ipairs(presetColorFrame:GetChildren()) do
    if button:IsA("TextButton") then
        button.MouseButton1Click:Connect(function()
            setPresetColor(button.BackgroundColor3)
        end)
    end
end

-- Connect sliders
highlightRedSlider.FocusLost:Connect(updateHighlightColor)
highlightGreenSlider.FocusLost:Connect(updateHighlightColor)
highlightBlueSlider.FocusLost:Connect(updateHighlightColor)
speedTextbox.FocusLost:Connect(validateSpeedInput)

-- Name tag oluşturma fonksiyonu
local function createNameTag(plr, character)
    debugLog("Attempting to create name tag for " .. plr.Name)
    local targetPart = character:FindFirstChild("Head") or character:FindFirstChild("HumanoidRootPart")
    if not targetPart then
        debugLog("No Head or HumanoidRootPart found for " .. plr.Name)
        return
    end

    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Name = "NameTag"
    billboardGui.Adornee = targetPart
    billboardGui.Size = UDim2.new(0, 150, 0, 40)
    billboardGui.StudsOffset = Vector3.new(0, 3, 0)
    billboardGui.AlwaysOnTop = true
    billboardGui.MaxDistance = 100
    billboardGui.ZIndex = 1001
    billboardGui.Parent = CoreGui -- CoreGui'ya parent yap

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, 0, 1, 0)
    nameLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    nameLabel.BackgroundTransparency = 0.5
    nameLabel.Text = plr.Name
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.TextSize = 16
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextStrokeTransparency = 0.5
    nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    nameLabel.ZIndex = 1002
    nameLabel.Parent = billboardGui

    nameTags[plr] = billboardGui
    debugLog("Successfully applied name tag to " .. plr.Name)
end

-- Highlight fonksiyonu
local function updateHighlights()
    debugLog("Updating highlights, isHighlighting: " .. tostring(isHighlighting))
    for plr, highlight in pairs(highlights) do
        if highlight then
            highlight:Destroy()
        end
    end
    highlights = {}
    if isHighlighting then
        for _, plr in pairs(Players:GetPlayers()) do
            if plr.Character and plr ~= player then
                local highlight = Instance.new("Highlight")
                highlight.FillColor = highlightFillColor
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.FillTransparency = 0.5
                highlight.OutlineTransparency = 0
                highlight.Adornee = plr.Character
                highlight.Parent = plr.Character
                highlights[plr] = highlight
                debugLog("Applied highlight to " .. plr.Name)
            end
        end
    end
end

-- Name tag fonksiyonu
local function updateNameTags()
    debugLog("Updating name tags, isShowingNames: " .. tostring(isShowingNames))
    for plr, nameTag in pairs(nameTags) do
        if nameTag then
            nameTag:Destroy()
        end
    end
    nameTags = {}
    if isShowingNames then
        for _, plr in pairs(Players:GetPlayers()) do
            if plr.Character and plr ~= player then
                createNameTag(plr, plr.Character)
            end
        end
    end
end

local function toggleHighlight()
    isHighlighting = not isHighlighting
    debugLog("Toggled highlight to: " .. tostring(isHighlighting))
    if isHighlighting then
        highlightButton.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
    else
        highlightButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    end
    updateHighlights()
end

local function toggleNames()
    isShowingNames = not isShowingNames
    debugLog("Toggled names to: " .. tostring(isShowingNames))
    if isShowingNames then
        nameButton.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
    else
        nameButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    end
    updateNameTags()
end

local function toggleInfiniteJump()
    isInfiniteJump = not isInfiniteJump
    debugLog("Toggled infinite jump to: " .. tostring(isInfiniteJump))
    if isInfiniteJump then
        infiniteJumpButton.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
    else
        infiniteJumpButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    end
end

local function toggleSpeed()
    isSpeedBoost = not isSpeedBoost
    debugLog("Toggled speed boost to: " .. tostring(isSpeedBoost))
    if player.Character then
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            if isSpeedBoost then
                playerSpeedButton.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
                humanoid.WalkSpeed = customSpeed
                debugLog("Set WalkSpeed to: " .. customSpeed)
            else
                playerSpeedButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                humanoid.WalkSpeed = defaultSpeed
                debugLog("Reset WalkSpeed to: " .. defaultSpeed)
            end
        else
            debugLog("Humanoid not found for speed toggle")
        end
    else
        debugLog("Character not found for speed toggle")
    end
end

highlightButton.MouseButton1Click:Connect(function()
    debugLog("Highlight button clicked")
    toggleHighlight()
end)
nameButton.MouseButton1Click:Connect(function()
    debugLog("Name button clicked")
    toggleNames()
end)
infiniteJumpButton.MouseButton1Click:Connect(function()
    debugLog("Infinite Jump button clicked")
    toggleInfiniteJump()
end)
playerSpeedButton.MouseButton1Click:Connect(function()
    debugLog("Player Speed button clicked")
    toggleSpeed()
end)

-- Infinite Jump işlevi
UserInputService.JumpRequest:Connect(function()
    if isInfiniteJump and player.Character then
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            debugLog("Triggered infinite jump")
        else
            debugLog("Humanoid not found for infinite jump")
        end
    end
end)

-- Oyuncu ayrıldığında highlight ve name tag temizle
Players.PlayerRemoving:Connect(function(plr)
    if highlights[plr] then
        highlights[plr]:Destroy()
        highlights[plr] = nil
        debugLog("Removed highlight for " .. plr.Name)
    end
    if nameTags[plr] then
        nameTags[plr]:Destroy()
        nameTags[plr] = nil
        debugLog("Removed name tag for " .. plr.Name)
    end
end)

-- Yeni oyuncu eklendiğinde highlight ve name tag uygula
Players.PlayerAdded:Connect(function(plr)
    if plr ~= player then
        debugLog("New player joined: " .. plr.Name)
        if plr.Character then
            if isHighlighting then
                local highlight = Instance.new("Highlight")
                highlight.FillColor = highlightFillColor
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.FillTransparency = 0.5
                highlight.OutlineTransparency = 0
                highlight.Adornee = plr.Character
                highlight.Parent = plr.Character
                highlights[plr] = highlight
                debugLog("Applied highlight to new player " .. plr.Name .. " (existing character)")
            end
            if isShowingNames then
                createNameTag(plr, plr.Character)
            end
        end
        plr.CharacterAdded:Connect(function(character)
            if isHighlighting then
                local highlight = Instance.new("Highlight")
                highlight.FillColor = highlightFillColor
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.FillTransparency = 0.5
                highlight.OutlineTransparency = 0
                highlight.Adornee = character
                highlight.Parent = character
                highlights[plr] = highlight
                debugLog("Applied highlight to " .. plr.Name .. " (new character)")
            end
            if isShowingNames then
                createNameTag(plr, character)
            end
            if isSpeedBoost and plr == player then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = customSpeed
                    debugLog("Applied custom speed to " .. plr.Name .. " on respawn")
                end
            end
        end)
    end
end)

-- Mevcut oyuncular için CharacterAdded bağla
for _, plr in pairs(Players:GetPlayers()) do
    if plr ~= player then
        plr.CharacterAdded:Connect(function(character)
            if isHighlighting then
                local highlight = Instance.new("Highlight")
                highlight.FillColor = highlightFillColor
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.FillTransparency = 0.5
                highlight.OutlineTransparency = 0
                highlight.Adornee = character
                highlight.Parent = character
                highlights[plr] = highlight
                debugLog("Applied highlight to " .. plr.Name .. " (existing player)")
            end
            if isShowingNames then
                createNameTag(plr, character)
            end
        end)
        if plr.Character then
            if isHighlighting then
                local highlight = Instance.new("Highlight")
                highlight.FillColor = highlightFillColor
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.FillTransparency = 0.5
                highlight.OutlineTransparency = 0
                highlight.Adornee = plr.Character
                highlight.Parent = plr.Character
                highlights[plr] = highlight
                debugLog("Applied highlight to " .. plr.Name .. " (initial check)")
            end
            if isShowingNames then
                createNameTag(plr, plr.Character)
            end
        end
    end
end

-- Oyuncunun karakteri yeniden yüklendiğinde hızı koru
player.CharacterAdded:Connect(function(character)
    if isSpeedBoost then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = customSpeed
            debugLog("Restored custom speed on player respawn: " .. customSpeed)
        else
            debugLog("Humanoid not found on respawn for speed restore")
        end
    end
end)

-- Renk değiştirme animasyonu
local hue = 0
RunService.RenderStepped:Connect(function()
    hue = (hue + 0.01) % 1
    local color = Color3.fromHSV(hue, 1, 1)
    titleText.TextColor3 = color
    highlightSettingsTitleText.TextColor3 = color
    speedSettingsTitleText.TextColor3 = color
end)

-- Geliştirilmiş sürükleme özelliği
local function setupDragging(frame, dragBar)
    local dragging = false
    local dragStart = nil
    local startPos = nil

    local function updateDrag(input)
        if dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end

    dragBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            input:GetPropertyChangedSignal("Position"):Connect(function()
                updateDrag(input)
            end)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            updateDrag(input)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
end

setupDragging(mainFrame, topBar)
setupDragging(highlightSettingsFrame, highlightSettingsTopBar)
setupDragging(speedSettingsFrame, speedSettingsTopBar)

-- Kapatma düğmesi işlevi
closeButton.MouseButton1Click:Connect(function()
    debugLog("Close button clicked")
    mainFrame.Visible = false
end)

-- Highlight Ayarlar kapatma düğmesi
highlightSettingsCloseButton.MouseButton1Click:Connect(function()
    debugLog("Highlight settings close button clicked")
    highlightSettingsFrame.Visible = false
    mainFrame.Visible = true
end)

-- Speed Ayarlar kapatma düğmesi
speedSettingsCloseButton.MouseButton1Click:Connect(function()
    debugLog("Speed settings close button clicked")
    speedSettingsFrame.Visible = false
    mainFrame.Visible = true
end)

-- Ayarlar butonu işlevi
settingsButton.MouseButton1Click:Connect(function()
    debugLog("Settings button clicked")
    mainFrame.Visible = false
    highlightSettingsFrame.Visible = true
end)

-- Player Speed butonu ayarlar işlevi
playerSpeedButton.MouseButton1Click:Connect(function()
    debugLog("Player Speed button clicked (opening settings)")
    mainFrame.Visible = false
    speedSettingsFrame.Visible = true
end)

-- Delete tuşu ile GUI açma/kapama
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.Delete then
        debugLog("Delete key pressed")
        if highlightSettingsFrame.Visible or speedSettingsFrame.Visible then
            highlightSettingsFrame.Visible = false
            speedSettingsFrame.Visible = false
            mainFrame.Visible = true
        else
            mainFrame.Visible = not mainFrame.Visible
        end
    end
end)
