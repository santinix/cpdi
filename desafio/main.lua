-- Criar novo projeto onde quando a IMAGEM colidir com a FORMA, a forma mude de cor

local physics = require ("physics")
physics.start ()
physics.setGravity (2, 9.8)
physics.setDrawMode ("hybrid")

display.setStatusBar (display.HiddenStatusBar)

local bg = display.newImageRect ("imagens/bgst.jpg", 1773/5, 896/5)
bg.x = display.contentCenterX
bg.y = display.contentCenterY
bg.myName = "Cenário"

local ryu = display.newImageRect ("imagens/ryu.png", 167/1.5, 134/1.5)
ryu.x = 30
ryu.y = 400
ryu.myName = "Ryu"