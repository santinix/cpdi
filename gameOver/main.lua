vidasText.text = "Vidas: " .. vidas
            if (vidas <= 0) then
                Runtime:removeEventListener ("collision", onCollision)
                Runtime:removeEventListener ("enterFrame", movimentarInimigo)
                timer.pause(png.timer) -- colocar sempre o nome que foi criado o timerWithDelay
                botaoEsq:removeEventListener ("tap", esq)
                botaoDir:removeEventListener ("tap", dir)
                
                local gameOver = display.newImageRect (grupoUI, "imagens/gameover.png", 1080/5,1080/5)
                gameOver.x = display.contentCenterX
                gameOver.y = display.contentCenterY
            end