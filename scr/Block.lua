local Block={}

function Block:new(x, y, w, h)
	local init={
	 	x=x or nil,
	 	y=y or nil,
	 	w=w or nil,
	 	h=h or nil
	}
	
	return setmetatable(init, {__index=self})
end

function Block:draw()
	lg.rectangle("fill", self.x-self.w/2, self.y-self.h/2, self.w, self.h)
end

function Block:update(dt)
	
end

return Block