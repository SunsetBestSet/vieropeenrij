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
			--verticalWin(bord)
			--horizontalWin(bord)

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

function arrayToBoard(field) 
    stringMessage = new String(">>> :black_large_square::zero::one::two::three::four::five::six:\n");
    heightNumber = new String();
    boardHeight = 7
    boardLenght = 8
    for x = 1, boardHeight, 1 do
        heightNumber = wordNumberArray[x];
        stringMessage += heightNumber;
        for y = 1, boardLenght, 1) do
            if field[x][y] == 0 then
                stringMessage += ":white_large_square:";
                amountEmptyPlaces = amountEmptyPlaces + 1
            elseif field[x][y] == 1 then
                stringMessage += ":blue_circle:";
            else 
                stringMessage += ":red_circle:";
            end
        end
        stringMessage += "\n";
    end
    if amountEmptyPlaces == 0 then
        stringMessage += "\nThe game is a draw.";
    else
        amountEmptyPlaces = 0;
    end
end