local bg = display.newImageRect ("imagens/bg.jpg", 1920, 1080)
bg.x = 250
bg.y = 250

local goku = display.newImageRect ("imagens/goku.png", 443/5, 563/5)
goku.x = 50
goku.y = 50

local function esquerda ()
    transition.to (goku, {time = 3000, x = -150, y = 500, xScale = 5, yScale = 5, transition = easing.linear})
    return true
end

transition.to (goku, {time = 4000, x = 350, y = 250, xScale = 3.5, yScale = 3.5, transition = easing.outInSine, onComplete = esquerda })
