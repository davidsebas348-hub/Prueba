local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local gui = game:GetService("CoreGui"):FindFirstChild("SBS_HUB")
if not gui then return end

local mainFrame = gui:FindFirstChildWhichIsA("Frame")
if not mainFrame then return end

local rightFrame = mainFrame:FindFirstChildWhichIsA("ScrollingFrame")
if not rightFrame then return end

-- CONFIG
local buttonsConfig = {
    ["RAMIREZ"] = "Target",
}

-- LISTA
local listFrame = Instance.new("ScrollingFrame")
listFrame.Parent = mainFrame
listFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
listFrame.BorderSizePixel = 0
listFrame.Visible = false
listFrame.ZIndex = 999999
listFrame.ScrollBarThickness = 6

local layout = Instance.new("UIListLayout", listFrame)

local open = false
local currentVariable = nil
local currentButton = nil

-- REFRESH
local function refresh()
    listFrame:ClearAllChildren()
    Instance.new("UIListLayout", listFrame)

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

-- DETECTAR CLICK REAL (SIN CONFLICTO)
UIS.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end

    local mouse = LocalPlayer:GetMouse()
    local target = mouse.Target

    -- buscar botón manual
    for _,btn in pairs(rightFrame:GetDescendants()) do
        if btn:IsA("TextButton") then
            for name,var in pairs(buttonsConfig) do
                if string.find(btn.Text, name) then

                    -- comprobar si clickeaste ese botón
                    local pos = btn.AbsolutePosition
                    local size = btn.AbsoluteSize
                    local mpos = UIS:GetMouseLocation()

                    if mpos.X >= pos.X and mpos.X <= pos.X + size.X and
                       mpos.Y >= pos.Y and mpos.Y <= pos.Y + size.Y then

                        -- TOGGLE REAL
                        if currentButton == btn and open then
                            open = false
                            listFrame.Visible = false
                            return
                        end

                        currentButton = btn
                        currentVariable = var
                        open = true
                        listFrame.Visible = true
                        refresh()
                    end
                end
            end
        end
    end

    -- click fuera → cerrar
    if open then
        listFrame.Visible = false
        open = false
    end
end)

-- SEGUIR BOTÓN
task.spawn(function()
    while true do
        task.wait()

        if currentButton and currentButton.Parent and currentButton.Visible then
            local pos = currentButton.AbsolutePosition
            local size = currentButton.AbsoluteSize

            listFrame.Position = UDim2.new(
                0, pos.X - mainFrame.AbsolutePosition.X,
                0, pos.Y - mainFrame.AbsolutePosition.Y + size.Y + 5
            )

            listFrame.Size = UDim2.new(0,size.X,0,150)
        else
            listFrame.Visible = false
            open = false
        end
    end
end)
