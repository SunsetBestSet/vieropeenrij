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
require "checkWin"

function love.load()
	love.graphics.setBackgroundColor(0.9, 0.9, 0.9)
	screen = "startscreen"

	loadAssets()
end

function loadAssets()
	winFont = love.graphics.newFont("assets/fonts/monogram_extended.ttf", 50)
	defaultFont = love.graphics.newFont("assets/fonts/monogram_extended.ttf", 30)
	sound = love.audio.newSource("assets/sounds/click.wav", "static")

	love.graphics.setFont(defaultFont)
end

function love.keypressed(key)
	if screen == "game" then 
		game:keypressed(key)
	end
	suit.keypressed(key)
end

function love.draw(dt)
	if screen == "game" then 
		game:draw()
	end
	suit.draw(dt)
end

function love.update()
	if screen == "startscreen" then 
		if suit.Button("Play against the computer", 50,100, 300,30).hit then
			game = Game(1)
		elseif suit.Button("Play against a friend", 450,100, 300,30).hit then
			game = Game(2)
		end
	end
end