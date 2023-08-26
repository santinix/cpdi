-- Criar novo projeto onde quando a IMAGEM colidir com a FORMA, a forma mude de cor

local physics = require ("physics")
physics.start ()
physics.setGravity (2, 9.8)
physics.setDrawMode ("hybrid")

display.setStatusBar (display.HiddenStatusBar)

local baixo = display.newRect (display.contentCenterX, 330, 500, 20)
physics.addBody (baixo, "static")
baixo.myName = "Chão"

local bg = display.newImageRect ("imagens/bgst.jpg", 1773/3, 896/2)
bg.x = display.contentCenterX
bg.y = display.contentCenterY
bg.myName = "Cenário"

local ryu = display.newImageRect ("imagens/ryu.png", 167/1.5, 134/1.5)
ryu.x = 80
ryu.y = 275
ryu.myName = "Ryu"

local hadouken = display.newImageRect ("imagens/hado.png", 225/4, 224/4)
hadouken.x = 150
hadouken.y = 258
physics.addBody (hadouken, "kinematic", {radius = 25})
hadouken.myName = "hadouken"


local dummy = display.newRect (400, 170, 100, 300)
physics.addBody (dummy, "dinamic")
hadouken.myName = "dummy"

function cor (event)
    dummy:setFillColor {1, 0.3, 0.6}     
      
end

dummy:addEventListener ("collision", cor)

transition.to (hadouken, {time = 2500, x = 450})




