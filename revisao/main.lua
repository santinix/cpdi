-- Chamar a biblioteca de física
local physics = require ("physics")
-- Iniciar o motor de física
physics.start ()
-- Definir a gravidade de X e Y
physics.setGravity (0, 0)
-- Definir o modo de renderização
physics.setDrawMode ("normal")

-- Remover barra de notificações
display.setStatusBar (display.HiddenStatusBar)

-- Criar grupos de exibição
local grupoBg = display.newGroup ()
local grupoMain = display.newGroup ()
local grupoUi = display.newGroup ()

--Criar variáveis de pontos e vidas para atribuição de valor.
local pontos = 0
local vidas = 5



-- Adicionar background
local bg = display.newImageRect (grupoBg, "imagens/bg.png", 500, 368)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

-- Adicionar placar na tela
local pontosText = display.newText (grupoUi, "Pontos: " .. pontos, 100, 30, native.systemFont, 20)
pontosText:setFillColor (0, 0, 0)

local vidasText = display.newText (grupoUi, "Vidas: " .. vidas, 200, 30, native.systemFont, 20)
vidasText:setFillColor (0, 0, 0)

--Adicionar herói
local snake = display.newImageRect (grupoMain, "imagens/snake.png", 482/4, 518/4)
snake.x = 55
snake.y = 200
snake.myName = "Snake"
physics.addBody (snake, "kinematic")

-- Criar botões:
local botaoCima = display.newImageRect (grupoMain, "imagens/button.png", 1280/30, 1279/30)
botaoCima.x = 150
botaoCima.y = 300
botaoCima.rotation = -90

local botaoBaixo = display.newImageRect (grupoMain, "imagens/button.png", 1280/30, 1279/30)
botaoBaixo.x = 200
botaoBaixo.y = 300
botaoBaixo.rotation = 90


-- Adicionar funções
local function cima ()
    snake.y = snake.y -10
end

local function baixo ()
    snake.y = snake.y +10
end

-- Adicionar o ouvinte  e a função do botão.
botaoCima:addEventListener ("tap", cima)
botaoBaixo:addEventListener ("tap", baixo)


-- Adicionar botão de tiro:
local BotaoTiro = display.newImageRect (grupoMain, "imagens/button.png", 1280/30, 1279/30)
BotaoTiro.x = 250
BotaoTiro.y = 300

-- Função para atirar:
local function atirar ()
    local tiroSnake = display.newImageRect (grupoMain, "imagens/projetil.png", 59, 29)
    tiroSnake.x = snake.x
    tiroSnake.y = snake.y
    physics.addBody (tiroSnake, "dynamicc", {isSensor = true})
    transition.to (tiroSnake, {x = 500, time = 900, 
        onComplete = function () display.remove (tiroSnake) end})
    tiroSnake.myName = "Atirou"
    tiroSnake:toBack ()
end

BotaoTiro:addEventListener ("tap", atirar)


-- Adicionar inimigo
local carlos = display.newImageRect (grupoMain, "imagens/carlos.png", 552/3, 452/3)
carlos.x = 430
carlos.y = 200
carlos.myName = "Carlos"
physics.addBody (carlos, "kinematic")
local direcaoInimigo = "cima"

-- Função para o inimigo atirar:
local function inimigoAtirar ()
    local tiroInimigo = display.newImageRect (grupoMain, "imagens/slash.png", 59, 29)
    tiroInimigo.x = carlos.x - 30
    tiroInimigo.y = carlos.y
    tiroInimigo.rotation = 0
    physics.addBody (tiroInimigo, "dynamic", {isSensor = true})
    transition.to (tiroInimigo, {x = -400, time = 900,
                    onComplete = function () 
                        display.remove (tiroInimigo)
                    end})
    tiroInimigo.myName = "Tiro Inimigo"
end


-- Criando o timer  de disparo do tiro inimigo:
-- Comandos timer: (tempo repetição inicio, função, quantidade de repetições)
carlos.timer = timer.performWithDelay (math.random (1000, 1500),
    inimigoAtirar, 0)

-- Movimentação inimigo:
local function movimentoInimigo ()
    -- Verificar se a localização de x  não for igual a nulo então
    if not (carlos.x == nil) then
        -- Quando a direção do inimigo for cima então
        if (direcaoInimigo == "cima") then
            carlos.y = carlos.y - 1
            -- Se a localização do inimigo for menor ou igual a 50 move para baixo
            if (carlos.y <= 50) then
                direcaoInimigo = "baixo"
            end
        -- Se a localização do inimigo for baixo então
        elseif (direcaoInimigo == "baixo") then
            carlos.y = carlos.y + 1
            -- Se a localização y do inimigo for maior ou igual a 300 move para cima
            if (carlos.y >= 300) then
                direcaoInimigo = "cima"
            end
        end
    -- se não for nulo
    else
         print ("Inimigo Morreu")
        -- Runtime representa todo o jogo (evento é executado para todos), enterFrame: Está ligado  ao valor de FPS do jogo (frames por segundo), neste caso será executado 60 vezes por segundo.
        Runtime:removeEventListener ("enterFrame", movimentoInimigo)
    end 
end

Runtime:addEventListener ("enterFrame", movimentoInimigo)


-- Função de colisão:
local function onCollision (event)
    if (event.phase == "began") then

        local obj1 = event.object1
        local obj2 = event.object2

        if ((obj1.myName == "Atirou" and obj2.myName == "Carlos")
            or (obj1.myName == "Carlos" and obj2.myName == "Atirou" ))then

            if (obj1.myName == "Atirou") then

                display.remove (obj1)
            else 
                display.remove (obj2)
            end

            pontos = pontos + 10
            pontosText.text = "Pontos: " .. pontos

        elseif ((obj1.myName == "Snake" and obj2.myName == "Tiro Inimigo")
                or (obj1.myName == "Tiro Inimigo" and obj2 == "Snake")) then

                    if (obj1.myName == "Tiro inimigo") then
                        display.remove (obj1)
                    else 
                        display.remove (obj2)
                    end
            vidas  = vidas - 1
            vidasText.text = "Vidas: " .. vidas
        end 
    end    
end

Runtime:addEventListener ("collision", onCollision)