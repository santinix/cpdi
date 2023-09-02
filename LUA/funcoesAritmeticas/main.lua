-- Variável global. (Deve ser evitado)
vidas = 2
vidas = 8
print (vidas)
print ("O valor de vidas é: " .. vidas)
---------------------------
-- Variáveis locais (só é lida dentro do script)
-- (local) é utilizado somente na criação da variável.

local pontos = 10
print (pontos)
print ("O valor de pontos é: " .. pontos)


----------- Operações Aritméticas  ---------
-- Soma
-- local (Significa q a variável é local) laranjas (nome da variável) = (atribuir valor) 10 (valor atribuído à variável)
local laranjas = 10

laranjas = laranjas + 5

-- print (imprime a informação dentro do console)
print (laranjas)
print ("O valor de Laranjas é: " .. laranjas)

local bananas = 5
print (bananas)
print (bananas + laranjas)


-- Soma

local frutas = laranjas + bananas
print (frutas)
print ( "A quantidade total de frutas é de " .. frutas)

local cesta = 0
cesta = laranjas + bananas
print ("A soma entre as variáveis laranjas e bananas é " .. cesta)

print ( "A sua cesta possui " .. cesta + frutas .. " frutas")


-- Subtração
cesta = laranjas - bananas
bananas = bananas - 1
print ("A quantidade de bananas é de: " .. bananas)

-- Multiplicação

local carro = 8
print ("O valor de um carro é de " .. carro)

carro = carro * 2
print ("O valor de dois carros é de " .. carro)

-- Exemplo divisão utilizando multiplicação
carro = carro * 0.5
print ("O valor de 50% do carro é de " .. carro)

-- Divisão
local gato = 6
gato = gato / 2
print ("A  divisão final de gato é de " .. gato)

local arvore = 97.5
arvore = arvore / 3
print ( "A divisão final de árvores é de " .. arvore)