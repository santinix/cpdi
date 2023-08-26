-- Adicionar imagem na tela
-- Comandos: display.newImageRect ("pasta/nome arquivo.formato" largura, altura)

local bg = display.newImageRect ("imagens/bg.jpg", 1280*1.25, 720*1.25)

-- Definir localização do objeto
-- Comando: variável.linha que vou definir = localização da linha.

bg.x = display.contentCenterX -- Comando que centraliza a variável  em qualquer resolução 
bg.y = display.contentCenterY


local pikachu = display.newImageRect ("imagens/pikachu.png", 1191/5, 1254/5)
pikachu.x = display.contentCenterX
pikachu.y = 550


local charmander = display.newImageRect ("imagens/charmander.png", 507/2, 492/2)
charmander.x = 330
charmander.y = 280

--------------------

-- Criando um retângulo: 
-- Comandos: display.newRect (localização x, localização y, largura, altura)

local retangulo = display.newRect (750, 380, 250, 100)

local mystery = display.newImageRect ("imagens/mystery.png", 493/2, 506/2)
mystery.x = 750
mystery.y = 380


-- Crian um círculo:
-- Comandos: display.newCircle (localização x, localização y, radius ())

local circulo = display.newCircle (150, 80, 50)
