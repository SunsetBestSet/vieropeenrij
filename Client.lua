Client = Object:extend()

function Client:new()
	self.client = sock.newClient("localhost", 22122)
	self.client:setSerialization(bitser.dumps, bitser.loads)
	self.client:on("connect", function(data)
        print("Client connected to the server.")
    end)
    self.client:on("disconnect", function(data)
        print("Client disconnected from the server.")
    end)
    self.client:on("hello", function(msg)
        print("The server replied: " .. msg)
    end)
    self.client:connect()
    screen = "client"
end


function Client:update()
	self.client:update()
end

function Client:draw()
	love.graphics.print("In Client", winFont, 0, 0)
end