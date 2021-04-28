local Cam=require "scr/Cam"

local World={}
World.objs={}

function World:new(path, w, h)
	local init={
		w=w or nil,
		h=h or nil,
		
		cam=Cam:new(0, 0, w-lg.getWidth()/2, h-lg.getHeight()/2)
	}
	
	return setmetatable(init, {__index=self})
end

function World:draw()
	self.cam:open()
	for i, obj in ipairs(self.objs) do
		obj:draw()
	end
	self.cam:back()
end

function World:update(dt)
	for i, obj in ipairs(self.objs) do
		obj:update(dt)
	end
end

function World:addObj(obj)
	obj.world=self
	table.insert(self.objs, obj)
end

function World:colission(obj, x, y)
	for i, obj2 in ipairs(self.objs) do
	 	if obj~=obj2 and (x-obj.w/2<obj2.x+obj2.w/2 and x+obj.w/2>obj2.x-obj2.w/2 and y-obj.h/2<obj2.y+obj2.h/2 and y+obj.h/2>obj2.y-obj2.h/2) then
	 	 	return true
	 	end
	end
	return false
end

return World