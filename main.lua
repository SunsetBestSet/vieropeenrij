Object = require "classic"

require "Game"
require "Localgame"
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
	end
end

function love.draw()
	if screen == "localgame" then 
		localgame:draw()
	end
end