sock = require("sock")
bitser = require("bitser")
function love.load()
    -- Creating a server on any IP, port 22122
    server = sock.newServer("*", 22122)
    server:setSerialization(bitser.dumps, bitser.loads)
     
    -- Called when someone connects to the server
    server:on("connect", function(data, client)
       	local msg = "Hello from the server!"
        client:send("hello", msg)
    end)
end

function love.update(dt)
    server:update()
end