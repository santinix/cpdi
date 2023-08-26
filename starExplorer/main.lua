local physics = require ("physics")
physics.start ()
physics.setGravity (0, 0)
physics.setDrawMode ("hybrid")

display.setStatusBar (display.HiddenStatusBar)

local spriteOpcoes = 
{
    frames =
    {
        { --1) Asteroide 1
            x = 0,
            y = 0,
            width = 102,
            height = 85
        },
        { --2) Asteroide 2
            x = 0,
            y = 85,
            width = 90,
            height = 83
        },
        { --3) Asteroide 3
            x = 0,
            y = 168,
            width = 100,
            height = 97
        },
        { --4) Nave
            x = 0,
            y = 265,
            width = 98,
            height = 79
        },
        { --5) Laser
            x = 98,
            y = 265,
            width = 14,
            height = 40
        }
    }
}

local sprite = graphics.newImageSheet ("imagens/sprite.png", spriteOpcoes)

local backGroup =  display.newGroup ()
local mainGroup = display.newGroup ()
local UIGroup = display.newGroup ()

local bg = display.newImageRect (backGroup, "imagens/bg.png", 800, 1400)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

local nave = display.newImageRect (mainGroup, sprite, 4, 98, 79)
nave.x = display.contentCenterX 
nave.y = display.contentHeight - 100
physics.addBody (nave, "dynamic", {radius = 30, isSensor = true})
nave.myName = "Nave"

local vidas = 3
local pontos = 0
local asteroidesTable = {}
math.randomseed (os.time()) --Faz com q o math random não tenham padrão previsível

local vidasText = display.newText (UIGroup, "Vidas: " .. vidas, display.contentCenterX -150, display.contentHeight/2*0.1, native.systemFont, 36)
local pontosText = display.newText (UIGroup, "Pontos: " .. pontos, display.contentCenterX + 150, display.contentHeight/2*0.1, native.systemFont, 36)

local function criarAsteroide ()
    local novoAsteroide = display.newImageRect (mainGroup, sprite, 1, 102, 85)
    -- incluindo asteroide na tabela
    table.insert (asteroidesTable, novoAsteroide)
    physics.addBody (novoAsteroide, "dynamic", {radius=40, bounce = 0.8})
    novoAsteroide.myName = "Asteroide"
    
    local localizacao = math.random (3)
        if (localizacao == 1) then
            novoAsteroide.x = -60
            novoAsteroide.y = math.random (500)
            novoAsteroide.setLinearVelocity (math.random (40, 120), math.random (20,60))

        elseif (localizacao == 2) then
            novoAsteroide.x = math.random (display.contentWidth)
            novoAsteroide.y = -60
            novoAsteroide.setLinearVelocity (math.random (-40, 40), math.random (40, 120))
        
        elseif (localizacao == 3) then
            novoAsteroide.x = display.contentWidth +60
            novoAsteroide.y = math.random (500)
            novoAsteroide.setLinearVelocity (math.random (-120, -400), math.random (20, 60))
        end

        novoAsteroide:applyTorque (math.random (-6, 6))
end    