-- GUN GAME

function love.load()

    player = {
        x = 500,
        y = 500,
        speed = 350,
        size = 50
    }

    bullets = {}
    enemies = {}

    spawnTimer = 0
    spawnInterval = 2

    lives = 3
    score = 0
    enemySpeedMultiplier = 1

    gameOver = false

    love.graphics.setBackgroundColor(0.1, 0.1, 0.1)
end

function love.update(dt)

    if gameOver then return end

    if love.keyboard.isDown("w") then
        player.y = player.y - player.speed * dt
    end

    if love.keyboard.isDown("s") then
        player.y = player.y + player.speed * dt
    end

    if love.keyboard.isDown("a") then
        player.x = player.x - player.speed * dt
    end

    if love.keyboard.isDown("d") then
        player.x = player.x + player.speed * dt
    end

    spawnTimer = spawnTimer + dt
    if spawnTimer >= spawnInterval then
        spawnEnemy()
        spawnTimer = 0
    end

    for i = #bullets, 1, -1 do
        local bullet = bullets[i]
        bullet.y = bullet.y - bullet.speed * dt

        if bullet.y < 0 then
            table.remove(bullets, i)
        end
    end

    for i = #enemies, 1, -1 do
        local enemy = enemies[i]
        enemy.y = enemy.y + enemy.speed * dt

        if enemy.y > love.graphics.getHeight() then
            table.remove(enemies, i)
        end
    end

    for i = #enemies, 1, -1 do
        for j = #bullets, 1, -1 do
            if checkCollision(enemies[i], bullets[j]) then
                table.remove(enemies, i)
                table.remove(bullets, j)

                score = score + 1
                enemySpeedMultiplier = 1 + (score * 0.1)

                break
            end
        end
    end

    for i = #enemies, 1, -1 do
        if checkPlayerCollision(player, enemies[i]) then
            table.remove(enemies, i)
            lives = lives - 1

            if lives <= 0 then
                gameOver = true
            end
        end
    end
end

function shoot()
    if #bullets < 5 and not gameOver then
        table.insert(bullets, {
            x = player.x + player.size/2 - 5,
            y = player.y,
            speed = 500,
            width = 10,
            height = 20
        })
    end
end

function spawnEnemy()
    table.insert(enemies, {
        x = math.random(0, love.graphics.getWidth() - 50),
        y = -50,
        speed = math.random(100, 200) * enemySpeedMultiplier,
        size = 50
    })
end

function checkCollision(a, b)
    return a.x < b.x + b.width and
           a.x + a.size > b.x and
           a.y < b.y + b.height and
           a.y + a.size > b.y
end

function checkPlayerCollision(a, b)
    return a.x < b.x + b.size and
           a.x + a.size > b.x and
           a.y < b.y + b.size and
           a.y + a.size > b.y
end

function love.keypressed(key)
    if key == "space" then
        shoot()
    end

    if key == "r" and gameOver then
        love.load()
    end
end

function love.draw()

    love.graphics.setColor(0, 1, 0)
    love.graphics.rectangle("fill", player.x, player.y, player.size, player.size)

    love.graphics.setColor(1, 1, 0)
    for _, bullet in ipairs(bullets) do
        love.graphics.rectangle("fill", bullet.x, bullet.y, bullet.width, bullet.height)
    end

    love.graphics.setColor(1, 0, 0)
    for _, enemy in ipairs(enemies) do
        love.graphics.rectangle("fill", enemy.x, enemy.y, enemy.size, enemy.size)
    end

    love.graphics.setColor(1, 0, 0)
    for i = 1, lives do
        love.graphics.rectangle("fill", 20 + (i * 30), 20, 20, 20)
    end

    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Score: " .. score, 20, 60)

    if gameOver then
        love.graphics.printf(
            "GAME OVER NOOB\nPressione R para reiniciar",
            0,
            love.graphics.getHeight()/2 - 20,
            love.graphics.getWidth(),
            "center"
        )
    end
end
