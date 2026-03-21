-- ======================
-- SBS HUB COMPLETO FINAL (TSB)
-- ======================
repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- TITULOS ARRIBA DE BOTONES
local buttonTitles = {
    ["SPEED"] = "PLAYER",
    ["INFINITY ZOOM"] = "CAMERA",

    ["ELIGIR PACK"] = "ANIMATION PACK",
    ["GAZE EMOTE"] = "EMOTES",
    
    ["ESP TO ALL THE TOKEN"] = "ESP ITEMS",
    ["AIM LOCK"] = "AIMBOT",
    ["AUTO WALL COMBO"] = "AUTO COMBOS",

    ["AUTO OBBY"] = "OBBY",

    ["Fps Boost"] = "PERFORMANCE"
}

getgenv().SBS_BUTTON_STATES = getgenv().SBS_BUTTON_STATES or {}
local buttonStates = getgenv().SBS_BUTTON_STATES
-- BOTONES QUE NO SERAN TOGLE
local noToggleButtons = {
    ["YOUTUBE:SBS HUB"] = true,
    ["SUSCRIBETE:)"] = true,
    ["Gaze Emote"] = true,
    ["LOCALPLAYER"] = true,
    ["RESET STATS"] = true,
    ["DESYNC"] = true,
    ["Fps Boost"] = true,
    ["FULL BRIGHT"] = true,
    ["INFINITY STAMINA"] = true,
    ["COMPLETE OBBY"] = true,
    ["AUTO COLLECT CASH (FARM)"] = true,
    ["AUTO TP A TASK (BUTTON)"] = true,
    ["REMOVE INVISIBLE WALLS"] = true,
    ["HITBOX EXTENDER"] = true,
}

-- BOTONES SIN EFECTO VERDE
local noGreenFlash = {
    ["SUSCRIBETE:)"] = true
}

local textboxButtons = {
    ["SPEED"] = {
        variable = "SPEED",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Speed/refs/heads/main/Speed.lua"
    },

    ["JUMPPOWER"] = {
        variable = "JUMP",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/JumpPower/refs/heads/main/JumpPower.lua"
    },

    ["GRAVITY"] = {
        variable = "GRAVITY",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Gravity/refs/heads/main/Gravity.lua"
    },

    ["FLY SPEED"] = {
        variable = "FLY_SPEED",
        url = nil
    },

    ["RANGE"] = {
        variable = "RANGE",
        url = nil
    },

    -- 🔥 ESTE ES EL QUE FALTABA BIEN PUESTO
    ["TARGET PLAYER"] = {
        variable = "TARGET",
        mode = "player"
    }
}
local screenGui = Instance.new("ScreenGui", PlayerGui)
local old = PlayerGui:FindFirstChild("SBS_HUB")
if old then
    old:Destroy()
end
screenGui.Name = "SBS_HUB"
screenGui.ResetOnSpawn = false
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0,500,0,350)
mainFrame.Position = UDim2.new(0.5,-250,0.5,-175)
mainFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
mainFrame.BorderSizePixel = 0

-- ======================
-- RESIZE CORNER
-- ======================
local resizeCorner = Instance.new("Frame", mainFrame)
resizeCorner.Size = UDim2.new(0,20,0,20)
resizeCorner.Position = UDim2.new(1,-20,1,-20)
resizeCorner.BackgroundTransparency = 0.5
resizeCorner.BackgroundColor3 = Color3.fromRGB(255,255,255)
resizeCorner.BorderSizePixel = 0
resizeCorner.ZIndex = 10

-- ======================
-- RESIZE LOGIC
-- ======================
do
    local dragging, dragStart, startSize
    local function updateSize(input)
        local delta = input.Position - dragStart
        local newWidth = math.max(100, startSize.X + delta.X) -- mínimo ancho 100
        local newHeight = math.max(100, startSize.Y + delta.Y) -- mínimo alto 100
        mainFrame.Size = UDim2.new(0, newWidth, 0, newHeight)
    end
    resizeCorner.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startSize = Vector2.new(mainFrame.AbsoluteSize.X, mainFrame.AbsoluteSize.Y)
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateSize(input)
        end
    end)
end


local stroke = Instance.new("UIStroke", mainFrame)
stroke.Color = Color3.fromRGB(255,255,255)
stroke.Thickness = 2

do
    local dragging, dragStart, startPos, dragInput
    local function update(input)
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
    mainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    mainFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then update(input) end
    end)
end

local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1,0,0,50)
title.BackgroundColor3 = Color3.fromRGB(0,0,0)
title.Text = "SBS HUB | TSB"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
local line = Instance.new("Frame", mainFrame)
line.Size = UDim2.new(1,0,0,2)
line.Position = UDim2.new(0,0,0,50)
line.BackgroundColor3 = Color3.fromRGB(255,255,255)

local rightFrame = Instance.new("ScrollingFrame", mainFrame)
rightFrame.Size = UDim2.new(1,-150,1,-52)
rightFrame.Position = UDim2.new(0,150,0,52)
rightFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
rightFrame.BorderSizePixel = 0

local leftFrame = Instance.new("ScrollingFrame", mainFrame)
leftFrame.Size = UDim2.new(0,150,1,-52)
leftFrame.Position = UDim2.new(0,0,0,52)
leftFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
leftFrame.BorderSizePixel = 0
leftFrame.ScrollBarThickness = 6
leftFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

-- ✅ AHORA SÍ (AQUÍ)
local padding = Instance.new("UIPadding", rightFrame)
padding.PaddingBottom = UDim.new(0,50)



local midLine = Instance.new("Frame", mainFrame)
midLine.Size = UDim2.new(0,2,1,-52)
midLine.Position = UDim2.new(0,150,0,52)
midLine.BackgroundColor3 = Color3.fromRGB(255,255,255)

local function createMenuButton(parent,text,y,callback)
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1,-20,0,30)
    b.Position = UDim2.new(0,10,0,y)
    b.Text = text
    b.BackgroundColor3 = Color3.fromRGB(15,15,15)
    b.TextColor3 = Color3.fromRGB(255,255,255)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 14
    b.BorderSizePixel = 0
    
    b.MouseButton1Click:Connect(callback)
end


local function createButton(parent,text,y,callback)
    local hasTextbox = textboxButtons[text] ~= nil

    local container = Instance.new("Frame", parent)
    container.Size = UDim2.new(1,-20,0,30)
    container.Position = UDim2.new(0,10,0,y)
    container.BackgroundTransparency = 1

    local button = Instance.new("TextButton", container)
    button.TextColor3 = Color3.fromRGB(255,255,255)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 14
    button.BorderSizePixel = 0
       

-- ======================
-- TEXTBOX MODE
-- ======================
if hasTextbox then
    button:Destroy()
    local data = textboxButtons[text]

    -- 🔥 PLAYER SELECTOR
    if data.mode == "player" then

        local box = Instance.new("TextBox", container)
        box.Size = UDim2.new(0.5,0,1,0)
        box.BackgroundColor3 = Color3.fromRGB(25,25,25)
        box.TextColor3 = Color3.fromRGB(255,255,255)
        box.PlaceholderText = "Select Player"
        box.Font = Enum.Font.GothamBold
        box.TextSize = 14

        local btn = Instance.new("TextButton", container)
        btn.Size = UDim2.new(0.5,0,1,0)
        btn.Position = UDim2.new(0.5,0,0,0)
        btn.Text = text
        btn.BackgroundColor3 = Color3.fromRGB(20,20,20)
        btn.TextColor3 = Color3.fromRGB(255,255,255)

        local dropdown = Instance.new("Frame", container)
        dropdown.Position = UDim2.new(0,0,1,0)
        dropdown.Size = UDim2.new(0.5,0,0,0)
        dropdown.BackgroundColor3 = Color3.fromRGB(15,15,15)
        dropdown.Visible = false
        dropdown.ZIndex = 50

        Instance.new("UIListLayout", dropdown)

        local function refresh()
            for _,v in pairs(dropdown:GetChildren()) do
                if not v:IsA("UIListLayout") then
                    v:Destroy()
                end
            end

            local count = 0

            for _,plr in pairs(Players:GetPlayers()) do
                count += 1

                local p = Instance.new("TextButton", dropdown)
                p.Size = UDim2.new(1,0,0,25)
                p.Text = plr.DisplayName
                p.BackgroundColor3 = Color3.fromRGB(20,20,20)
                p.TextColor3 = Color3.fromRGB(255,255,255)

                p.MouseButton1Click:Connect(function()
                    box.Text = plr.DisplayName
                    getgenv()[data.variable] = plr
                    dropdown.Visible = false
                end)
            end

            dropdown.Size = UDim2.new(0.5,0,0,count*25)
        end

        -- 🔥 AUTO UPDATE
        Players.PlayerAdded:Connect(function()
            if dropdown.Visible then refresh() end
        end)

        Players.PlayerRemoving:Connect(function()
            if dropdown.Visible then refresh() end
        end)

        box.Focused:Connect(function()
            dropdown.Visible = true
            refresh()
        end)

        box.FocusLost:Connect(function()
            task.wait(0.1)
            dropdown.Visible = false
        end)

        btn.MouseButton1Click:Connect(function()
            if box.Text ~= "" then
                getgenv()[data.variable] = box.Text
            end
        end)

    else
        -- ✅ TEXTBOX NORMAL
        local box = Instance.new("TextBox", container)
        box.Size = UDim2.new(1,0,1,0)
        box.BackgroundColor3 = Color3.fromRGB(25,25,25)
        box.TextColor3 = Color3.fromRGB(255,255,255)
        box.PlaceholderText = text

        box.FocusLost:Connect(function()
            local value = tonumber(box.Text)
            if not value then return end

            getgenv()[data.variable] = value

            if data.url then
                loadstring(game:HttpGet(data.url))()
            end

            box.Text = ""
        end)
    end

else
    -- 🔹 BOTÓN NORMAL
    button.Size = UDim2.new(1,0,1,0)

    local isToggle = not noToggleButtons[text]

    if isToggle then
        if buttonStates[text] == nil then
            buttonStates[text] = false
        end

        local function updateVisual()
            if buttonStates[text] then
                button.Text = text.." [ON]"
                button.BackgroundColor3 = Color3.fromRGB(0,120,0)
            else
                button.Text = text.." [OFF]"
                button.BackgroundColor3 = Color3.fromRGB(20,20,20)
            end
        end

        updateVisual()

        button.MouseButton1Click:Connect(function()
            buttonStates[text] = not buttonStates[text]
            updateVisual()
            callback(buttonStates[text])
        end)

    else
        button.Text = text
        button.BackgroundColor3 = Color3.fromRGB(20,20,20)

        button.MouseButton1Click:Connect(function()
            if not noGreenFlash[text] then
                local oldColor = button.BackgroundColor3
                button.BackgroundColor3 = Color3.fromRGB(0,120,0)
                task.delay(1,function()
                    if button then
                        button.BackgroundColor3 = oldColor
                    end
                end)
            end
            callback()
        end)
    end
    end


end
end 
-- ======================
-- SCROLL POR SUBMENU
-- ======================
local scrollConfig = {
    ["COMBAT"] = true,
}
-- =====================
-- MENUS
-- ======================
local menuOrder = {"COMBAT"}
local menuData = {
    ["COMBAT"] = {
        "KILL AURA",
        "RANGE",
        "TARGET PLAYER",
    },
}

local function clearFrame(frame)
    for _,v in pairs(frame:GetChildren()) do
        if not v:IsA("UIPadding") then
            if v:IsA("TextButton") or v:IsA("TextLabel") or v:IsA("Frame") then
                v:Destroy()
            end
        end
    end
    frame.CanvasPosition = Vector2.new(0,0)
end

for i,menu in ipairs(menuOrder) do
    createMenuButton(leftFrame, menu, 10+(i-1)*35, function()
    clearFrame(rightFrame)
        -- scroll
        if scrollConfig[menu] then
            rightFrame.ScrollBarThickness = 6
            rightFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
        else
            rightFrame.ScrollBarThickness = 0
            rightFrame.AutomaticCanvasSize = Enum.AutomaticSize.None
            rightFrame.CanvasSize = UDim2.new(0,0,0,0)
        end

        local titleLabel = Instance.new("TextLabel", rightFrame)
        titleLabel.Size = UDim2.new(1,0,0,30)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Text = menu
        titleLabel.TextColor3 = Color3.fromRGB(255,255,255)
        titleLabel.Font = Enum.Font.GothamBold
        titleLabel.TextSize = 18

        local oy = 40

        for _,opt in ipairs(menuData[menu]) do

    -- CREAR TITULO SI EXISTE
    if buttonTitles[opt] then
        local section = Instance.new("TextLabel", rightFrame)
        section.Size = UDim2.new(1,-20,0,25)
        section.Position = UDim2.new(0,10,0,oy)
        section.BackgroundTransparency = 1
        section.Text = buttonTitles[opt]
        section.TextColor3 = Color3.fromRGB(200,200,200)
        section.Font = Enum.Font.GothamBold
        section.TextSize = 16
        section.TextXAlignment = Enum.TextXAlignment.Left

        oy += 30
    end

    createButton(rightFrame,opt,oy,function(state)

        if opt == "RESET STATS" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Reset-speed-jumpPower-y-gravedad-/refs/heads/main/Reset.lua"))()

        elseif opt == "ESP TO ALL THE CUBES" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text374/refs/heads/main/Text374.lua"))()
                            
        elseif opt == "ESP NAME" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text375/refs/heads/main/Text375.lua"))()

        
        end

    end)

    oy += 40
end

end)
end

-- ICONO SBS PARA ABRIR/CERRAR
local toggle = Instance.new("TextButton", screenGui)
toggle.Size = UDim2.new(0,60,0,60)
toggle.Position = UDim2.new(1,-80,0,20)
toggle.BackgroundColor3 = Color3.fromRGB(20,20,20)
toggle.Text = "SBS"
toggle.TextColor3 = Color3.fromRGB(255,255,255)
toggle.Font = Enum.Font.GothamBold
toggle.TextSize = 24
toggle.BorderSizePixel = 0
local corner = Instance.new("UICorner", toggle)
corner.CornerRadius = UDim.new(0.3,0)
do
    local dragging, dragStart, startPos, dragInput
    local function update(input)
        local delta = input.Position - dragStart
        toggle.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
    toggle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = toggle.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    toggle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then update(input) end
    end)
end
local open = true
toggle.MouseButton1Click:Connect(function()
    open = not open
    mainFrame.Visible = open
end)
