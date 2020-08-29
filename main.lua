Object = require "libs/classic"
sock = require "libs/sock"
bitser = require "libs/bitser"
suit = require "suit"

require "Game"
require "Localgame"
require "Client"
require "Lobby"
require "checkWin"
require "super"

function love.load()
	love.graphics.setBackgroundColor(0.9, 0.9, 0.9)
	winFont = love.graphics.newFont("assets/fonts/monogram_extended.ttf", 50)
	love.graphics.setFont(winFont)
	love.window.setTitle("Vier Op Een Rij")
	screen = "startmenu"
	sound = love.audio.newSource("assets/sounds/click.wav", "static")
end

function love.keypressed(key)
	if screen == "localgame" then 
		localgame:keypressed(key)
	elseif key == 's' then 
		localgame = Localgame() -- start Localgame
	elseif key == 'l' then
		lobby = Lobby() --creates lobby
	end
	suit.keypressed(key)
end

function love.textinput(t)
	suit.textinput(t)
end

function love.draw(dt)
	if screen == "localgame" then 
		localgame:draw()
	elseif screen == "lobby" then
		lobby:draw()
	end
	suit.draw(dt)
end

function love.update()
	if screen == "lobby" then 
		lobby:update()
	end
end