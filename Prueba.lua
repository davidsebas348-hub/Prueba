loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text155/refs/heads/main/Text155.lua"))() -- Detectar Rol (importante)

-- ======================
-- SBS HUB COMPLETO FINAL  (mm2)
-- ======================

repeat task.wait() until game:IsLoaded()

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game:GetService("CoreGui")
screenGui.DisplayOrder = 999999
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TextService = game:GetService("TextService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

--==================================================
-- CONFIGURACIÓN
--==================================================

local menuNames = {
    ["MAIN"] = "PLAYER MENU",
    ["ESP"] = "ESP",
    ["COMBATE"] = "AUTO M1 COMBOS",
    ["AUTO"] = "M1",
    ["TELEPORT"] = "ETAPA",
    ["LABELS"] = "LABELS",
    ["FPS"] = "FPS",
    ["YOUTUBE"] = "YOUTUBE",
}

--==================================================
-- ICONOS
--==================================================

-- ICONOS DEL MENÚ IZQUIERDO
-- LEFT = izquierda
-- RIGHT = derecha

local leftMenuIcons = {

    ["MAIN"] = "rbxassetid://ID_AQUI",
    ["ESP"] = "rbxassetid://ID_AQUI",
    ["COMBATE"] = "rbxassetid://ID_CALAVERA",
    ["GAMEPASS"] = "rbxassetid://ID_AQUI",
    ["AUTO"] = "rbxassetid://ID_AQUI",
    ["TELEPORT"] = "rbxassetid://ID_AQUI",
    ["LABELS"] = "rbxassetid://ID_AQUI",
    ["FPS"] = "rbxassetid://ID_AQUI",

}

local iconPositions = {

    ["MAIN"] = "RIGHT",
    ["ESP"] = "RIGHT",
    ["COMBATE"] = "RIGHT",
    ["GAMEPASS"] = "RIGHT",
    ["AUTO"] = "RIGHT",
    ["TELEPORT"] = "RIGHT",
    ["LABELS"] = "RIGHT",
    ["FPS"] = "RIGHT",

}


--==================================================
-- CONFIGURACIÓN BASE DEL SLIDER
-- No está asignado a ningún TextBox todavía.
-- Cambia estos valores cuando decidas cuál usar.
--==================================================

local sliderSettings = {
    VALOR = {
        variable = "SliderValue",
        min = 1,
        max = 150,
        default = 46,
        step = 1
    },

    TRANSPARENCIA = {
        variable = "XRAY_TRANSPARENCY",
        min = 0,
        max = 1,
        default = 0.5,
        step = 0.1
    },

    FUEZA = {
        variable = "ForceValue",
        min = 0,
        max = 500,
        default = 50,
        step = 5
    }
}

--==================================================
-- ICONOS DE LOS TÍTULOS GRANDES
--==================================================

local rightTitleIcons = {

    ["PLAYER MENU"] = "rbxassetid://ID_AQUI",
    ["ESP"] = "rbxassetid://ID_AQUI",
    ["FIGHT SYSTEM"] = "rbxassetid://ID_CALAVERA",
    ["M1"] = "rbxassetid://ID_AQUI",
    ["ETAPA"] = "rbxassetid://ID_AQUI",
    ["LABELS"] = "rbxassetid://ID_AQUI",
    ["FPS"] = "rbxassetid://ID_AQUI",
    ["YOUTUBE"] = "rbxassetid://ID_AQUI",

}

--==================================================
-- ICONOS DE SUBTÍTULOS / SECCIONES
--==================================================

local rightSubtitleIcons = {

    ["ARMA"] = "rbxassetid://ID_AQUI",
    ["BATON"] = "rbxassetid://ID_AQUI",
    ["JUMP PAD"] = "rbxassetid://ID_AQUI",
    ["HITBOX"] = "rbxassetid://ID_AQUI",

    ["CONFIGURAR TOOLS"] = "rbxassetid://ID_AQUI",
    ["RECOLECCIÓN"] = "rbxassetid://ID_AQUI",
    ["MUNDOS"] = "rbxassetid://ID_AQUI",
    ["CLICK"] = "rbxassetid://ID_AQUI",
    ["JUGADORES"] = "rbxassetid://ID_AQUI",

    ["FLING"] = "rbxassetid://ID_AQUI",
    ["KILL"] = "rbxassetid://ID_AQUI",
    ["SERVER"] = "rbxassetid://ID_AQUI",

    ["TOUCH"] = "rbxassetid://ID_AQUI",
    ["ENEMIES"] = "rbxassetid://ID_AQUI",
    ["PLAYERS"] = "rbxassetid://ID_AQUI",

    ["EAT"] = "rbxassetid://ID_AQUI",
    ["HEALTH"] = "rbxassetid://ID_AQUI",

    ["DAMAGE MULTIPLIER"] = "rbxassetid://ID_AQUI",
    ["MODIFY GUNS"] = "rbxassetid://ID_AQUI",
    ["MESH WEAPON MODIFICATIONS"] = "rbxassetid://ID_AQUI",

    ["BRING"] = "rbxassetid://ID_AQUI",
    ["GRAB"] = "rbxassetid://ID_AQUI",

    ["PERFORMANCE"] = "rbxassetid://ID_AQUI",

    ["PLAYER"] = "rbxassetid://ID_AQUI",
    ["TELEPORT"] = "rbxassetid://ID_AQUI",
    ["GANAR"] = "rbxassetid://ID_AQUI",
    ["MODIFICAR TOOLS"] = "rbxassetid://ID_AQUI",

    ["MOVEMENT SETTINGS"] = "rbxassetid://ID_AQUI",
    ["OP"] = "rbxassetid://ID_AQUI",
    ["ESP VISUAL"] = "rbxassetid://ID_AQUI",

}

--==================================================
-- COLOR DE LOS TÍTULOS GRANDES DERECHOS
--==================================================

local menuTitleColors = {

    ["MAIN"] = Color3.fromRGB(255,255,255),
    ["ESP"] = Color3.fromRGB(170, 0, 255),
    ["ASESINO"] = Color3.fromRGB(255,0,0),
    ["¡DETECTABLES!"] = Color3.fromRGB(255,0,0),
    ["INOCENTE"] = Color3.fromRGB(0,255,0),
    ["SHERIFF"] = Color3.fromRGB(0, 120, 255),
    ["COMBATE"] = Color3.fromRGB(255,0,0),
    ["AUTO"] = Color3.fromRGB(0,255,0),
    ["TELEPORT"] = Color3.fromRGB(0,170,255),
    ["LABELS"] = Color3.fromRGB(255,255,0),
    ["FPS"] = Color3.fromRGB(255,0,255),
    ["YOUTUBE"] = Color3.fromRGB(255,0,0),

}

--==================================================
-- COLOR DEL TEXTO DE LOS MENÚS IZQUIERDOS
--==================================================

local leftMenuTextColors = {

    ["MAIN"] = Color3.fromRGB(255,255,0),
    ["ESP"] = Color3.fromRGB(170, 0, 255),
    ["ASESINO"] = Color3.fromRGB(255,0,0),
    ["INOCENTE"] = Color3.fromRGB(0,255,0),
    ["SHERIFF"] = Color3.fromRGB(0, 120, 255),
    ["TELEPORT"] = Color3.fromRGB(0,170,255),
    ["LABELS"] = Color3.fromRGB(255,255,0),
    ["FPS"] = Color3.fromRGB(255,0,255),
    ["GAMEPASS"] = Color3.fromRGB(255,255,0),
    ["YOUTUBE"] = Color3.fromRGB(255,0,0),

}

--==================================================
-- COLOR DEL TEXTO DE LOS BOTONES DERECHOS
--==================================================

local rightButtonTextColors = {

    ["SPEED"] = Color3.fromRGB(255,255,0),
    ["ESP GUN"] = Color3.fromRGB(255, 255, 0),
    ["JUMPPOWER"] = Color3.fromRGB(0,255,255),
    ["GRAVITY"] = Color3.fromRGB(255,100,100),
    ["FLY"] = Color3.fromRGB(0,255,0),
    ["LOCALPLAYER"] = Color3.fromRGB(255,0,255),

}

--==================================================
-- DESCRIPCIONES
--==================================================

local buttonDescriptions = {

    ["SPEED"] = "Cambia la velocidad del jugador.",
    ["JUMPPOWER"] = "Cambia la fuerza con la que salta el jugador.",
    ["GRAVITY"] = "Modifica la gravedad del jugador.",
    ["FLY"] = "Activa el vuelo del jugador.",
    ["FLY SPEED"] = "Cambia la velocidad de movimiento mientras estás volando.",
    ["INVISIBLE"] = "Hace que tu personaje sea invisible para los demás jugadores.",
    ["DESYINC"] = "Tú ves a tu jugador en una posición diferente, pero los demás no.",
    ["NOCLIP"] = "Permite atravesar paredes y otros objetos.",
    ["LOCALPLAYER"] = "Modifica las opciones relacionadas con tu jugador.",
    ["MAS ESPACIO PARA EMOTES"] = "Tener un total de 8 espacio.",
    ["ESP ULTI"] = "Muestra cuanto tiene de ultime.",
    ["ESP JUGADORES"] = "Dependiendo de su color es su rol.",
    ["NO ESP PARA MI"] = "El ESP no te afecta.",
    ["RESET STATS"] = "Restablece las estadísticas modificadas del jugador.",
    ["QUITAR LOS EFECTOS"] = "Puede causar bugs en el juego.",
    ["BAJAR LOS GRÁFICOS"] = "Baja demasiado los gráficos para tener un buen rendimiento.",
    ["RESET TATS"] = ".",
}

--==================================================
-- CONFIGURACIÓN NUMÉRICA
--==================================================

local numericBoxes = {

    ["SPEED"] = true,
    ["JUMPPOWER"] = true,
    ["GRAVITY"] = true,
    ["RANGE"] = true,
    ["SIZE"] = true,
    ["FLY SPEED"] = true,
    ["TRASPARENCY 0-1"] = true,
    ["FOV SIZE"] = true,
    ["BULLET SIZE"] = true,
    ["1 = 20"] = true,
    ["CAMBIAR FPS"] = true,
    ["DAÑO DE EL DISPARO"] = true,
    ["ESCRIBE EL VALOR QUE QUIERES TENER"] = true,
    ["DAÑO"] = true,
    ["DAÑO EN BLOQUEO"] = true,
    ["FUERZA"] = true,
    ["GANANCIA PARA LA ESPECIAL"] = true,
    ["COOLDOWN DE LA ESPECIAL"] = true,
    ["CHANCE DE LA PASIVA"] = true,

}

--==================================================
-- BOTONES DOBLES
--==================================================

local doubleButtons = {
    ["AUTO ACAR VOLANDO"] = "NOMBRE DE EL JUGADO",
    ["PLAYER NAME"] = "TP TO PLAYER",
}

--==================================================
-- TÍTULOS
--==================================================

local topTitles = {

    ["ROBAR GUN"] = "¡DETECTABLES!",
    ["TP T"] = "TELEPORT",
    ["AUTO GANAR EN LA HABILIDAD Juicio Final"] = "GANAR",
    ["SPEED"] = "PLAYER",

}

local customTitles = {

    ["SPED"] = "MOVEMENT SETTINGS",
    ["TRSPARENCY 0-1"] = "OP",
    ["ESP NAE"] = "ESP VISUAL",

}

--==================================================
-- MULTI BUTTONS
--==================================================

local multiButtons = {

    [""] = {
        options = {

            {
                name = "MODE: BLE",
                variable = "OnlyVisie",
                color = Color3.fromRGB(0,255,0)
            },

            {
                name = "MODE: NO VISIBLE",
                variable = "aim_torso",
                color = Color3.fromRGB(255,0,0)
            },

        }
    },

    ["MODE: NO EQUIPPED KNIFE"] = {
        options = {

            {
                name = "MODE: ONLY EQUIPPED KNIFE",
                variable = "ONLY_EQUIPPED_KNIFE",
                color = Color3.fromRGB(0,255,0)
            },

            {
                name = "MODE: NO EQUIPPED KNIFE",
                variable = "NOU",
                color = Color3.fromRGB(255,0,0)
            },

        }
    },

    ["ESP COLOR"] = {
        options = {

            {
                name = "BLACK",
                variable = "esp_black",
                color = Color3.fromRGB(0,0,0)
            },

            {
                name = "RED",
                variable = "esp_red",
                color = Color3.fromRGB(255,0,0)
            },

            {
                name = "BLUE",
                variable = "esp_blue",
                color = Color3.fromRGB(0,100,255)
            },

        }
    },
}

--==================================================
-- TAMAÑO GLOBAL
--==================================================

local BUTTON_SIZE = UDim2.new(1,-20,0,30)

local BUTTON_OFFSET_X = 10
local BUTTON_GLOBAL_X = 0
local BUTTON_GLOBAL_Y = 0

--==================================================
-- TAMAÑOS PERSONALIZADOS
--==================================================

local BUTTON_CUSTOM = {

    ["DELAY"] = {
        size = UDim2.new(1,-50,0,27),
        x = 20,
        y = -6
    },

    ["NOMBRE DE EL JUGAD"] = {
        size = UDim2.new(1,-50,0,27),
        x = 20,
        y = -6
    },

    ["POWER"] = {
        size = UDim2.new(1,-50,0,27),
        x = 20,
        y = -6
    },

    ["COLOR OF THE ESP"] = {
        size = UDim2.new(1,-50,0,27),
        x = 20,
        y = -6
    },

    ["BULLET SIZE."] = {
        size = UDim2.new(1,-50,0,27),
        x = 20,
        y = -6
    },

    ["TRASPARENCY 0-"] = {
        size = UDim2.new(1,-50,0,27),
        x = 20,
        y = -9
    },

}

--==================================================
-- TÍTULOS DE BOTONES
--==================================================

local buttonTitles = {

    ["AUTO DISPARAR (EQUIPAR MINIGUN"] = "ARMA",
    ["KILL AURA (EQUIPAR BATON)"] = "BATON",
    ["JUMP(BUTTON)"] = "JUMP PAD",
    ["EXPANDIR HITBOX"] = "HITBOX",

    ["ACTIVAR CONFIGURACIÓN"] = "CONFIGURAR TOOLS",
    ["AUTO RECOLECTAR DINERO (RAPIDO)"] = "RECOLECCIÓN",

    ["TP A MUNDO 2"] = "MUNDOS",
    ["TP TOOL"] = "CLICK",
    ["NOMBRE DE EL JUGADOR"] = "JUGADORES",

    ["AUTO SACAR VOLANDO A TODOS"] = "FLING",
    ["AUTO MATAR A T"] = "KILL",
    ["LAG SERVER (EQUIPAR BOMBA)"] = "SERVER",

    ["PLAYER NA"] = "FLING",
    ["TOUCH FLING"] = "TOUCH",
    ["ESP ENEMIES"] = "ENEMIES",
    ["ESP PLAYERS + NAME + DISTANCE"] = "PLAYERS",

    ["AUTO EAT"] = "EAT",
    ["SELF-HEALING"] = "HEALTH",

    ["AUTO KILL ENEMIES"] = "KILL",
    ["MULTIPLY DAMAGE"] = "DAMAGE MULTIPLIER",
    ["INFINITY AMMO"] = "MODIFY GUNS",
    ["INSTANT SWING"] = "MESH WEAPON MODIFICATIONS",

    ["NAME OF THE ITEM"] = "BRING",
    ["NAME OF THE ITEM."] = "GRAB",

    ["Fps Boost"] = "PERFORMANCE",

}

--==================================================
-- TOGGLES ROJOS
--==================================================

local redToggleButtons = {
    ["X-RAY"] = true,
    ["BULLET TRACERS"] = true,
}

getgenv().SBS_BUTTON_STATES =
    getgenv().SBS_BUTTON_STATES or {}

local buttonStates =
    getgenv().SBS_BUTTON_STATES

--==================================================
-- BOTONES SIN TOGGLE
--==================================================

local noToggleButtons = {

    ["YOUTUBE:SBS HUB"] = true,
    ["SUSCRIBETE:)"] = true,
    ["OBTENER TODAS LAS TOOLS"] = true,
    ["LOCALPLAYER"] = true,
    ["RESET STATS"] = true,
    ["DESNC"] = true,
    ["Fps Boost"] = true,
    ["REVIVIR"] = true,
    ["AUTO FARMEAR DINERO"] = true,
    ["ESTAR EN LA ETAPA 99.900M"] = true,
    ["COMPLETAR OBBY"] = true,
    ["SER GUARDIA"] = true,
    ["SER PRISIONERO"] = true,
    ["PARAR EL TIEMPO"] = true,
    ["TP A MUNDO 2"] = true,
    ["OBTENER SHIFTLOCK"] = true,
    ["TP A JUGADOR"] = true,
    ["MULTI SALTOS INFINITOS"] = true,
    ["ROBAR GUN"] = true,
    ["AGARRAR GUN"] = true,
    ["TP TO PLAYER"] = true,
    ["FLING PLAYER"] = true,
    ["MATAR SHERIFF"] = true,
    ["MATAR JUGADOR"] = true,
    ["MATAR A TODOS"] = true,
    ["BAJAR LOS GRÁFICOS"] = true,
    ["QUITAR LOS EFECTOS"] = true,

}

local noGreenFlash = {
    ["SUSCRIBETE:)"] = true
}

--==================================================
-- TEXTBOX
--==================================================

local textboxButtons = {

    ["SPEED"] = {
        variable = "SPEED",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Speed/refs/heads/main/Speed.lua"
    },

    ["BULLET SPEED"] = {
        variable = "BULLET_SPEED",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Text397/refs/heads/main/Text397.lua"
    },

    ["BULLETSPERSHOT"] = {
        variable = "BULLETS_PER_SHOT",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Text398/refs/heads/main/Text398.lua"
    },

    ["JUMPPOWER"] = {
        variable = "JUMP",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/JumpPower/refs/heads/main/JumpPower.lua"
    },

    ["GRAVITY"] = {
        variable = "GRAVITY",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Gravity/refs/heads/main/Gravity.lua"
    },

    ["ESCRIBE LA ETAPA QUE QUIERAS IR"] = {
        variable = "StageNumber",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Text66/refs/heads/main/Text66.lua"
    },

    ["FLY SPEED"] = {
        variable = "FLY_SPEED",
        url = nil
    },

    ["TAMAÑO"] = {
        variable = "HITBOX_SIZE",
        url = nil
    },

    ["TRANSPARENCIA 0-1"] = {
        variable = "HITBOX_TRANSPARENCY",
        url = nil
    },

    ["NOMBRE DE EL JUGADOR"] = {
        variable = "PLAYER",
        url = nil
    },

    ["ESCRIBE EL VALOR QUE QUIERES TENER"] = {
        variable = "Veces",
        url = nil
    },

    ["TIEMPO DE RECARGA"] = {
        variable = "FoodZookaSettings.ReloadTime",
        url = nil
    },

    ["FUERZA DE EL DISPARO"] = {
        variable = "FoodZookaSettings.Force",
        url = nil
    },

    ["VELOCIDAD DE EL DISPARO"] = {
        variable = "FoodZookaSettings.BulletSpeed",
        url = nil
    },

    ["NOMBRE DE EL JUGADOR_"] = {
        variable = "TargetPlayer2",
        url = nil
    },

    ["DAÑO DE EL DISPARO"] = {
        variable = "FoodZookaSettings.Damage",
        url = nil
    },

    ["DAÑO"] = {
        variable = "Damage",
        url = nil
    },

    ["DAÑO POR DEFECTO"] = {
        variable = "DefaultDamage",
        url = nil
    },

    ["DAÑO EN BLOQUEO"] = {
        variable = "BlockDamage",
        url = nil
    },

    ["FUERZA"] = {
        variable = "Force",
        url = nil
    },

    ["CHANCE DE LA PASIVA"] = {
        variable = "PassivaChance",
        url = nil
    },

    ["DISTANCIA DE LA DETECCIÓN DE M1"] = {
        variable = "Distance",
        url = nil
    },

    ["DISTANCIA DE LA DETECCIÓN DEL M1"] = {
        variable = "AUTO_F_DISTANCE",
        url = nil
    },

    ["GANANCIA PARA LA ESPECIAL"] = {
        variable = "SpecialBuildup",
        url = nil
    },

    ["ELIGIR JUGADOR"] = {
        variable = "TARGET",
        url = nil
    },

    ["PLAYER NAME."] = {
        variable = "TargetPlayerName",
        url = nil
    },

    ["FOV SIZE"] = {
        variable = "AIMBOT_FOV",
        url = nil
    },

    ["RANGO"] = {
        variable = "HitRadius",
        url = nil
    },

    ["XRAY-TRANSPY"] = {
        variable = "XRAY_TRANSPARENCY",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Text433/refs/heads/main/Text433.lua"
    },

    ["CAMBIAR FPS"] = {
        variable = "FPS",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Cambiar_FPS/refs/heads/main/.lua"
    },

    ["POWER"] = {
        variable = "TouchFlingForce",
        url = nil
    },

}

--==================================================
-- BORRAR GUI ANTERIOR
--==================================================

local old =
    PlayerGui:FindFirstChild("SBS_HUB")

if old then
    old:Destroy()
end

screenGui.Name = "SBS_HUB"
screenGui.ResetOnSpawn = false

--==================================================
-- MAIN FRAME
--==================================================

local mainFrame =
    Instance.new("Frame",screenGui)

mainFrame.Size =
    UDim2.new(0,500,0,350)

mainFrame.Position =
    UDim2.new(0.5,-250,0.5,-175)

mainFrame.BackgroundColor3 =
    Color3.fromRGB(0,0,0)

mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = false

--==================================================
-- BORDE
--==================================================

local stroke =
    Instance.new("UIStroke",mainFrame)

stroke.Color =
    Color3.fromRGB(255,255,255)

stroke.Thickness = 2

--==================================================
-- RESIZE
--==================================================

local resizeCorner =
    Instance.new("Frame",mainFrame)

resizeCorner.Size =
    UDim2.new(0,20,0,20)

resizeCorner.Position =
    UDim2.new(1,-20,1,-20)

resizeCorner.BackgroundColor3 =
    Color3.fromRGB(255,255,255)

resizeCorner.BackgroundTransparency = 0.5
resizeCorner.BorderSizePixel = 0
resizeCorner.ZIndex = 10

do

    local dragging = false
    local dragStart
    local startSize

    resizeCorner.InputBegan:Connect(function(input)

        if input.UserInputType ==
            Enum.UserInputType.MouseButton1
        or input.UserInputType ==
            Enum.UserInputType.Touch then

            dragging = true
            dragStart = input.Position

            startSize =
                Vector2.new(
                    mainFrame.AbsoluteSize.X,
                    mainFrame.AbsoluteSize.Y
                )

            input.Changed:Connect(function()

                if input.UserInputState ==
                    Enum.UserInputState.End then

                    dragging = false

                end

            end)

        end

    end)

    UserInputService.InputChanged:Connect(function(input)

        if dragging
        and (
            input.UserInputType ==
                Enum.UserInputType.MouseMovement
            or input.UserInputType ==
                Enum.UserInputType.Touch
        ) then

            local delta =
                input.Position - dragStart

            local newWidth =
                math.max(
                    300,
                    startSize.X + delta.X
                )

            local newHeight =
                math.max(
                    200,
                    startSize.Y + delta.Y
                )

            mainFrame.Size =
                UDim2.new(
                    0,newWidth,
                    0,newHeight
                )

        end

    end)

end

--==================================================
-- DRAG MAIN
--==================================================

do

    local dragging = false
    local dragStart
    local startPos
    local dragInput

    local function update(input)

        local delta =
            input.Position - dragStart

        mainFrame.Position =
            UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )

    end

    mainFrame.InputBegan:Connect(function(input)

        if input.UserInputType ==
            Enum.UserInputType.MouseButton1
        or input.UserInputType ==
            Enum.UserInputType.Touch then

            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position

            input.Changed:Connect(function()

                if input.UserInputState ==
                    Enum.UserInputState.End then

                    dragging = false

                end

            end)

        end

    end)

    mainFrame.InputChanged:Connect(function(input)

        if input.UserInputType ==
            Enum.UserInputType.MouseMovement
        or input.UserInputType ==
            Enum.UserInputType.Touch then

            dragInput = input

        end

    end)

    UserInputService.InputChanged:Connect(function(input)

        if input == dragInput
        and dragging then

            update(input)

        end

    end)

end

--==================================================
-- TITULO
--==================================================

local title =
    Instance.new("TextLabel",mainFrame)

title.Size =
    UDim2.new(1,0,0,50)

title.BackgroundColor3 =
    Color3.fromRGB(0,0,0)

title.Text =
    "SBS HUB | HYPER SPEED RUNNER"

title.TextColor3 =
    Color3.fromRGB(255,255,255)

title.Font =
    Enum.Font.GothamBold

title.TextScaled = true

--==================================================
-- LINEA
--==================================================

local line =
    Instance.new("Frame",mainFrame)

line.Size =
    UDim2.new(1,0,0,2)

line.Position =
    UDim2.new(0,0,0,50)

line.BackgroundColor3 =
    Color3.fromRGB(255,255,255)

line.BorderSizePixel = 0

--==================================================
-- LEFT
--==================================================

local leftFrame =
    Instance.new("ScrollingFrame",mainFrame)

leftFrame.Size =
    UDim2.new(0,150,1,-52)

leftFrame.Position =
    UDim2.new(0,0,0,52)

leftFrame.BackgroundColor3 =
    Color3.fromRGB(0,0,0)

leftFrame.BorderSizePixel = 0

leftFrame.ScrollBarThickness = 5

leftFrame.AutomaticCanvasSize =
    Enum.AutomaticSize.Y

--==================================================
-- RIGHT
--==================================================

local rightFrame =
    Instance.new("ScrollingFrame",mainFrame)

rightFrame.Size =
    UDim2.new(1,-150,1,-52)

rightFrame.Position =
    UDim2.new(0,150,0,52)

rightFrame.BackgroundColor3 =
    Color3.fromRGB(0,0,0)

rightFrame.BorderSizePixel = 0

rightFrame.ScrollBarThickness = 5

rightFrame.AutomaticCanvasSize =
    Enum.AutomaticSize.Y

--==================================================
-- LINEA CENTRAL
--==================================================

local midLine =
    Instance.new("Frame",mainFrame)

midLine.Size =
    UDim2.new(0,2,1,-52)

midLine.Position =
    UDim2.new(0,150,0,52)

midLine.BackgroundColor3 =
    Color3.fromRGB(255,255,255)

midLine.BorderSizePixel = 0

--==================================================
-- PADDING
--==================================================

local padding =
    Instance.new("UIPadding",rightFrame)

padding.PaddingBottom =
    UDim.new(0,50)

--==================================================
-- BOTÓN IZQUIERDO
--==================================================

local currentMenuButton = nil

local function createMenuButton(parent,text,y,callback)

    local b =
        Instance.new("TextButton",parent)

    b.Size =
        UDim2.new(1,-20,0,30)

    b.Position =
        UDim2.new(0,10,0,y)

    b.Text =
        text

    b.BackgroundColor3 =
        Color3.fromRGB(15,15,15)

    b.BorderSizePixel = 0

    --==================================================
    -- BORDE NEGRO
    --==================================================

    local border =
        Instance.new("UIStroke")

    border.Name =
        "ButtonBorder"

    border.ApplyStrokeMode =
        Enum.ApplyStrokeMode.Border

    border.Color =
        Color3.fromRGB(0,0,0)

    border.Thickness = 1

    border.Parent = b

    --==================================================
    -- COLOR DEL TEXTO
    --==================================================

    local configuredColor =
        leftMenuTextColors[text]

    b.TextColor3 =
        configuredColor
        or Color3.fromRGB(255,255,255)

    b.Font =
        Enum.Font.GothamBold

    b.TextSize = 14

    --==================================================
    -- BRILLO DEL TEXTO
    --==================================================

    local textGlow =
        Instance.new("UIStroke")

    textGlow.Name =
        "TextGlow"

    textGlow.ApplyStrokeMode =
        Enum.ApplyStrokeMode.Contextual

    textGlow.Thickness = 1.5

    textGlow.Transparency = 0.2

    textGlow.Color = Color3.fromRGB(0,0,0)
    -- PONER ESTO SI QUIERES QUE LOS BORDES SEAN DEL COLOR DEO TEXTO
    -- configuredColor
    --   or Color3.fromRGB(255,255,255)

    textGlow.Parent = b

    --==================================================
    -- ICONO DEL MENÚ
    --==================================================

    local iconId =
        leftMenuIcons[text]

    if iconId then

        local icon =
            Instance.new("ImageLabel")

        icon.Name =
            "MenuIcon"

        icon.Parent = b

        icon.Size =
            UDim2.new(0,22,0,22)

        local position =
            iconPositions[text]
            or "RIGHT"

        if position == "LEFT" then

            icon.Position =
                UDim2.new(
                    0,5,
                    0.5,-11
                )

        else

            icon.Position =
                UDim2.new(
                    1,-27,
                    0.5,-11
                )

        end

        icon.BackgroundTransparency = 1

        icon.Image =
            iconId

        icon.ScaleType =
            Enum.ScaleType.Fit

        icon.ZIndex =
            b.ZIndex + 1

    end

    --==================================================
    -- CLICK
    --==================================================

    b.MouseButton1Click:Connect(function()

        -- RESTAURAR ANTERIOR

        if currentMenuButton
        and currentMenuButton ~= b then

            currentMenuButton.BackgroundColor3 =
                Color3.fromRGB(15,15,15)

            local oldColor =
                leftMenuTextColors[
                    currentMenuButton.Text
                ]

            currentMenuButton.TextColor3 =
                oldColor
                or Color3.fromRGB(255,255,255)

            local oldGlow =
                currentMenuButton:FindFirstChild(
                    "TextGlow"
                )

        end

        --==================================================
        -- SELECCIONADO
        --==================================================

        if configuredColor then

            b.BackgroundColor3 =
                Color3.fromRGB(255,255,255)

            b.TextColor3 =
                configuredColor

        else

            b.BackgroundColor3 =
                Color3.fromRGB(0,0,0)

            b.TextColor3 =
                Color3.fromRGB(255,255,255)

        end

        currentMenuButton = b

        callback()

    end)

end

--==================================================
-- ALTURA DE DESCRIPCIÓN
--==================================================

local function getDescriptionHeight(text)

    if not text or text == "" then
        return 0
    end

    local width =
        math.max(
            100,
            rightFrame.AbsoluteSize.X - 30
        )

    local result =
        TextService:GetTextSize(
            text,
            10,
            Enum.Font.Gotham,
            Vector2.new(width,1000)
        )

    return math.max(
        15,
        result.Y
    )

end

--==================================================
-- CREAR SLIDER REUTILIZABLE (PC + MÓVIL)
--==================================================

local function createSlider(parent, y, settings)

    settings = settings or sliderSettings

    local minimum = tonumber(settings.min) or 0
    local maximum = tonumber(settings.max) or 100
    local step = math.max(tonumber(settings.step) or 1, 0.000001)
    if maximum < minimum then
        minimum, maximum = maximum, minimum
    end

    local value = tonumber(getgenv()[settings.variable])
        or tonumber(settings.default)
        or minimum
    value = math.clamp(value, minimum, maximum)

    local container = Instance.new("Frame")
    container.Name = "SliderContainer"
    container.Parent = parent
    container.Position = UDim2.new(0, 10, 0, y)
    container.Size = UDim2.new(1, -20, 0, 46)
    container.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    container.BorderSizePixel = 0

    local label = Instance.new("TextLabel")
    label.Name = "SliderLabel"
    label.Parent = container
    label.Position = UDim2.new(0, 8, 0, 2)
    label.Size = UDim2.new(1, -16, 0, 18)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.GothamBold
    label.TextSize = 13
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextXAlignment = Enum.TextXAlignment.Left

    local track = Instance.new("TextButton")
    track.Name = "SliderTrack"
    track.Parent = container
    track.Position = UDim2.new(0, 8, 0, 27)
    track.Size = UDim2.new(1, -16, 0, 8)
    track.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    track.BorderSizePixel = 0
    track.Text = ""
    track.AutoButtonColor = false
    track.Active = true

    local fill = Instance.new("Frame")
    fill.Name = "SliderFill"
    fill.Parent = track
    fill.Size = UDim2.new(0, 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    fill.BorderSizePixel = 0

    local knob = Instance.new("Frame")
    knob.Name = "SliderKnob"
    knob.Parent = track
    knob.AnchorPoint = Vector2.new(0.5, 0.5)
    knob.Position = UDim2.new(0, 0, 0.5, 0)
    knob.Size = UDim2.new(0, 14, 0, 14)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.BorderSizePixel = 0

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = knob

    local dragging = false
    local activeInput = nil

    local function updateLabelAndPosition(newValue)
        newValue = math.clamp(newValue, minimum, maximum)
        newValue = minimum + math.floor(((newValue - minimum) / step) + 0.5) * step
        newValue = math.clamp(newValue, minimum, maximum)
        value = newValue

        local range = maximum - minimum
        local alpha = range > 0 and ((value - minimum) / range) or 0
        label.Text = tostring(settings.name or "VALOR") .. " " .. tostring(value)
        fill.Size = UDim2.new(alpha, 0, 1, 0)
        knob.Position = UDim2.new(alpha, 0, 0.5, 0)

        if settings.variable then
            getgenv()[settings.variable] = value
        end
    end

    local function updateFromInput(input)
        local width = track.AbsoluteSize.X
        if width <= 0 then return end

        local relativeX = math.clamp(
            input.Position.X - track.AbsolutePosition.X,
            0,
            width
        )
        local alpha = relativeX / width
        updateLabelAndPosition(minimum + (maximum - minimum) * alpha)
    end

    local function beginDrag(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            activeInput = input
            updateFromInput(input)
        end
    end

    track.InputBegan:Connect(beginDrag)
    knob.InputBegan:Connect(beginDrag)

    UserInputService.InputChanged:Connect(function(input)
        if not dragging then return end

        if input.UserInputType == Enum.UserInputType.MouseMovement then
            updateFromInput(input)
        elseif input == activeInput then
            updateFromInput(input)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input == activeInput
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
            activeInput = nil
        end
    end)

    updateLabelAndPosition(value)
    return container
end

--==================================================
-- CREAR BOTÓN DERECHO
--==================================================

local function createButton(parent,text,y,callback)

    local hasTextbox =
        textboxButtons[text] ~= nil

    local multiConfig =
        multiButtons[text]

    local sliderConfig = sliderSettings[text]

if sliderConfig then
    createSlider(parent, y, {
        name = text,
        variable = sliderConfig.variable,
        min = sliderConfig.min,
        max = sliderConfig.max,
        default = sliderConfig.default,
        step = sliderConfig.step
    })
    return
    end

    local container =
        Instance.new("Frame",parent)

    container.BackgroundTransparency = 1

    container.Position =
        UDim2.new(0,10,0,y)

    container.Size =
        UDim2.new(1,-20,0,30)

    --==================================================
    -- MULTI
    --==================================================

    if multiConfig then

        local button =
            Instance.new("TextButton",container)

        button.Size =
            UDim2.new(1,0,1,0)

        button.BackgroundColor3 =
            Color3.fromRGB(20,20,20)

        button.BorderSizePixel = 0

        button.Text = ""

        local label =
            Instance.new("TextLabel",button)

        label.Size =
            UDim2.new(1,0,1,0)

        label.BackgroundTransparency = 1

        label.Font =
            Enum.Font.GothamBold

        label.TextSize = 14

        getgenv().SBS_MULTI =
            getgenv().SBS_MULTI or {}

        local index =
            getgenv().SBS_MULTI[text] or 0

        local options =
            multiConfig.options

        local function update()

            if index == 0 then

                label.Text =
                    text

                label.TextColor3 =
                    rightButtonTextColors[text]
                    or Color3.fromRGB(
                        255,255,255
                    )

            else

                local option =
                    options[index]

                label.Text =
                    option.name

                label.TextColor3 =
                    option.color

                for _,v in ipairs(options) do

                    if v.variable then
                        getgenv()[v.variable] = false
                    end

                end

                if option.variable then
                    getgenv()[option.variable] = true
                end

            end

        end

        update()

        button.MouseButton1Click:Connect(function()

            index += 1

            if index > #options then
                index = 1
            end

            getgenv().SBS_MULTI[text] =
                index

            update()

        end)

        return
    end

    --==================================================
    -- TEXTBOX
    --==================================================

    if hasTextbox then

        local box =
            Instance.new("TextBox",container)

        box.Size =
            UDim2.new(1,0,1,0)

        box.BackgroundColor3 =
            Color3.fromRGB(20,20,20)

        box.BorderSizePixel = 0

        box.PlaceholderText =
            text

        box.Text = ""

        box.TextColor3 =
            rightButtonTextColors[text]
            or Color3.fromRGB(255,255,255)

        box.Font =
            Enum.Font.GothamBold

        box.TextSize = 14

        local data =
            textboxButtons[text]

        box:GetPropertyChangedSignal(
            "Text"
        ):Connect(function()

            if numericBoxes[text] then

                box.Text =
                    box.Text:gsub(
                        "[^%d%.%-]",
                        ""
                    )

            end

        end)

        box.FocusLost:Connect(function()

            if box.Text == "" then
                return
            end

            local value

            if numericBoxes[text] then

                value =
                    tonumber(box.Text)

                if not value then
                    return
                end

            else

                value =
                    box.Text

            end

            getgenv()[data.variable] =
                value

            if data.url then

                pcall(function()

                    loadstring(
                        game:HttpGet(
                            data.url
                        )
                    )()

                end)

            end

        end)

    else

        --==================================================
        -- BOTÓN NORMAL
        --==================================================

        local button =
            Instance.new(
                "TextButton",
                container
            )

        button.Size =
            UDim2.new(1,0,1,0)

        button.Text =
            text

        button.BackgroundColor3 =
            Color3.fromRGB(20,20,20)

        button.BorderSizePixel = 0

        button.TextColor3 =
            rightButtonTextColors[text]
            or Color3.fromRGB(
                255,255,255
            )

        button.Font =
            Enum.Font.GothamBold

        button.TextSize = 14

        --==================================================
        -- TOGGLE
        --==================================================

        local isToggle =
            not noToggleButtons[text]

        if isToggle then

            if buttonStates[text] == nil then
                buttonStates[text] = false
            end

            local function update()

                if buttonStates[text] then

                    button.Text =
                        text.." [ON]"

                    if redToggleButtons[text] then

                        button.BackgroundColor3 =
                            Color3.fromRGB(
                                120,0,0
                            )

                    else

                        button.BackgroundColor3 =
                            Color3.fromRGB(
                                0,120,0
                            )

                    end

                else

                    button.Text =
                        text.." [OFF]"

                    button.BackgroundColor3 =
                        Color3.fromRGB(
                            20,20,20
                        )

                end

                button.TextColor3 =
                    rightButtonTextColors[text]
                    or Color3.fromRGB(
                        255,255,255
                    )

            end

            update()

            button.MouseButton1Click:Connect(function()

                buttonStates[text] =
                    not buttonStates[text]

                update()

                if callback then
                    callback(
                        buttonStates[text]
                    )
                end

            end)

        else

            button.MouseButton1Click:Connect(function()

                if not noGreenFlash[text] then

                    local oldColor =
                        button.BackgroundColor3

                    button.BackgroundColor3 =
                        Color3.fromRGB(
                            0,120,0
                        )

                    task.delay(
                        0.4,
                        function()

                            if button then

                                button.BackgroundColor3 =
                                    oldColor

                            end

                        end
                    )

                end

                if callback then
                    callback()
                end

            end)

        end

    end

end

--==================================================
-- MENÚ
--==================================================

local menuOrder = {
    "MAIN",
    "ESP",
    "INOCENTE",
    "SHERIFF",
    "ASESINO",
    "TELEPORT",
    "FARM",
    "LABELS",
    "FPS"
}

local menuData = {

    ["MAIN"] = {

        "INVISIBLE",
        "DESYNC",
        "OBTENER SHIFTLOCK",
        "SPEED",
        "JUMPPOWER",
        "GRAVITY",
        "RESET STATS",
        "INFINITI JUMP",
        "NOCLIP",
        "FLY SPEED",
        "FLY",

    },

    ["ESP"] = {
        "ESP JUGADORES",
        "ESP NOMBRE",
        "NO ESP PARA MI",
        "ESP GUN", 
        "XRAY",
        "TRANSPARENCIA",
    },

    ["GAMEPASS"] = {

        "MAS ESPACIO PARA EMOTES",
        "VALOR",

    },

    ["INOCENTE"] = {
        "AGARRAR GUN",
        "AUTO AGARRAR GUN",
        "ROBAR GUN",
        "AUTO ROBAR GUN", 

    },

    ["ASESINO"] = {
        "MATAR A TODOS",
        "AUTO MATAR A TODOS",
        "MATAR SHERIFF",
        "AUTO MATAR SHERIFF",
        "MATAR JUGADOR",
        "ELIGIR JUGADOR",

    },

    ["TELEPORT"] = {

        "TP TOOL",
        "NOMBRE DE EL JUGADOR",
        "TP A JUGADOR",

    },

    ["LABELS"] = {
        "CONTADOR DE PING",
        "CONTADOR DE FPS",
        "INDICADOR DE QUIEN ES SHERIFF",
        "INDICADOR DE QUIEN ES ASESINO",
        "ALERTA CUANDO APARECE LA GUN",

    },

    ["FPS"] = {
        "BAJAR LOS GRÁFICOS",
        "CAMBIAR FPS",

    },

}

--==================================================
-- LIMPIAR DERECHO
--==================================================

local function clearFrame(frame)

    for _,v in ipairs(frame:GetChildren()) do

        if v:IsA("GuiObject")
        and not v:IsA("UIPadding") then

            v:Destroy()

        end

    end

end

--==================================================
-- CREAR MENÚS
--==================================================

for i,menu in ipairs(menuOrder) do

    createMenuButton(
        leftFrame,
        menu,
        10 + ((i-1)*35),
        function()

            -- REINICIAR SCROLL
            rightFrame.CanvasPosition =
                Vector2.new(0,0)

            clearFrame(rightFrame)

            --==================================================
            -- TÍTULO GRANDE
            --==================================================

            local titleLabel =
                Instance.new(
                    "TextLabel",
                    rightFrame
                )

            titleLabel.Size =
                UDim2.new(1,0,0,30)

            titleLabel.Position =
                UDim2.new(0,0,0,5)

            titleLabel.BackgroundTransparency = 1

            titleLabel.Text =
                menuNames[menu] or menu

            titleLabel.TextColor3 =
                menuTitleColors[menu]
                or Color3.fromRGB(
                    255,255,255
                )

            titleLabel.Font =
                Enum.Font.GothamBold

            titleLabel.TextSize = 18

            titleLabel.TextXAlignment =
                Enum.TextXAlignment.Center

            --==================================================
            -- ICONO DEL TÍTULO GRANDE
            --==================================================

            local titleIconId =
                rightTitleIcons[
                    menuNames[menu] or menu
                ]

            if titleIconId then

                local titleIcon =
                    Instance.new("ImageLabel")

                titleIcon.Name =
                    "TitleIcon"

                titleIcon.Parent =
                    titleLabel

                titleIcon.Size =
                    UDim2.new(0,22,0,22)

                titleIcon.Position =
                    UDim2.new(
                        1,-30,
                        0.5,-11
                    )

                titleIcon.BackgroundTransparency =
                    1

                titleIcon.Image =
                    titleIconId

                titleIcon.ScaleType =
                    Enum.ScaleType.Fit

            end

            local oy = 40

            for _,opt in ipairs(
                menuData[menu] or {}
            ) do

                --==================================================
                -- TITULO / SUBTÍTULO
                --==================================================

                if buttonTitles[opt] then

                    local section =
                        Instance.new(
                            "TextLabel",
                            rightFrame
                        )

                    section.Size =
                        UDim2.new(
                            1,-20,
                            0,25
                        )

                    section.Position =
                        UDim2.new(
                            0,10,
                            0,oy
                        )

                    section.BackgroundTransparency = 1

                    section.Text =
                        buttonTitles[opt]

                    section.TextColor3 =
                        Color3.fromRGB(
                            200,200,200
                        )

                    section.Font =
                        Enum.Font.GothamBold

                    section.TextSize = 14

                    section.TextXAlignment =
                        Enum.TextXAlignment.Left

                    --==================================================
                    -- ICONO DEL SUBTÍTULO
                    --==================================================

                    local subtitleIconId =
                        rightSubtitleIcons[
                            buttonTitles[opt]
                        ]

                    if subtitleIconId then

                        local subtitleIcon =
                            Instance.new("ImageLabel")

                        subtitleIcon.Name =
                            "SubtitleIcon"

                        subtitleIcon.Parent =
                            section

                        subtitleIcon.Size =
                            UDim2.new(
                                0,18,
                                0,18
                            )

                        subtitleIcon.Position =
                            UDim2.new(
                                1,-20,
                                0.5,-9
                            )

                        subtitleIcon.BackgroundTransparency =
                            1

                        subtitleIcon.Image =
                            subtitleIconId

                        subtitleIcon.ScaleType =
                            Enum.ScaleType.Fit

                    end

                    oy += 28

                end

                --==================================================
                -- TITULO SUPERIOR
                --==================================================

                if topTitles[opt] then

                    local section =
                        Instance.new(
                            "TextLabel",
                            rightFrame
                        )

                    section.Size =
                        UDim2.new(
                            1,-20,
                            0,25
                        )

                    section.Position =
                        UDim2.new(
                            0,10,
                            0,oy
                        )

                    section.BackgroundTransparency = 1

                    section.Text =
                        topTitles[opt]

                    section.TextColor3 =
                        Color3.fromRGB(
                            255,255,255
                        )

                    section.Font =
                        Enum.Font.GothamBold

                    section.TextSize = 16

                    section.TextXAlignment =
                        Enum.TextXAlignment.Left

                    --==================================================
                    -- ICONO
                    --==================================================

                    local subtitleIconId =
                        rightSubtitleIcons[
                            topTitles[opt]
                        ]

                    if subtitleIconId then

                        local subtitleIcon =
                            Instance.new("ImageLabel")

                        subtitleIcon.Name =
                            "SubtitleIcon"

                        subtitleIcon.Parent =
                            section

                        subtitleIcon.Size =
                            UDim2.new(
                                0,18,
                                0,18
                            )

                        subtitleIcon.Position =
                            UDim2.new(
                                1,-20,
                                0.5,-9
                            )

                        subtitleIcon.BackgroundTransparency =
                            1

                        subtitleIcon.Image =
                            subtitleIconId

                        subtitleIcon.ScaleType =
                            Enum.ScaleType.Fit

                    end

                    oy += 28

                end

                --==================================================
                -- BOTÓN
                --==================================================

                createButton(
                    rightFrame,
                    opt,
                    oy,
                    function(state)

                        if opt ==
                            "RESET STATS" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Reset-speed-jumpPower-y-gravedad-/refs/heads/main/Reset.lua"))()
                            end)

                        elseif opt ==
                            "ESP JUGADORES" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text154/refs/heads/main/Text154.lua"))()
                            end)

                        elseif opt ==
                            "NO ESP PARA MI" then

                            pcall(function()
                                loadstring("getgenv().HIGHLIGHT_ME = not getgenv().HIGHLIGHT_ME")()
                            end)

                        elseif opt ==
                            "ESP GUN" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text510/refs/heads/main/Text510.lua"))()
                            end)

                        elseif opt ==
                            "ESP NOMBRE" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text509/refs/heads/main/Text509.lua"))()
                            end)

                        elseif opt ==
                            "CONTADOR DE PING" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Detector_ping/refs/heads/main/Ping.lua"))()
                            end)

                        elseif opt ==
                            "CONTADOR DE FPS" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Detectar_fps/refs/heads/main/Fps.lua"))()
                            end)

                        elseif opt ==
                            "MATAR SHERIFF" then

                            pcall(function()
                                getgenv().TARGET = "Sheriff"
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text16/refs/heads/main/Text16.lua"))()
                            end)

                        elseif opt ==
                            "MATAR A TODOS" then

                            pcall(function()
                                getgenv().TARGET = "All"
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text16/refs/heads/main/Text16.lua"))()
                            end)

                        elseif opt ==
                            "MATAR JUGADOR" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text511/refs/heads/main/Text511.lua"))()
                            end)

                        elseif opt ==
                            "DESYNC" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text428/refs/heads/main/Text428.lua"))()
                            end)

                        elseif opt ==
                            "QUITAR LOS EFECTOS" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text508/refs/heads/main/Text508.lua"))()
                            end)

                        elseif opt ==
                            "LAG SERVER (EQUIPAR BOMBA)" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text470/refs/heads/main/Text470.lua"))()
                            end)

                        elseif opt ==
                            "ESTAR EN LA ETAPA 99.900M" then

                            getgenv().StageNumber =
                                99999000000

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text66/refs/heads/main/Text66.lua"))()
                            end)

                        elseif opt ==
                            "PARAR EL TIEMPO" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text471/refs/heads/main/Text471.lua"))()
                            end)

                        elseif opt ==
                            "SER GUARDIA" then

                            getgenv().StageNumber = 21

                            pcall(function()

                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text66/refs/heads/main/Text66.lua"))()

                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text67/refs/heads/main/Text67.lua"))()

                            end)

                        elseif opt ==
                            "SER PRISIONERO" then

                            getgenv().StageNumber = 1

                            pcall(function()

                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Reset_Player/refs/heads/main/Reset.lua"))()

                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text66/refs/heads/main/Text66.lua"))()

                            end)

                        elseif opt ==
                            "ESP A JUGADORES" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text473/refs/heads/main/Text473.lua"))()
                            end)

                        elseif opt ==
                            "ESP A BARRY" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text474/refs/heads/main/Text474.lua"))()
                            end)

                        elseif opt ==
                            "AUTO ARRESTAR" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text56/refs/heads/main/Text56.lua"))()
                            end)

                        elseif opt ==
                            "SER FUERTE" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text475/refs/heads/main/Text475.lua"))()
                            end)

                        elseif opt ==
                            "COCINAR GENTE (BOTON)" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text476/refs/heads/main/Text476.lua"))()
                            end)

                        elseif opt ==
                            "OBTENER SHIFTLOCK" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Shift-lock/refs/heads/main/Shift_Lock_.lua"))()
                            end)

                        elseif opt ==
                            "FLING PLAYER" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text156/refs/heads/main/Text156.lua"))()
                            end)

                        elseif opt ==
                            "QUITAR LAS PAREDES INVISIBLES" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text365/refs/heads/main/Text365.lua"))()
                            end)

                        elseif opt ==
                            "AIMBOT TOTAL" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text93/refs/heads/main/Text93.lua"))()
                            end)

                        elseif opt ==
                            "XRAY" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text147/refs/heads/main/Text147.lua"))()
                            end)

                        elseif opt ==
                            "TP TO PLAYER" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text408/refs/heads/main/Text408.lua"))()
                            end)

                        elseif opt ==
                            "AIMBOT LIGERO" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text422/refs/heads/main/Text422.lua"))()
                            end)

                        elseif opt ==
                            "FLY" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Fly/refs/heads/main/Fly.lua"))()
                            end)

                        elseif opt ==
                            "INFINITI JUMP" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/INFINITI-JUMP/refs/heads/main/Salto%20infinito.lua"))()
                            end)

                        elseif opt ==
                            "SHOOT THE MURDERER" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text314/refs/heads/main/Text314.lua"))()
                            end)

                        elseif opt ==
                            "LOCALPLAYER" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text8/refs/heads/main/Text8.lua"))()
                            end)

                        elseif opt ==
                            "NOCLIP" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/NOCLIP/refs/heads/main/NOCLIP.lua"))()
                            end)

                        elseif opt ==
                            "ESP PANELS" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text211/refs/heads/main/Text211.lua"))()
                            end)

                        elseif opt ==
                            "BAJAR LOS GRÁFICOS" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Fps-Boost-/refs/heads/main/FPS_BOOST_UNIVERSAL.lua"))()
                            end)

                        elseif opt ==
                            "INVISIBLE" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text427/refs/heads/main/Text427.lua"))()
                            end)

                        elseif opt ==
                            "TOUCH FLING" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text281/refs/heads/main/Text281.lua"))()
                            end)

                        elseif opt ==
                            "YOUTUBE:SBS HUB" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Copiar-canal/refs/heads/main/Suscribete.lua"))()
                            end)

                        elseif opt ==
                            "TP TOOL" then

                            pcall(function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text331/refs/heads/main/Text331.lua"))()
                            end)

                        end

                    end
                )

                --==================================================
                -- DESCRIPCIÓN
                --==================================================

                local descriptionText =
                    buttonDescriptions[opt]

                local buttonHeight = 30

                if descriptionText then

                    local descriptionHeight =
                        getDescriptionHeight(
                            descriptionText
                        )

                    local description =
                        Instance.new(
                            "TextLabel",
                            rightFrame
                        )

                    description.Size =
                        UDim2.new(
                            1,-30,
                            0,descriptionHeight
                        )

                    description.Position =
                        UDim2.new(
                            0,15,
                            0,
                            oy + 33
                        )

                    description.BackgroundTransparency = 1

                    description.Text =
                        descriptionText

                    description.TextColor3 =
                        Color3.fromRGB(
                            135,135,135
                        )

                    description.Font =
                        Enum.Font.Gotham

                    description.TextSize = 10

                    description.TextWrapped = true

                    description.TextXAlignment =
                        Enum.TextXAlignment.Left

                    description.TextYAlignment =
                        Enum.TextYAlignment.Top

                    buttonHeight +=
                        descriptionHeight + 8

                end

                --==================================================
                -- ESPACIO AUTOMÁTICO
                --==================================================

                oy +=
                    buttonHeight + 8

                --==================================================
                -- TÍTULO PERSONALIZADO
                --==================================================

                if customTitles[opt] then

                    local section =
                        Instance.new(
                            "TextLabel",
                            rightFrame
                        )

                    section.Size =
                        UDim2.new(
                            1,-20,
                            0,25
                        )

                    section.Position =
                        UDim2.new(
                            0,10,
                            0,oy
                        )

                    section.BackgroundTransparency = 1

                    section.Text =
                        customTitles[opt]

                    section.TextColor3 =
                        Color3.fromRGB(
                            255,255,255
                        )

                    section.Font =
                        Enum.Font.GothamBold

                    section.TextSize = 15

                    section.TextXAlignment =
                        Enum.TextXAlignment.Center

                    --==================================================
                    -- ICONO DEL TÍTULO PERSONALIZADO
                    --==================================================

                    local subtitleIconId =
                        rightSubtitleIcons[
                            customTitles[opt]
                        ]

                    if subtitleIconId then

                        local subtitleIcon =
                            Instance.new("ImageLabel")

                        subtitleIcon.Name =
                            "SubtitleIcon"

                        subtitleIcon.Parent =
                            section

                        subtitleIcon.Size =
                            UDim2.new(
                                0,18,
                                0,18
                            )

                        subtitleIcon.Position =
                            UDim2.new(
                                1,-20,
                                0.5,-9
                            )

                        subtitleIcon.BackgroundTransparency =
                            1

                        subtitleIcon.Image =
                            subtitleIconId

                        subtitleIcon.ScaleType =
                            Enum.ScaleType.Fit

                    end

                    oy += 30

                end

            end

        end
    )

end

--==================================================
-- BOTÓN SBS
--==================================================

local toggle =
    Instance.new(
        "TextButton",
        screenGui
    )

toggle.Size =
    UDim2.new(0,60,0,60)

toggle.Position =
    UDim2.new(1,-80,0,20)

toggle.BackgroundColor3 =
    Color3.fromRGB(20,20,20)

toggle.Text =
    "SBS"

toggle.TextColor3 =
    Color3.fromRGB(255,255,255)

toggle.Font =
    Enum.Font.GothamBold

toggle.TextSize = 24

toggle.BorderSizePixel = 0

local corner =
    Instance.new(
        "UICorner",
        toggle
    )

corner.CornerRadius =
    UDim.new(0.3,0)

--==================================================
-- DRAG SBS
--==================================================

do

    local dragging = false
    local dragStart
    local startPos
    local dragInput

    local function update(input)

        local delta =
            input.Position - dragStart

        toggle.Position =
            UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )

    end

    toggle.InputBegan:Connect(function(input)

        if input.UserInputType ==
            Enum.UserInputType.MouseButton1
        or input.UserInputType ==
            Enum.UserInputType.Touch then

            dragging = true

            dragStart =
                input.Position

            startPos =
                toggle.Position

            input.Changed:Connect(function()

                if input.UserInputState ==
                    Enum.UserInputState.End then

                    dragging = false

                end

            end)

        end

    end)

    toggle.InputChanged:Connect(function(input)

        if input.UserInputType ==
            Enum.UserInputType.MouseMovement
        or input.UserInputType ==
            Enum.UserInputType.Touch then

            dragInput = input

        end

    end)

    UserInputService.InputChanged:Connect(function(input)

        if input == dragInput
        and dragging then

            update(input)

        end

    end)

end

--==================================================
-- ABRIR / CERRAR
--==================================================

local open = true

toggle.MouseButton1Click:Connect(function()

    open = not open

    mainFrame.Visible =
        open

end)
