require "checkWin"

function love.load()

-- door speler laten bepalen at some point
bord = {
	{0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0},
}

turn = 1


end

function love.keypressed(key)
	x = tonumber(key)
	for i = 6, 1, -1 do 
		if bord[x][i] == 0 then 
			bord[x][i] = turn
			
			if turn == 1 then 
				turn = 2 
			else 
				turn = 1 
			end 

			diagonalWin2(bord)
			verticalWin(bord)
			horizontalWin(bord)

			return
		end 
	end
end

function love.draw()
	for k, v in pairs(bord) do
		x = 0 + (k-1) * 20
	  for l, w in pairs(bord[k]) do 
	  	love.graphics.print(w, x, 0 + (l-1) * 20)
	  end
	end
end

