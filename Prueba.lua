local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local gui = game:GetService("CoreGui"):FindFirstChild("SBS_HUB")
if not gui then return end

local mainFrame = gui:FindFirstChildWhichIsA("Frame")
if not mainFrame then return end

local rightFrame = mainFrame:FindFirstChildWhichIsA("ScrollingFrame")
if not rightFrame then return end

-- 🔥 CONFIG MULTI BOTONES
local buttonsConfig = {
    ["RAMIREZ"] = "Target",
}

-- 📦 LISTA (AHORA DENTRO DEL HUB ✅)
local listFrame = Instance.new("ScrollingFrame")
listFrame.Parent = mainFrame -- 🔥 CAMBIO IMPORTANTE
listFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
listFrame.BorderSizePixel = 0
listFrame.Visible = false
listFrame.ZIndex = 999999
listFrame.ScrollBarThickness = 6
listFrame.CanvasSize = UDim2.new(0,0,0,0)

local layout = Instance.new("UIListLayout", listFrame)
layout.SortOrder = Enum.SortOrder.LayoutOrder

local open = false
local currentVariable = nil
local targetButton = nil
local connectedButtons = {}

-- 🔍 BUSCAR BOTONES
local function findButtons()
    local found = {}
    for _,v in pairs(rightFrame:GetDescendants()) do
        if v:IsA("TextButton") then
            for name,_ in pairs(buttonsConfig) do
                if v.Text:find(name) then
                    table.insert(found, v)
                end
            end
        end
    end
    return found
end

-- 🔄 REFRESH
local function refresh()
    for _,v in pairs(listFrame:GetChildren()) do
        if v:IsA("TextButton") then
            v:Destroy()
        end
    end

    local count = 0

    for _,plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            count += 1

            local b = Instance.new("TextButton")
            b.Size = UDim2.new(1,0,0,25)
            b.BackgroundColor3 = Color3.fromRGB(30,30,30)
            b.TextColor3 = Color3.fromRGB(255,255,255)
            b.Text = plr.Name
            b.Parent = listFrame

            b.MouseButton1Click:Connect(function()
                if currentVariable then
                    getgenv()[currentVariable] = plr.Name
                end
                listFrame.Visible = false
                open = false
            end)
        end
    end

    listFrame.CanvasSize = UDim2.new(0,0,0,count * 26)
end

-- 📍 LOOP
task.spawn(function()
    while true do
        task.wait()

        -- ❌ SI CAMBIAS DE MENÚ → CERRAR
        if targetButton and not targetButton:IsDescendantOf(rightFrame) then
            listFrame.Visible = false
            open = false
            targetButton = nil
        end

        -- ❌ SI GUI CERRADA
        if not mainFrame.Visible then
            listFrame.Visible = false
            open = false
        end

        local buttons = findButtons()

        for _,btn in pairs(buttons) do
            if not connectedButtons[btn] then
                connectedButtons[btn] = true

                btn.MouseButton1Click:Connect(function()
                    for name,var in pairs(buttonsConfig) do
                        if btn.Text:find(name) then
                            currentVariable = var
                        end
                    end

                    -- 🔥 TOGGLE REAL
                    if targetButton == btn and open then
                        open = false
                        listFrame.Visible = false
                        return
                    end

                    targetButton = btn
                    open = true
                    listFrame.Visible = true
                    refresh()
                end)
            end
        end

        -- 📍 POSICIÓN
        if targetButton and targetButton.Visible then
            local pos = targetButton.AbsolutePosition
            local size = targetButton.AbsoluteSize

            listFrame.Position = UDim2.new(
                0, pos.X - mainFrame.AbsolutePosition.X,
                0, pos.Y - mainFrame.AbsolutePosition.Y + size.Y + 5
            )

            listFrame.Size = UDim2.new(0,size.X,0,150)
        else
            listFrame.Visible = false
        end
    end
end)
