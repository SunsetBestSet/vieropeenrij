function diagonalWin(field) 
    local boardHeight = 6
    for k, v in pairs(field) do
        dia1 = ""
        for j = k, boardHeight, 1 do
            dia1 = dia1 .. field[j][j - k + 1]
        end
        
        if string.match(dia1, '1111') then
            print("blauw heeft gewonnen")
        elseif string.match(dia1, '2222') then
            print("rood heeft gewonnen")
        end

        dia2 = ''
        for j = k, boardHeight, 1 do
            dia2 = dia2 .. field[j - k + 1][j]
        end
        
        if string.match(dia2, '1111') then
            print("blauw heeft gewonnen")
        elseif string.match(dia2, '2222') then
            print("rood heeft gewonnen")
        end
    end
end

function diagonalWin2(field) 
    boardHeight = 7
    for i = 1, boardHeight, 1 do
        dia1 = ''
        for j = i, boardHeight, 1 do
            dia1 = dia1 .. field[j][j - i]
            print(dia1)
        end
        if string.match(dia1, '1111') then
            print("blauw heeft gewonnen dia")
        end
        if string.match(dia1, '2222') then
            print("rood heeft gewonnen dia")
        end

        dia2 = ''
        for j = i, boardHeight, 1 do
            dia2 = dia2 .. field[j - i][j]
            print(dia2)
        end
        if string.match(dia2, '1111') then
            print("blauw heeft gewonnen dia")
        end
        if string.match(dia2, '2222') then
            print("rood heeft gewonnen dia")
        end
    end
    
    
end

function verticalWin(field) 
    previousPosition = 0
    boardLenght = 8
    boardHeight = 7
    verticalWinCounterRed = 0
    verticalWinCounterBlue = 0
    for y = 1, boardLenght, 1 do
        for x = 1, boardHeight, 1 do
            if field[x][y] == 2 then
                if previousPosition == field[x][y] then
                    verticalWinCounterRed = verticalWinCounterRed + 1
                    if verticalWinCounterRed == 3 then
                        print("rood heeft gewonnen")
                    end
                end
                previousPosition = 2
                verticalWinCounterBlue = 0
            elseif field[x][y] == 1 then
                if previousPosition == field[x][y] then
                    verticalWinCounterBlue = verticalWinCounterBlue + 1
                    if verticalWinCounterBlue == 3 then
                        print("blauw heeft gewonnen")
                    end
                end
                previousPosition = 1
                verticalWinCounterRed = 0
            else 
                previousPosition = 0
                verticalWinCounterRed = 0
                verticalWinCounterBlue = 0
            end
        end
        verticalWinCounterRed = 0
        verticalWinCounterBlue = 0
        previousPosition = 0
    end
end

function horizontalWin(field) 
    previousPosition = 0
    boardLenght = 8
    boardHeight = 7
    horizontalWinCounterRed = 0
    horizontalWinCounterBlue = 0
    for x = 1, boardHeight, 1 do
        for y = 1, boardLenght, 1 do
            if field[x][y] == 2 then
                if previousPosition == field[x][y] then
                    horizontalWinCounterRed = horizontalWinCounterRed + 1 
                    if horizontalWinCounterRed == 3 then
                        print("rood heeft gewonnen")
                    end
                end
                previousPosition = 2
                horizontalWinCounterBlue = 0
            elseif field[x][y] == 1 then
                if previousPosition == field[x][y] then
                    horizontalWinCounterBlue = horizontalWinCounterBlue + 1
                    if horizontalWinCounterBlue == 3 then
                        print("blauw heeft gewonnen")
                    end
                end
                previousPosition = 1
                horizontalWinCounterRed = 0
            else 
                previousPosition = 0
                horizontalWinCounterRed = 0
                horizontalWinCounterBlue = 0
            end
        end
        horizontalWinCounterRed = 0
        horizontalWinCounterBlue = 0
        previousPosition = 0
    end
end