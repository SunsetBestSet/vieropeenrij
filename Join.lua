Join = Object:extend()

function Join:new()
    -- sets up client to connect to server
	self.client = sock.newClient("localhost", 22122)
	self.client:setSerialization(bitser.dumps, bitser.loads)

    -- defines what to do on certain triggers
	self.client:on("connect", function(data) --this one does work tho
        lobby.connecttxt = "Connected!"
    end)
    self.client:on("startGame", function(data) --it's supposed to execute this when the host sends the message but it doesn't
        lobby.join:initGame()
        print("b")
    end)
    self.client:on("yourTurn", function(data)
        lobby.join.game.myTurn = true
    end)

    -- connects to the server
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
    -- starts game
    self.game = Multigame(2)
    screen = "multigame"
end