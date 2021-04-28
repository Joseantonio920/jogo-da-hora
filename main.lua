lg=love.graphics
lk=love.keyboard
function math.sign(num)
	return num>0 and 1 or num<0 and -1 or 0
end
function math.clamp(num, min, max)
	return num<min and min or num>max and max or num
end

local World=require "scr/World"
local world=World:new("", 1024, 256)

local Player=require "scr/Player"
world:addObj(Player:new(lg.getWidth()/2, lg.getHeight()/2))
local Block=require "scr/Block"
world:addObj(Block:new(lg.getWidth()/2, lg.getHeight()/2+lg.getHeight()/4, 64, 16))
world:addObj(Block:new(lg.getWidth()/2-160, lg.getHeight()/2+lg.getHeight()/4-8, 128, 32))
world:addObj(Block:new(lg.getWidth(), lg.getHeight()-16, 1024, 32))
world:addObj(Block:new(lg.getWidth()+lg.getWidth()/2, lg.getHeight()-40, 16, 16))

function love.draw()
	world:draw()
	lg.setColor(.30, .60, .86)
    lg.rectangle('fill', 0, 0, 1024, 256)
end

function love.update(dt)
	world:update(dt)
end
