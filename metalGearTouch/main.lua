local physics = require ("physics")
physics.start ()
physics.setGravity (0, 0)
physics.setDrawMode ("normal")


display.setStatusBar (display.HiddenStatusBar)


local grupoBg = display.newGroup ()
local grupoMain = display.newGroup ()
local grupoUi = display.newGroup ()


local pontos = 0
local vidas = 5


local bg = display.newImageRect (grupoBg, "imagens/bg.png", 500, 368)
bg.x = display.contentCenterX
bg.y = display.contentCenterY


local pontosText = display.newText (grupoUi, "Pontos: " .. pontos, 100, 30, native.systemFont, 20)
pontosText:setFillColor (0, 0, 0)

local vidasText = display.newText (grupoUi, "Vidas: " .. vidas, 200, 30, native.systemFont, 20)
vidasText:setFillColor (0, 0, 0)


local snake = display.newImageRect (grupoMain, "imagens/snake.png", 482/4, 518/4)
snake.x = 55
snake.y = 200
snake.myName = "Snake"
physics.addBody (snake, "kinematic")


local botaoCima = display.newImageRect (grupoMain, "imagens/button.png", 1280/30, 1279/30)
botaoCima.x = 150
botaoCima.y = 300
botaoCima.rotation = -90

local botaoBaixo = display.newImageRect (grupoMain, "imagens/button.png", 1280/30, 1279/30)
botaoBaixo.x = 200
botaoBaixo.y = 300
botaoBaixo.rotation = 90



local function cima ()
    snake.y = snake.y -10
end

local function baixo ()
    snake.y = snake.y +10
end


botaoCima:addEventListener ("tap", cima)
botaoBaixo:addEventListener ("tap", baixo)



local BotaoTiro = display.newImageRect (grupoMain, "imagens/bt.png", 360/4, 360/4)
BotaoTiro.x = 250
BotaoTiro.y = 300


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



local carlos = display.newImageRect (grupoMain, "imagens/carlos.png", 552/3, 452/3)
carlos.x = 430
carlos.y = 200
carlos.myName = "Carlos"
physics.addBody (carlos, "kinematic")
local direcaoInimigo = "cima"


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

carlos.timer = timer.performWithDelay (math.random (1500, 3000),
    inimigoAtirar, 0)


local function movimentoInimigo ()
    
    if not (carlos.x == nil) then
       
        if (direcaoInimigo == "cima") then
            carlos.y = carlos.y - 1
            
            if (carlos.y <= 50) then
                direcaoInimigo = "baixo"
            end
        
        elseif (direcaoInimigo == "baixo") then
            carlos.y = carlos.y + 1
           
            if (carlos.y >= 300) then
                direcaoInimigo = "cima"
            end
        end
   
    else
         print ("Inimigo Morreu")
        
        Runtime:removeEventListener ("enterFrame", movimentoInimigo)
    end 
end

Runtime:addEventListener ("enterFrame", movimentoInimigo)



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