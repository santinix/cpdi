local retangulo = display.newRect (300, 80, 200, 140)

local circulo = display.newCircle (500, 80, 50)

local quadrado = display.newRect (700, 80, 150, 150)


-- Adicionar retângulo arredondado:
-- display.newRoundedRect (x, y, largura, altura, raio das bordas)
local retanguloArredondado = display.newRoundedRect (500, 300, 200, 200, 50)


local sorriso = display.newRect (500, 550, 300, 150)

local sorrisoBaixo = display.newRoundedRect (500, 650, 300, 160, 55)

-- Adicionar uma linha:
-- Comandos: display.newLine (xInicial, yInicial, XFinal, YFinal)

local linhaNova = display.newLine (80, 40, 300, 780)
local linhaNovaDireita = display.newLine (800, 40, 700, 1000)


-- Criar um polígono:
-- Comandos: display.newPolygon (x, y, vertices)

local localizacaoX = 200
local localizacaoY = 350

local vertices = {0, -110, 27, -35, 105, -35, 43, 16, 65, 90, 0, 45, -65, 90, -43, 15, -105, -35, -27, -35}

local estrela = display.newPolygon (localizacaoX, localizacaoY, vertices)

-- Criar um novo texto:
-- Comandos: display.newText ("Texto", x, y, fonte, fontsize)
local helloWorld = display.newText ("Ola, Mundo!", 200, 550, native.systemFont, 30) 

local parametros = {
    text = "Ola mundo!",
    x = 200,
    y = 650,
    font = "Arial",
    fontSize = 50,
    align = "right"
}

local olaMundo = display.newText (parametros)

-- Adicionar texto em relevo:
-- Comandos: display.newEmbossedText ("Texto", x, y, fonte, fontsize, etc)

local opcoes = {
    text = "Segunda é chato demais",
    x = 850,
    y = 550,
    font = "Arial",
    fontSize = 33,
    align = "right"

}

local textoRelevo = display.newEmbossedText (opcoes)

-- Adicionar cor aos objetos/texto:
-- Comandos: variavel:setFillCollor (cinza, r, g, b, alfa)

olaMundo:setFillColor (0.9, 0.4, 0.5)
helloWorld:setFillColor (0.9, 0.4, 0.5)
textoRelevo:setFillColor (0.9, 0.4, 0.5)

local color = {
    --destaque
    highlight = {r = 1, g = 1, b = 1},
    --Sombra
    shadow = {r = 0.5, g = 0.5, b = 0.5}
}

textoRelevo:setEmbossColor (color)


-- Gradiente
-- Comando: variável = {type = , color1 = {r, g, b}, color2 = {r,g,b}, color3 = {r,g,b}, direction= ""}

local gradiente = {
    type = "gradient",
    color1 = {0, 0.1, 0.9},
    color2 = {0.8, 0.8, 0.8},
    direction = "down"
}

local gradienteDois = {
    type = "gradient",
    color1 = {0, 0.4, 0.7},
    color2 = {0.5, 0.4, 0.1},
    direction = "down"
}

local gradienteTres = {
    type = "gradient",
    color1 = {0, 0.6, 0.6},
    color2 = {0.5, 0.5, 0.5},
    direction = "down"
}

local gradienteQuatro = {
    type = "gradient",
    color1 = {1, 0.8, 0.4},
    color2 = {0.9, 0.3, 0.6},
    direction = "down"
}

estrela:setFillColor (gradiente)

retangulo:setFillColor (gradienteDois)

retanguloArredondado:setFillColor (gradienteTres)

quadrado:setFillColor (gradienteQuatro)

circulo:setFillColor (color)

sorriso:setFillColor (gradienteDois)
sorrisoBaixo:setFillColor (gradienteDois)