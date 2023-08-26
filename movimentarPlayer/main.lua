local bg = display.newImageRect ("imagens/sky.png", 960*3, 240*3)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

local chao = display.newImageRect ("imagens/ground.png", 1028, 256)
chao.x = display.contentCenterX
chao.y = 490

local bloco = display.newImageRect ("imagens/bloco.png", 225/3, 225/3)
bloco.x = display.contentCenterX
bloco.y = 100

local moeda = display.newImageRect ("imagens/moeda.png", 225/3, 224/3)
moeda.x = display.contentCenterX
moeda.y = 20

local player = display.newImageRect ("imagens/player.png", 532/3, 469/3)
player.x = 50
player.y = 295


-- Andar para a direita
local function direita ()
    player.x = player.x + 2

end

local botaoDireita = display.newImageRect ("imagens/button.png", 1280/20, 1279/20)
botaoDireita.x = 220
botaoDireita.y = 460
botaoDireita:addEventListener ("tap", direita)

local function esquerda ()
    player.x = player.x - 2

end


local botaoEsquerda = display.newImageRect ("imagens/button.png", 1280/20, 1279/20)
botaoEsquerda.x = 75
botaoEsquerda.y = 460
botaoEsquerda.rotation = 180
botaoEsquerda:addEventListener ("tap", esquerda)


local function cima ()
    player.y = player.y - 2

end

local botaoCima = display.newImageRect ("imagens/button.png", 1280/20, 1279/20)
botaoCima.x = 150
botaoCima.y = 420
botaoCima.rotation = 270   
botaoCima:addEventListener ("tap", cima)


local function baixo ()
    player.y = player.y + 2

end

local botaoBaixo = display.newImageRect ("imagens/button.png", 1280/20, 1279/20)
botaoBaixo.x = 150
botaoBaixo.y = 490
botaoBaixo.rotation = 90   
botaoBaixo:addEventListener ("tap", baixo)


local function diagSupDir ()
    player.x = player.x + 2
    player.y = player.y - 2

end
-- Criar botão diagonal superior direita



local function diagInfDir ()
    player.x = player.x + 2
    player.y = player.y + 2
end
-- Criar botão diagonal inferior direita

local function diagSupEsq ()
    player.x = player.x - 2
    player.y = player.y - 2
end
--Criar botão diagonal superior esquerda

local function diagInfEsq ()
    player.x = player.x - 2
    player.y = player.y + 2
end
--Criar botão diagonal inferior esquerda

