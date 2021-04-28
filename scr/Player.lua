local Player={}
Player.world={}
Player.w=10
Player.h=10

Player.hspd=0
Player.vspd=0
Player.spd=2

Player.left=0
Player.right=0
Player.jump=0

function Player:new(x, y)
	local init={
		x=x or nil,
		y=y or nil
	}
	
	return setmetatable(init, {__index=self})
end

function Player:draw()
	lg.rectangle("fill", self.x-self.w/2, self.y-self.h/2, self.w, self.h)
end

function Player:update(dt)
	if lk.isDown("a") then
	 	self.left=1
	end
	if lk.isDown("d") then
	 	self.right=1
	end
	if lk.isDown("space") then
	 	self.jump=1
	end
	self.hspd=(self.right-self.left)*self.spd
	
	if self.world:colission(self, self.x, self.y+1) then
	 	if self.jump==1 then
	 	 	self.vspd=-4
	 	end
	else
	 	self.vspd=self.vspd+.2
	end
	
	if self.world:colission(self, self.x+self.hspd, self.y) then
	 	while not self.world:colission(self, self.x+math.sign(self.hspd), self.y) do
	 	 	self.x=self.x+math.sign(self.hspd)
	 	end
	 	self.hspd=0
	end
	self.x=self.x+self.hspd
	if self.world:colission(self, self.x, self.y+self.vspd) then
	 	while not self.world:colission(self, self.x, self.y+math.sign(self.vspd)) do
	 	 	self.y=self.y+math.sign(self.vspd)
	 	end
	 	self.vspd=0
	end
	self.y=self.y+self.vspd
	
	self.left=0
	self.right=1
	self.jump=1
	
	self.world.cam:set(self.x, self.y)
end

return Player