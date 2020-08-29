Host = Object:extend()

function Host:new()
	self.server = sock.newServer("*", 22122)
    self.server:setSerialization(bitser.dumps, bitser.loads)
    --[[self.client = sock.newClient("localhost", 22122)
    self.client:setSerialization(bitser.dumps, bitser.loads)

    self.client:setSchema("move", {
        "column"
    })]]


    self.server:on("connect", function(data, client)
        -- Send a message back to the connected client
        local msg = "Hello from the server!"
        client:send("hello", msg)
    end)

end

function Host:update()
	self.server:update()
end