-- transition.to (circulo, {time = 3000, y = 400})


-- local circulo1 = display.newCircle (150, 50, 30)
-- transition.to (circulo1, {time = 3000, y = 400, delta = true})

-- local circulo2 = display.newCircle (220, 50, 30)
-- transition.to (circulo2, {time = 3000, y = 400, iterations = 4, transition=easing.outElastic})

-- local retangulo = display.newRect ( 200, 250, 50, 70)
-- transition.to (retangulo, {time = 3000, rotation = 360, yScale = 2, alpha = 0.5, iterations = -1})

local bg = display.newImageRect ("imagens/bg.jpg", 1920, 1080)
bg.x = 250
bg.y = 250

local goku = display.newImageRect ("imagens/goku.png", 443/5, 563/5)
goku.x = 50
goku.y = 50

local function esquerda ()
    function

    transition.to (goku, {time = 3000, x = -150, y = 500, xScale = 5, yScale = 5, transition = easing.linear})
    return true
end

transition.to (goku, {time = 4000, x = 350, y = 250, xScale = 3.5, yScale = 3.5, transition = easing.outInSine, onComplete = esquerda })



