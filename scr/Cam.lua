local Cam={}

function Cam:new(x, y, limX, limY)
	local init={
		x=math.clamp(x, 0, limX) or nil,
		y=math.clamp(y, 0, limY) or nil,
		limX=limX or nil,
		limY=limY or nil
	}
	
	return setmetatable(init, {__index=self})
end

function Cam:open()
	lg.translate(lg.getWidth()/2-self.x, lg.getHeight()/2-self.y)
end

function Cam:back()
	lg.translate(-(lg.getWidth()/2-self.x), -(lg.getHeight()/2-self.y))
end

function Cam:set(x, y)
	self.x=math.clamp(x, 0, self.limX)
	self.y=math.clamp(y, 0, self.limY)
end

return Cam