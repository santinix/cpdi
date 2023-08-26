-- -- Incluindo funções
-- -- Comando para iniciar a função

-- local function detectarTap (event) --determina que a função é de evento 
--     --Código que será executado quando o botão for tocado.
--     -- tostring é utilizado para sequenciar.
--     -- event.target: nomear o objeto do evento, ou objeto tocado.
--     print ("objeto tocado: " .. tostring (event.target))
--     return true -- "Zerar" todos os dados depois da função executada.

-- end    -- Fecha a função

-- local botaoTap = display.newRect (200, 200, 200, 50)
-- botaoTap:addEventListener ("tap", detectarTap) -- Adiciona um ouvinte "tap" ao objeto.

-- local function tapDuplo (event)
--     if (event.numTaps == 2) then
--         print ("Objeto tocado duas vezes: " ..tostring(event.target))

--     else
--         return true
--     end 
-- end

-- local botaoDuplo = display.newRect (100, 300, 200, 50)
-- botaoDuplo:setFillColor (0.7, 0, 0.5)
-- botaoDuplo:addEventListener ("tap", tapDuplo)


-- -- Evento de toque (touch)
-- -- Fases do toque:
--     -- began = Primeira fase do toque, quando o usuário encosta na tela.
--     -- moved = Quando o usuário mantém o toque e move pela tela.
--     -- ended = Quando o usuário retira  o dedo da tela.
--     -- cancelled =  Quando o evento de toque é cancelado do sistema.

-- local function fasesToque (event)
-- -- Se a fase  de toque for igual a began então
--     if (event.phase == "began") then
--         print ("Objeto tocado: " ..tostring (event.target))
-- -- Porém  se a fase  de toque  for igual a moved então 
--     elseif (event.phase == "moved") then
--         print ("Localização de toque  nas seguintes  coordenadas: x= " .. event.x .. ", y= " .. event.y)
-- -- Entretanto se a fase de toque for igual  a ended ou cancelled então
--     elseif(event.phase == "ended" or "cancelled") then
--         print ("Touch terminando no objeto: " .. tostring (event.target))
--     end

--     return true
-- end

-- local botaoTouch = display.newRect (200, 400, 200, 50)
-- botaoTouch:setFillColor (0.9, 0.2, 0)
-- botaoTouch:addEventListener ("touch", fasesToque)

-- Multitoque:
-- Para utilizar o multitouch  precisamos habilitar (ativar) primeiro.
system.activate ("multitouch")

local retangulo = display.newRect (display.contentCenterX, display.contentCenterY, 280, 440)
retangulo:setFillColor (1, 0, 0.3)

local function eventoTouch (event)
    print ("Fase de toque" ..event.phase)
    print ("Localização X: " ..tostring(event.x) .. "Localização y: " ..tostring(event.y))
    print ("ID de toque exclusivo: " ..tostring(event.id))
    print ("----------")

    return true
end

retangulo:addEventListener ("touch", eventoTouch)