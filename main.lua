Object = require "classic"

require "Game"
require "checkWin"

function love.load()

	love.graphics.setBackgroundColor(0.5, 0.5, 0.5)

	winFont = love.graphics.newFont("assets/fonts/monogram_extended.ttf", 50)

	love.window.setTitle("Vier Op Een Rij")

	power = false

end

function love.keypressed(key)
	if power then 
		game:keypressed(key)
	elseif key == 's' then 
		game = Game()
	end
end

function love.draw()
	if power then 
		game:draw()
	end
end