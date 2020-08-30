Host = Object:extend()

function Host:new()
	self.server = sock.newServer("*", 22122, 1)
	self.server:setSerialization(bitser.dumps, bitser.loads)
	self.server:setSendMode("reliable")
	self.showStartGame = false

	self.server:on("connect", function(data, client)
		lobby.host.showStartGame = true
		lobby.host.client = client
		print("kanker")
	end)
	self.server:on("yourTurn", function(data)
		lobby.host.game.myTurn = true
	end)

end

function Host:update()
	self.server:update()
	if self.showStartGame then 
		if suit.Button("Start Game", love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 300, 70).hit then
			self:initGame()
		end
	end
end

function Host:draw()
	if screen == "multigame" then
		self.game:draw()
	end
end

function Host:initGame()
	self.server:sendToAll("startGame", true)
	self.game = Multigame(1)
	screen = "multigame"
end