-- Física
-- Chamar biblioteca: atribui a biblioteca interna de física à variável physics.
local physics = require ("physics")

-- Iniciar a física no projeto:
physics.start ()

--Definir gravidade do projeto: Definimos a gravidade x e y do objeto.
physics.setGravity (0, 9.8)

-- Definir a renderização  da visualização  da física (usada somente durante o desenvolvimento para testes)
-- Modos: normal - Aparecem apenas  as imagens, corpos físicos invisíveis (padrão do sistema), Hybrid - Mostra as imagens e os corpos físicos, debug: Mostra apenas os corpos físicos.
physics.setDrawMode ("hybrid")


-- Adicionando objetos físicos
local retangulo = display.newRect (150, display.contentCenterY, 150, 200)
-- Corpo dinâmico: interage com a gravidade  e colide com todos os corpos
physics.addBody (retangulo, "dynamic")

local chao = display.newRect (display.contentCenterX, 400, 450, 30)
-- Corpo estatico: não se movimenta  e colide apenas com dinâmico
physics.addBody (chao, "static")

local circulo = display.newCircle (290, 50, 30)
-- Corpo cinemático: não interage com a gravidade  e colide apenas  com dinâmico.
physics.addBody (circulo, "kinematic", {radius = 30})

local quadrado = display.newRect (display.contentCenterX, 0, 50, 50)
physics.addBody (quadrado, "dynamic", {bounce = 0.8, friction = 1, density = 1})


