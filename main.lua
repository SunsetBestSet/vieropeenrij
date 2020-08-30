--[[

SUPER VIER OP EEN RIJ

This game uses sounds from freesounds:
click.wav by THE_bizniss (https://freesound.org/people/THE_bizniss/sounds/39562/)

]]

-- require libs
Object = require "libs/classic"
sock = require "libs/sock"
bitser = require "libs/bitser"
suit = require "libs/suit"

-- require game files 
require "Game"
require "Localgame"
require "Join"
require "Host"
require "Lobby"
require "Multigame"
require "checkWin"
require "super"

function love.load()
	screen = "startmenu"
	love.graphics.setBackgroundColor(0.9, 0.9, 0.9)

	loadAssets()
end

function loadAssets()
	winFont = love.graphics.newFont("assets/fonts/monogram_extended.ttf", 50)
	defaultFont = love.graphics.newFont("assets/fonts/monogram_extended.ttf", 30)
	sound = love.audio.newSource("assets/sounds/click.wav", "static")

	love.graphics.setFont(defaultFont)
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
	elseif screen == "multigame" then
		print(lobby.type)
		if lobby.type == "host" then
			lobby.host.game:draw()
		elseif lobby.type == "join" then
			lobby.join.game:draw()
			print("a")
		end
	end
	suit.draw(dt)
end

function love.update()
	if screen == "lobby" then 
		lobby:update()
	elseif screen == "multigame" then
		if lobby.type == "host" then
			lobby.host.game:update()
		elseif lobby.type == "join" then
			lobby.join.game:update()
		end
	end
end