local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local buttonName = "RAMIREZ"
local variableName = "Target"

local gui = game:GetService("CoreGui"):FindFirstChild("SBS_HUB")
if not gui then return end

local mainFrame = gui:FindFirstChildWhichIsA("Frame")
if not mainFrame then return end

local rightFrame = mainFrame:FindFirstChildWhichIsA("ScrollingFrame")
if not rightFrame then return end

local listFrame = Instance.new("Frame")
listFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
listFrame.BorderSizePixel = 0
listFrame.Visible = false
listFrame.Parent = gui
listFrame.ZIndex = 99999999

local layout = Instance.new("UIListLayout", listFrame)
layout.SortOrder = Enum.SortOrder.LayoutOrder

local open = false
local targetButton = nil

-- 🔍 BUSCAR BOTÓN
local function findButton()
    for _,v in pairs(rightFrame:GetDescendants()) do
        if v:IsA("TextButton") and v.Text:find(buttonName) then
            return v
        end
    end
end

-- 🔄 REFRESH LISTA
local function refresh()
    for _,v in pairs(listFrame:GetChildren()) do
        if v:IsA("TextButton") then
            v:Destroy()
        end
    end

    for _,plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            local b = Instance.new("TextButton")
            b.Size = UDim2.new(1,0,0,25)
            b.BackgroundColor3 = Color3.fromRGB(30,30,30)
            b.TextColor3 = Color3.fromRGB(255,255,255)
            b.Text = plr.Name
            b.Parent = listFrame

            b.MouseButton1Click:Connect(function()
                getgenv()[variableName] = plr.Name
                listFrame.Visible = false
                open = false
            end)
        end
    end
end

-- 📍 SEGUIR BOTÓN
task.spawn(function()
    while true do
        task.wait()

        if not targetButton or not targetButton.Parent then
            targetButton = findButton()
        end

        if targetButton and targetButton.Visible then
            local pos = targetButton.AbsolutePosition
            local size = targetButton.AbsoluteSize

            listFrame.Position = UDim2.new(0, pos.X, 0, pos.Y + size.Y + 5)
            listFrame.Size = UDim2.new(0, size.X, 0, 120)
        else
            listFrame.Visible = false
        end
    end
end)

-- 🖱️ DETECTAR CLICK GLOBAL
game:GetService("UserInputService").InputBegan:Connect(function(input,gp)
    if gp then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 then

        local btn = findButton()
        if not btn then return end

        local mouse = LocalPlayer:GetMouse()
        if mouse.Target == nil then return end

        -- toggle
        open = not open
        listFrame.Visible = open

        if open then
            refresh()
        end
    end
end)
