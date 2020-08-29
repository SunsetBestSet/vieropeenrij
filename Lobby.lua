Lobby = Object:extend()

function Lobby:new()
	self.buttons = {"Host a game", "Join a game"}
	screen = "lobby"
end

function Lobby:draw()

end

function Lobby:update()
	for i=1,#self.buttons do 
		if suit.Button(self.buttons[i], 75 + (i-1) * 350, 100, 300,70).hit then
			love.audio.play(sound)
		end
	end
end