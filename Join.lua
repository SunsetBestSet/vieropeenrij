Join = Object:extend()

function Join:new()
	self.client = sock.newClient("localhost", 22122)
	self.client:setSerialization(bitser.dumps, bitser.loads)
	self.client:on("connect", function(data)
        lobby.connecttxt = "Connected!"
    end)
    self.client:on("startGame", function(data)
        lobby.join:initGame()
        print("b")
    end)
    self.client:on("yourTurn", function(data)
        lobby.join.game.myTurn = true
    end)
    self.client:connect()
end


function Join:update()
	self.client:update()
end

function Join:draw()
	if screen == "multigame" then
        self.game:draw()
    end
end

function Join:initGame()
    self.game = Multigame(2)
    screen = "multigame"
end