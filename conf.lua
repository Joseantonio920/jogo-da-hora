function love.conf(t)
	t.console=false
	t.window.title="jogo da hora"
	t.window.icon=nil
	t.window.width=512
	t.window.height=256
	t.window.minwidth=512
	t.window.minheight=256
	t.window.borderless=true
	t.window.resizable=false
	t.window.fullscreen=false
	t.window.fullscreentype="desktop"
	t.window.vsync=true
	t.window.display=nil
	t.window.usedpiscale=false
	t.window.highdpiscale=false
	t.window.dpiscale=1
	t.window.x=nil
	t.window.y=nil
	
	t.modules.audio=true
	t.modules.sound=true
	t.modules.physics=false
	t.modules.mouse=false
	t.modules.math=true
	t.modules.keyboard=true
	t.modules.joystick=false
	t.modules.image=true
	t.modules.data=true
	t.modules.event=true
	t.modules.font=true
	t.modules.graphics=true
	t.modules.window=true
	t.modules.video=false
	t.modules.touch=true
	t.modules.thread=true
	t.modules.system=true
end