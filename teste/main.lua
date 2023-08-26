local physics = require ("physics")
physics.start ()
physics.setGravity (0, 0)
physics.setDrawMode ("hybrid")

display.setStatusBar (display.HiddenStatusBar)

local letterboxWidth = (display.actualContentWidth-display.contentWidth)/2

local posicaoxDireita = display.contentWidth + letterboxWidth

local letterboxHeight = (display.actualContentHeight-display.contentHeight)/2

local posicaoyDireita = display.contentHeight + letterboxHeight

local backGroup = display.newGroup ()
local mainGroup = display.newGroup ()
local uiGroup = display.newGroup ()

local parametros = {halfWidth=15, halfHeight =10, x = 0, y = 22}

--physics.addBody (terra1, "static", {box = parametros})

--BACKGROUND
local bg = display.newImageRect (backGroup, "imagens/fazendaSprites/fazendaFundo.png", 720, 480)
bg.x, bg.y = display.contentCenterX, display.contentCenterY
------------------------------------------------

-- QUANTIDADE
local quantidade = display.newImageRect (uiGroup, "imagens/fazendaSprites/pedidos.png", 192, 48)
quantidade.x, quantidade.y = display.screenOriginX + 95, display.screenOriginY+23
------------------------------------------------

--Sementes barra ferramenta

local sementeAlface = display.newImageRect (uiGroup, "imagens/fazendaSprites/fazendaBarra/sementes/alface.png", 48, 44)
sementeAlface.x, sementeAlface.y = display.contentWidth + letterboxWidth - 265, display.contentCenterY  - 87
sementeAlface.id = "sementeAlface"
physics.addBody (sementeAlface, "dynamic", {density= 1, friction= 0, bounce= 0, isSensor = true})
sementeAlface.alpha = 0.01

local function sementeAlfaceCorpo ()
    sementeAlface.bodyType = "dynamic"
end

local function moverSementeAlface (event)
    local body = event.target
    local phase = event.phase

    if ("began" == phase) then
        display.getCurrentStage (): setFocus (body,event.id)
        body.isFocus = true
        -- cria a junta para mover
        body.tempJoint = physics.newJoint ("touch", body, event.x, event.y)
        body.isFixedRotation = true
    elseif (body.isFocus) then
        if ("moved" == phase) then
            body.tempJoint:setTarget (event.x, event.y)
        elseif ("ended" == phase or "canceled" == phase) then
            display.getCurrentStage ():setFocus (body, nil)
            body.isFocus = false
            event.target:setLinearVelocity (0,0)
            event.target.angularVelocity = 0
            body.tempJoint:removeSelf ()
            body.isFixedRotation = false -- deve ser comentado caso não queira que o heroi gire na agua
            sementeAlface.bodyType = "static"
            sementeAlface.x, sementeAlface.y = display.contentWidth + letterboxWidth - 265, display.contentCenterY  - 87
            timer.performWithDelay( 200, sementeAlfaceCorpo) 
        end
    end
    return true
end


sementeAlface:addEventListener ("touch", moverSementeAlface)



local sementeBatata = display.newImageRect (uiGroup, "imagens/fazendaSprites/fazendaBarra/sementes/batata.png", 48, 44)
sementeBatata.x, sementeBatata.y = display.contentWidth + letterboxWidth - 210, display.contentCenterY  - 87
sementeBatata.id = "sementeBatata"
physics.addBody (sementeBatata, "dynamic", {density= 1, friction= 0, bounce= 0, isSensor = true})
sementeBatata.alpha = 0.01

local function sementeBatataCorpo ()
    sementeBatata.bodyType = "dynamic"
end

local function moverSementeBatata (event)
    local body = event.target
    local phase = event.phase

    if ("began" == phase) then
        display.getCurrentStage (): setFocus (body,event.id)
        body.isFocus = true
        -- cria a junta para mover
        body.tempJoint = physics.newJoint ("touch", body, event.x, event.y)
        body.isFixedRotation = true
    elseif (body.isFocus) then
        if ("moved" == phase) then
            body.tempJoint:setTarget (event.x, event.y)
        elseif ("ended" == phase or "canceled" == phase) then
            display.getCurrentStage ():setFocus (body, nil)
            body.isFocus = false
            event.target:setLinearVelocity (0,0)
            event.target.angularVelocity = 0
            body.tempJoint:removeSelf ()
            body.isFixedRotation = false -- deve ser comentado caso não queira que o heroi gire na agua
            sementeBatata.bodyType = "static"
            sementeBatata.x, sementeBatata.y = display.contentWidth + letterboxWidth - 210, display.contentCenterY  - 87
            timer.performWithDelay( 200, sementeBatataCorpo) 
        end
    end
    return true
end

sementeBatata:addEventListener ("touch", moverSementeBatata)



local sementeTrigo = display.newImageRect (uiGroup, "imagens/fazendaSprites/fazendaBarra/sementes/trigo.png", 48, 44)
sementeTrigo.x, sementeTrigo.y = display.contentWidth + letterboxWidth - 153, display.contentCenterY  - 87
sementeTrigo.id = "sementeTrigo"
physics.addBody (sementeTrigo, "dynamic", {density= 1, friction= 0, bounce= 0, isSensor = true})
sementeTrigo.alpha = 0.01

local function sementeTrigoCorpo ()
    sementeTrigo.bodyType = "dynamic"
end

local function moverSementeTrigo (event)
    local body = event.target
    local phase = event.phase

    if ("began" == phase) then
        display.getCurrentStage (): setFocus (body,event.id)
        body.isFocus = true
        -- cria a junta para mover
        body.tempJoint = physics.newJoint ("touch", body, event.x, event.y)
        body.isFixedRotation = true
    elseif (body.isFocus) then
        if ("moved" == phase) then
            body.tempJoint:setTarget (event.x, event.y)
        elseif ("ended" == phase or "canceled" == phase) then
            display.getCurrentStage ():setFocus (body, nil)
            body.isFocus = false
            event.target:setLinearVelocity (0,0)
            event.target.angularVelocity = 0
            body.tempJoint:removeSelf ()
            body.isFixedRotation = false -- deve ser comentado caso não queira que o heroi gire na agua
            sementeTrigo.bodyType = "static"
            sementeTrigo.x, sementeTrigo.y = display.contentWidth + letterboxWidth - 153, display.contentCenterY  - 87
            timer.performWithDelay( 200, sementeTrigoCorpo) 
        end
    end
    return true
end

sementeTrigo:addEventListener ("touch", moverSementeTrigo)



local sementeTomate = display.newImageRect (uiGroup, "imagens/fazendaSprites/fazendaBarra/sementes/tomate.png", 48, 44)
sementeTomate.x, sementeTomate.y = display.contentWidth + letterboxWidth - 97, display.contentCenterY  - 85
sementeTomate.id = "sementeTomate"
physics.addBody (sementeTomate, "dynamic", {density= 1, friction= 0, bounce= 0, isSensor = true})
sementeTomate.alpha = 0.01

local function sementeTomateCorpo ()
    sementeTomate.bodyType = "dynamic"
end

local function moverSementeTomate (event)
    local body = event.target
    local phase = event.phase

    if ("began" == phase) then
        display.getCurrentStage (): setFocus (body,event.id)
        body.isFocus = true
        -- cria a junta para mover
        body.tempJoint = physics.newJoint ("touch", body, event.x, event.y)
        body.isFixedRotation = true
    elseif (body.isFocus) then
        if ("moved" == phase) then
            body.tempJoint:setTarget (event.x, event.y)
        elseif ("ended" == phase or "canceled" == phase) then
            display.getCurrentStage ():setFocus (body, nil)
            body.isFocus = false
            event.target:setLinearVelocity (0,0)
            event.target.angularVelocity = 0
            body.tempJoint:removeSelf ()
            body.isFixedRotation = false -- deve ser comentado caso não queira que o heroi gire na agua
            sementeTomate.bodyType = "static"
            sementeTomate.x, sementeTomate.y = display.contentWidth + letterboxWidth - 97, display.contentCenterY  - 85
            timer.performWithDelay( 200, sementeTomateCorpo) 
        end
    end
    return true
end

sementeTomate:addEventListener ("touch", moverSementeTomate)


-- MENU SEMENTES
local menuSementes
local menuAberto = false

function criarMenu ()
    menuSementes = display.newImageRect (mainGroup, "imagens/fazendaSprites/fazendaBarra/sementes/barra_Sementes.png", 292, 64)
    menuSementes.x, menuSementes.y = menuSementes.width + 380, display.contentCenterY  - 85
end

function abrirMenu ()
    transition.to(menuSementes, {time = 500, x = display.contentWidth + letterboxWidth - 150, y = display.contentCenterY  - 85, onComplete = function ()
    sementeAlface.alpha = 1
    sementeBatata.alpha = 1
    sementeTomate.alpha = 1
    sementeTrigo.alpha = 1
    end
    })
    menuAberto = true
end

function fecharMenu ()
    sementeAlface.alpha = 0.01
    sementeBatata.alpha = 0.01
    sementeTomate.alpha = 0.01
    sementeTrigo.alpha = 0.01
    transition.to(menuSementes, {time = 500,x= menuSementes.width + 378})
    menuAberto = false
end

function clickBotao (event)
    if menuAberto == true then
        fecharMenu ()
        else
        abrirMenu ()
    end  
end


criarMenu ()
----------------------------------------------

--Menu ferramentas
local ferramentas = display.newImageRect (uiGroup, "imagens/fazendaSprites/fazendaBarra/ferramentas.png", 64, 272)
ferramentas.x, ferramentas.y = display.contentWidth + letterboxWidth - 32, display.contentCenterY

local botaoSemente = display.newImageRect (uiGroup, "imagens/fazendaSprites/fazendaBarra/sacoSemente.png", 38, 34)
botaoSemente.x, botaoSemente.y = display.contentWidth + letterboxWidth - 32, display.contentCenterY  - 85
botaoSemente.myName = "botaoSemente"

botaoSemente:addEventListener ("tap", clickBotao)

--------------------------------------------------------------------

-- ADUBO
local adubo = display.newImageRect (uiGroup, "imagens/fazendaSprites/fazendaBarra/adubo.png", 48, 44)
adubo.x, adubo.y = display.contentWidth + letterboxWidth - 32, display.contentCenterY - 30
physics.addBody (adubo, "dynamic", {density= 1, friction= 0, bounce= 0, isSensor = true})
adubo.id = "adubo"


local function aduboCorpo ()
    adubo.bodyType = "dynamic"
end

local function moverAdubo (event)
    local body = event.target
    local phase = event.phase

    if ("began" == phase) then
        display.getCurrentStage (): setFocus (body,event.id)
        body.isFocus = true
        -- cria a junta para mover
        body.tempJoint = physics.newJoint ("touch", body, event.x, event.y)
        body.isFixedRotation = true
    elseif (body.isFocus) then
        if ("moved" == phase) then
            body.tempJoint:setTarget (event.x, event.y)
        elseif ("ended" == phase or "canceled" == phase) then
            display.getCurrentStage ():setFocus (body, nil)
            body.isFocus = false
            event.target:setLinearVelocity (0,0)
            event.target.angularVelocity = 0
            body.tempJoint:removeSelf ()
            body.isFixedRotation = false -- deve ser comentado caso não queira que o heroi gire na agua
            adubo.bodyType = "static"
            adubo.x, adubo.y = display.contentWidth + letterboxWidth - 32, display.contentCenterY - 30
            timer.performWithDelay( 200, aduboCorpo) 
        end
    end
    return true
end


adubo:addEventListener ("touch", moverAdubo)
------------------------------------------------------------------

-- ÁGUA
local agua = display.newImageRect (uiGroup, "imagens/fazendaSprites/fazendaBarra/agua.png", 48, 44)
agua.x, agua.y = display.contentWidth + letterboxWidth - 32, display.contentCenterY + 26
physics.addBody (agua, "dynamic", {density= 1, friction= 0, bounce= 0, isSensor = true})
agua.id = "agua"


local function aguaCorpo ()
    agua.bodyType = "dynamic"
end

local function moverAgua (event)
    local body = event.target
    local phase = event.phase

    if ("began" == phase) then
        display.getCurrentStage (): setFocus (body,event.id)
        body.isFocus = true
        -- cria a junta para mover
        body.tempJoint = physics.newJoint ("touch", body, event.x, event.y)
        body.isFixedRotation = true
    elseif (body.isFocus) then
        if ("moved" == phase) then
            body.tempJoint:setTarget (event.x, event.y)
        elseif ("ended" == phase or "canceled" == phase) then
            display.getCurrentStage ():setFocus (body, nil)
            body.isFocus = false
            event.target:setLinearVelocity (0,0)
            event.target.angularVelocity = 0
            body.tempJoint:removeSelf ()
            body.isFixedRotation = false -- deve ser comentado caso não queira que o heroi gire na agua
            agua.bodyType = "static"
            agua.x, agua.y = display.contentWidth + letterboxWidth - 32, display.contentCenterY + 26
            timer.performWithDelay( 200, aguaCorpo) 
        end
    end
    return true
end

agua:addEventListener ("touch", moverAgua)
----------------------------------------------------------------------

-- SELECIONAR
local selecao = display.newImageRect (uiGroup, "imagens/fazendaSprites/fazendaBarra/selecionar.png", 48, 44)
selecao.x, selecao.y = display.contentWidth + letterboxWidth - 32, display.contentCenterY + 81
physics.addBody (selecao, "dynamic", {density= 1, friction= 0, bounce= 0, isSensor = true})
selecao.id = "selecao"


local function selecaoCorpo ()
    selecao.bodyType = "dynamic"
end

local function moverSelecao (event)
    local body = event.target
    local phase = event.phase

    if ("began" == phase) then
        display.getCurrentStage (): setFocus (body,event.id)
        body.isFocus = true
        -- cria a junta para mover
        body.tempJoint = physics.newJoint ("touch", body, event.x, event.y)
        body.isFixedRotation = true
    elseif (body.isFocus) then
        if ("moved" == phase) then
            body.tempJoint:setTarget (event.x, event.y)
        elseif ("ended" == phase or "canceled" == phase) then
            display.getCurrentStage ():setFocus (body, nil)
            body.isFocus = false
            event.target:setLinearVelocity (0,0)
            event.target.angularVelocity = 0
            body.tempJoint:removeSelf ()
            body.isFixedRotation = false -- deve ser comentado caso não queira que o heroi gire na agua
            selecao.bodyType = "static"
            selecao.x, selecao.y = display.contentWidth + letterboxWidth - 32, display.contentCenterY + 81
            timer.performWithDelay( 200, selecaoCorpo) 
        end
    end
    return true
end

selecao:addEventListener ("touch", moverSelecao)
-----------------------------------------------------------------------------------------------

-- PLANTAÇÃO

-- Inclusão de sprite animação
-- ("pasta/arquivo.formato", larguraFrame, alturaFrame, quantidadeFrame)
local plantas = graphics.newImageSheet ("imagens/fazendaSprites/seedsgrow.png", {width = 48, height = 72, numFrames = 8})

-- animação
local spritePlantas = {
    {name="terra", start=1, count=1, time=1000, loopCount=0},
    {name="crescer1", start=2, count=1, time=1000, loopCount=0},
    {name="crescer2", start=3, count=1, time=1000, loopCount=0},
    {name="muda", start=4, count=1, time=1000, loopCount=0},
    {name="batata", start=5, count=1, time=1000, loopCount=0},
    {name="tomate", start=6, count=1, time=1000, loopCount=0},
    {name="alface", start=7, count=1, time=1000, loopCount=0},
    {name="trigo", start=8, count=1, time=1000, loopCount=0}
}

local terra1 = display.newSprite (mainGroup, plantas, spritePlantas)
terra1.x, terra1.y = display.contentCenterX - 160, display.contentCenterY - 20
terra1:setSequence ("terra")
terra1:play ()
physics.addBody (terra1, "static", {box = parametros})
terra1.id = "terra1"
terra1.semente = "nada"
terra1.status = "nada"


local terra2 = display.newSprite (mainGroup, plantas, spritePlantas)
terra2.x, terra2.y = display.contentCenterX - 96, display.contentCenterY - 20
terra2:setSequence ("terra")
terra2:play ()
physics.addBody (terra2, "static", {box = parametros})
terra2.id = "terra2"
terra2.semente = "nada"
terra2.status = "nada"

local terra3 = display.newSprite (mainGroup, plantas, spritePlantas)
terra3.x, terra3.y = display.contentCenterX - 32, display.contentCenterY - 20
terra3:setSequence ("terra")
terra3:play ()
physics.addBody (terra3, "static", {box = parametros})
terra3.id = "terra3"
terra3.semente = "nada"
terra3.status = "nada"

local terra4 = display.newSprite (mainGroup, plantas, spritePlantas)
terra4.x, terra4.y = display.contentCenterX +32, display.contentCenterY - 20
terra4:setSequence ("terra")
terra4:play ()
physics.addBody (terra4, "static", {box = parametros})
terra4.id = "terra4"
terra4.semente = "nada"
terra4.status = "nada"

local terra5 = display.newSprite (mainGroup, plantas, spritePlantas)
terra5.x, terra5.y = display.contentCenterX +96, display.contentCenterY - 20
terra5:setSequence ("terra")
terra5:play ()
physics.addBody (terra5, "static", {box = parametros})
terra5.id = "terra5"
terra5.semente = "nada"
terra5.status = "nada"

local terra6 = display.newSprite (mainGroup, plantas, spritePlantas)
terra6.x, terra6.y = display.contentCenterX - 160, display.contentCenterY + 44
terra6:setSequence ("terra")
terra6:play ()
physics.addBody (terra6, "static", {box = parametros})
terra6.id = "terra6"
terra6.semente = "nada"
terra6.status = "nada"

local terra7 = display.newSprite (mainGroup, plantas, spritePlantas)
terra7.x, terra7.y = display.contentCenterX - 96, display.contentCenterY + 44
terra7:setSequence ("terra")
terra7:play ()
physics.addBody (terra7, "static", {box = parametros})
terra7.id = "terra7"
terra7.semente = "nada"
terra7.status = "nada"

local terra8 = display.newSprite (mainGroup, plantas, spritePlantas)
terra8.x, terra8.y = display.contentCenterX - 32, display.contentCenterY + 44
terra8:setSequence ("terra")
terra8:play ()
physics.addBody (terra8, "static", {box = parametros})
terra8.id = "terra8"
terra8.semente = "nada"
terra8.status = "nada"

local terra9 = display.newSprite (mainGroup, plantas, spritePlantas)
terra9.x, terra9.y = display.contentCenterX +32, display.contentCenterY + 44
terra9:setSequence ("terra")
terra9:play ()
physics.addBody (terra9, "static", {box = parametros})
terra9.id = "terra9"
terra9.semente = "nada"
terra9.status = "nada"

local terra10 = display.newSprite (mainGroup, plantas, spritePlantas)
terra10.x, terra10.y = display.contentCenterX +96, display.contentCenterY + 44
terra10:setSequence ("terra")
terra10:play ()
physics.addBody (terra10, "static", {box = parametros})
terra10.id = "terra10"
terra10.semente = "nada"
terra10.status = "nada"

local terra11 = display.newSprite (mainGroup, plantas, spritePlantas)
terra11.x, terra11.y = display.contentCenterX -160, display.contentCenterY + 108
terra11:setSequence ("terra")
terra11:play ()
physics.addBody (terra11, "static", {box = parametros})
terra11.id = "terra11"
terra11.semente = "nada"
terra11.status = "nada"

local terra12 = display.newSprite (mainGroup, plantas, spritePlantas)
terra12.x, terra12.y = display.contentCenterX - 96, display.contentCenterY + 108
terra12:setSequence ("terra")
terra12:play ()
physics.addBody (terra12, "static", {box = parametros})
terra12.id = "terra12"
terra12.semente = "nada"
terra12.status = "nada"


local terra13 = display.newSprite (mainGroup, plantas, spritePlantas)
terra13.x, terra13.y = display.contentCenterX - 32, display.contentCenterY + 108
terra13:setSequence ("terra")
terra13:play ()
physics.addBody (terra13, "static", {box = parametros})
terra13.id = "terra13"
terra13.semente = "nada"
terra13.status = "nada"

local terra14 = display.newSprite (mainGroup, plantas, spritePlantas)
terra14.x, terra14.y = display.contentCenterX +32, display.contentCenterY + 108
terra14:setSequence ("terra")
terra14:play ()
physics.addBody (terra14, "static", {box = parametros})
terra14.id = "terra14"
terra14.semente = "nada"
terra14.status = "nada"

local terra15 = display.newSprite (mainGroup, plantas, spritePlantas)
terra15.x, terra15.y = display.contentCenterX +96, display.contentCenterY + 108
terra15:setSequence ("terra")
terra15:play ()
physics.addBody (terra15, "static", {box = parametros})
terra15.id = "terra15"
terra15.semente = "nada"
terra15.status = "nada"
-----------------------------------------------------------------


-- TEMPO DE CRESCIMENTO

local tempo = 3000



--------------------------------------
-- FUNÇÃO DE COLHEITA

local function colheita (terra)
    if terra.semente == "alface" then
        terra:setSequence ("alface")
        terra.status = "pronto"

    elseif terra.semente == "tomate" then
        terra:setSequence ("tomate")
        terra.status = "pronto"

    elseif terra.semente == "batata" then
        terra:setSequence ("batata")
        terra.status = "pronto"

    elseif terra.semente == "trigo" then
        terra:setSequence ("trigo")
        terra.status = "pronto"
    end

end


-- FUNÇÕES GERMINAR MUDA

local function muda (terra)
    terra:setSequence ("muda")
    terra.status = "muda"
end


-- PLACAR

local alfacePlacar = display.newImageRect (uiGroup, "imagens/fazendaSprites/fazendaBarra/sementes/alface.png", 24, 22)
alfacePlacar.x, alfacePlacar.y = display.screenOriginX + 95, display.screenOriginY+11

local batataPlacar = display.newImageRect (uiGroup, "imagens/fazendaSprites/fazendaBarra/sementes/batata.png", 24, 22)
batataPlacar = display.screenOriginX + 95, display.screenOriginY+11

local trigoPlacar = display.newImageRect (uiGroup, "imagens/fazendaSprites/fazendaBarra/sementes/trigo.png", 24, 22)
trigoPlacar = display.screenOriginX + 95, display.screenOriginY+11

local tomatePlacar = display.newImageRect (uiGroup, "imagens/fazendaSprites/fazendaBarra/sementes/tomate.png", 24, 22)
tomatePlacar = display.screenOriginX + 95, display.screenOriginY+11



-- COLISÕES

-- Função que faz os objetos colidirem -------------------------------------------------------------------------------------------



local function onColision (self, event)
    if (event.phase == "began") then
        
        -- terra 1

        if (event.other.id == "sementeAlface") then
            if (menuAberto == true) then
                if self.status == "nada" then
                    self:setSequence ("crescer1")
                    self.semente = "alface"
                    self.status = "crescer1"
                end
            end
        end

        if (event.other.id == "sementeBatata") then
            if (menuAberto == true) then
                if self.status == "nada" then
                    self:setSequence ("crescer1")
                    self.semente= "batata"
                    self.status = "crescer1"
                end
            end
        end
    
        if (event.other.id == "sementeTomate") then
            if (menuAberto == true) then
                if self.status == "nada" then
                    self:setSequence ("crescer1")
                    self.semente= "tomate"
                    self.status = "crescer1"
                end
            end
        end
    
        if (event.other.id == "sementeTrigo") then
            if (menuAberto == true) then
                if self.status == "nada" then
                    self:setSequence ("crescer1")
                    self.semente= "trigo"
                    self.status = "crescer1"
                end
            end
        end


        if (event.other.id == "adubo") then
            if self.status == "crescer1" then
                self:setSequence ("crescer2")
                self.status = "crescer2"
            end
        end

        
        if (event.other.id == "agua") then
            if self.status == "crescer2" then
                muda (self)
                colheita(self)
            end
        end
    
        if (event.other.id == "selecao") then
            if self.status == "pronto" then
                self:setSequence ("terra")
                self.status = "nada"
                
               -- timer.performWithDelay (100, placar)
           
            end
            
        end
    end
end

terra1.collision = onColision
terra1:addEventListener ("collision")

terra2.collision = onColision
terra2:addEventListener ("collision")

terra3.collision = onColision
terra3:addEventListener ("collision")
      
terra4.collision = onColision
terra4:addEventListener ("collision")
      
terra5.collision = onColision
terra5:addEventListener ("collision")

terra6.collision = onColision
terra6:addEventListener ("collision")

terra7.collision = onColision
terra7:addEventListener ("collision")

terra8.collision = onColision
terra8:addEventListener ("collision")

terra9.collision = onColision
terra9:addEventListener ("collision")

terra10.collision = onColision
terra10:addEventListener ("collision")

terra11.collision = onColision
terra11:addEventListener ("collision")

terra12.collision = onColision
terra12:addEventListener ("collision")

terra13.collision = onColision
terra13:addEventListener ("collision")

terra14.collision = onColision
terra14:addEventListener ("collision")

terra15.collision = onColision
terra15:addEventListener ("collision")


