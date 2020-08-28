Object = require "classic"

require "Localgame"
require "checkWin"

function love.load()
	love.graphics.setBackgroundColor(0.5, 0.5, 0.5)
	winFont = love.graphics.newFont("assets/fonts/monogram_extended.ttf", 50)
	love.window.setTitle("Vier Op Een Rij")
	power = false
end

function love.keypressed(key)
	if power then 
		localgame:keypressed(key)
	elseif key == 's' then 
		localgame = Localgame() -- start Localgame
	end
end

function love.draw()
	if power then 
		localgame:draw()
	end
end