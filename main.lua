ripple = {}
ripples = {}

function love.load()
	love.graphics.setBackgroundColor(255,255,255)
	love.graphics.setColor(0,0,0)
end

function love.update(dt)
	if #ripples == 0 then return end
	for x = 1, #ripples do
		ripple.update(ripples[x], dt, x)
	end
end

function love.draw()
	if #ripples == 0 then return end
	for x = 1, #ripples do
		ripple.draw(ripples[x])
	end
end

function love.mousereleased(x,y)
	table.insert(ripples, ripple:new(x, y, 150, 20))
end

function ripple:new(x, y, maxRadius, freq, infertile)
	local self = {}
	self.x = x
	self.y = y
	self.maxRadius = maxRadius
	self.radius = 1
	self.freq = freq
	self.infertile = infertile
	self.index = #ripples + 1
	return self
end

function ripple:update(dt, x)
	if not self then return end
	self.index = x
	if self.freq < 1 then self.freq = 1 end
	--print(#ripples, self.index, dt)
	self.radius = self.radius + dt * self.freq * 2
	if self.radius > self.maxRadius then ripple.kill(self) end
	if self.maxRadius < 5 then ripple.kill(self) end
	if not self.infertile then
		if self.radius % self.freq <= dt * 50 then
			ripple.echo(self)
			self.infertile = true
		end
	end
end

function ripple:kill()
	table.remove(ripples, self.index)
end

function ripple:echo()
	table.insert(ripples, ripple:new(self.x, self.y, self.maxRadius - self.freq,
		self.freq * 0.9))
end

function ripple:draw()
	love.graphics.circle("line", self.x, self.y, self.radius)
end
