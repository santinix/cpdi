local scriptPlayer = require ("Player")
local perspective = require ("perspective")
local physics = require ("physics")

physics.start ()
physics.setGravity (0, 9.8)
physics.setDrawMode ("hybrid")

display.setStatusBar (display.HiddenStatusBar)

local bg = display.newImageRect ("imagens/bg.jpg", 509, 339)
bg.x, bg.y = display.contentCenterX, display.contentCenterY

local plataforma = display.newImageRect ("imagens/plataforma.png", 1514/12, 790/12)
plataforma.x = display.contentCenterX
plataforma.y = display.contentCenterY


for i =0, 4 do
    plataforma.x = math.random (-5, 300)
    plataforma.y = 50*i
    plataforma.alpha = 0.8
end