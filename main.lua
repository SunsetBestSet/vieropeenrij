Object = require "libs/classic"
sock = require "libs/sock"
bitser = require "libs/bitser"

require "Game"
require "Localgame"
require "Client"
require "Lobby"
require "checkWin"
require "super"

function love.load()
	love.graphics.setBackgroundColor(0.5, 0.5, 0.5)
	winFont = love.graphics.newFont("assets/fonts/monogram_extended.ttf", 50)
	love.window.setTitle("Vier Op Een Rij")
	screen = "startmenu"
end

function love.keypressed(key)
	if screen == "localgame" then 
		localgame:keypressed(key)
	elseif key == 's' then 
		localgame = Localgame() -- start Localgame
	elseif key == 'l' then
		lobby = Lobby() --creates lobby
	end
end

function love.draw()
	if screen == "localgame" then 
		localgame:draw()
	elseif screen == "lobby" then
		lobby:draw()
	end
end

function love.update()
	if screen == "lobby" then 
		lobby:update()
	end
end