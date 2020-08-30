Lobby = Object:extend()

function Lobby:new()
	self.buttons = {"Host a game", "Join a game"}
	screen = "lobby"
	self.screen = "hostjoin"
	self.connecttxt = "Connecting..."
	self.type = ""
end

function Lobby:draw()
	if self.screen == "hostjoin" then
	elseif self.screen == "host" then
		love.graphics.setColor(0,0,0)
		love.graphics.print("Server initiated",0,0)
	elseif self.screen == "join" then
		love.graphics.setColor(0,0,0)
		love.graphics.print(self.connecttxt,0,0)
	end
end

function Lobby:update()
	if self.screen == "hostjoin" then
		for i=1,#self.buttons do 
			if suit.Button(self.buttons[i], 75 + (i-1) * 350, 100, 300,70).hit then
				love.audio.play(sound)
				if self.buttons[i] == "Host a game" then
					self.screen = "host"
					self.type = "host"
					self.host = Host()
					print("host")
				elseif self.buttons[i] == "Join a game" then
					self.screen = "join"
					self.type = "join"
					self.join = Join()
					print("join")
				end
			end
		end
	elseif self.screen == "host" then
		self.host:update()
	elseif self.screen == "join" then
		self.join:update()
	end
end