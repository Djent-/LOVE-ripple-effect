ripple = {}
ripples = {}

function love.load()
	love.graphics.setBackgroundColor(255,255,255)
	love.graphics.setColor(0,0,0)
end

function love.update(dt)
	if #ripples == 0 then return end
	for x = 1, #ripples do

	end
end

function love.draw()
	if #ripples == 0 then return end
	for x = 1, #ripples do

	end
end

function love.mousereleased(x,y)
	table.insert(ripples, ripple:new(x, y, 60, 10))
end

function ripple:new(x, y, maxRadius, freq)
	local self = {}
	self.x = x
	self.y = y
	self.maxRadius = maxRadius
	self.radius = 1
	self.freq = freq
	self.subripple = nil
	return self
end

function ripple:update(dt)
	self.radius = self.radius + dt
end
