_G.love = require("love")

-- load stage
function love.load()
    _G.mainchar = {
        x = 0,
        y = 0,
        sprite = love.graphics.newImage("sprites/spritesheet.png"),
        animation = {
            direction = "right", -- direction the character is facing
            idle = true, -- is the character idle?
            frame = 1, -- current frame
            max_frames = 8, -- max frames
            speed = 20, -- speed of the animation
            timer = 0.1 -- timer for the animation
        }
    }
    -- 5252x569 sprite size
    SPRITE_WIDTH = 5252
    SPRITE_HEIGHT = 569
    -- quad size
    QUAD_WIDTH = 669
    QUAD_HEIGHT = SPRITE_HEIGHT


    -- quad table
    _G.quads = {}
    for i = 1, mainchar.animation.max_frames do
          -- especifying the quad to be drawn from the spritesheet for the starting point
          -- using quads[i] for the starting point, and using the for loop to increment the x position
    quads[i] = love.graphics.newQuad(QUAD_WIDTH * (i - 1), 0, QUAD_WIDTH, QUAD_HEIGHT, SPRITE_WIDTH, SPRITE_HEIGHT)  
    end
end

-- update stage (dt = delta time - once every 60fps)
function love.update(dt)

    if love.keyboard.isDown("right") then
        mainchar.x = mainchar.x + 1
        mainchar.animation.direction = "right"
        mainchar.animation.idle = false

    elseif love.keyboard.isDown("left") then
        mainchar.x = mainchar.x - 1
        mainchar.animation.direction = "left"
        mainchar.animation.idle = false

    elseif love.keyboard.isDown("up") then
        mainchar.y = mainchar.y - 1
        mainchar.animation.direction = "up"
        mainchar.animation.idle = false

    elseif love.keyboard.isDown("down") then
        mainchar.y = mainchar.y + 1
        mainchar.animation.direction = "down"
        mainchar.animation.idle = false

    else
        mainchar.animation.idle = true
        mainchar.animation.frame = 1
    end




    if not mainchar.animation.idle then
        mainchar.animation.timer = mainchar.animation.timer + dt

        if mainchar.animation.timer > 0.2 then
            mainchar.animation.timer = 0.1
            mainchar.animation.frame = mainchar.animation.frame + 1

            if mainchar.animation.frame > mainchar.animation.max_frames then
                mainchar.animation.frame = 1
            end
        end
    end

end

-- draw stage
function love.draw()
    love.graphics.scale(0.3)
    love.graphics.draw(mainchar.sprite, quads[mainchar.animation.frame], mainchar.x, mainchar.y)


end