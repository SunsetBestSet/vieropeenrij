require "checkWin"

function love.load()

	-- door speler laten bepalen at some point
	
	setupBoard()

	turn = 1

	love.graphics.setBackgroundColor(0.5, 0.5, 0.5)

	winFont = love.graphics.newFont("assets/fonts/monogram_extended.ttf", 50)
	background = love.graphics.newImage("assets/images/elephant.jpg")

	love.window.setTitle("Vier Op Een Rij")

end

function setupBoard()

bord = {
		{0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0},
}

win = 0

end

win = 0;

function love.keypressed(key)
	x = tonumber(key)
	if x ~= nil and win == 0 then 
		for i = 6, 1, -1 do 
			if x > 0 and x < 8 then 
				if bord[x][i] == 0 then 
					bord[x][i] = turn
					
					if turn == 1 then 
						turn = 2 
					else 
						turn = 1 
					end 


					diaWin(bord)
					verticalWin(bord)
					horizontalWin(bord)


					return
				end 
			end
		end
	end

	if key == 'r' then

		setupBoard()

	end
end

function love.draw()
	--[[for k, v in pairs(bord) do
		x = 0 + (k-1) * 20
	  for l, w in pairs(bord[k]) do 
	  	love.graphics.print(w, x, 0 + (l-1) * 20)
	  end
	end]]
	love.graphics.draw(background, 0, 0, 0, 0.3, 0.3)
	drawBoard()
	drawWin()
end

function drawWin()
	love.graphics.setColor(0, 0, 0)
	love.graphics.rectangle("fill", 530, 200, 200, 50)
	love.graphics.setColor(1, 1, 1)
	if win == 1 then
		love.graphics.print("blauw wint", winFont, 550, 200)
	elseif win == 2 then
		love.graphics.print("rood wint", winFont, 550, 200)
	end
end

function drawBoard()
	for x, v in pairs(bord) do 
		for y, w in pairs(bord[x]) do 
			if w == 1 then love.graphics.setColor(0, 0, 1) end
			if w == 2 then love.graphics.setColor(1, 0, 0) end
			if w == 0 then love.graphics.setColor(1, 1, 1, 1) end
			love.graphics.rectangle('fill', x * 60, y * 60, 50, 50)
		end
	end
end