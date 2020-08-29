Join = Object:extend()

function Join:new()
	self.client = sock.newClient("localhost", 22122)
	self.client:setSerialization(bitser.dumps, bitser.loads)
	self.client:on("connect", function(data)
        print("You are connected to the server.")
    end)
    self.client:on("hello", function(msg)
        print("The server replied: " .. msg)
    end)
    self.client:connect()
end


function Join:update()
	self.client:update()
end

function Join:draw()
	love.graphics.print("In Join", winFont, 0, 0)
end