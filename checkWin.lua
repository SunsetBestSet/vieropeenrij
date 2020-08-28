function diaWin(field) 
    local boardHeight = 7
    for x = 2, #field + 2, 1 do
        local dia1 = ''

        if x >= 2 then --anders kan er geen diagonaal zijn
            local pointer = x
            for y = 1, boardHeight, 1 do --hij gaat hier naar beneden
                if y ~= boardHeight and pointer > 0 then
                    print(pointer)
                    if pointer < 8 then dia1 = dia1 .. field[pointer][y] end
                    pointer = pointer - 1 -- 1 naar links
                end
            end
        end 
        
        if string.match(dia1, '1111') then
            print("blauw heeft gewonnen dia")
            return
        end
        if string.match(dia1, '2222') then
            print("rood heeft gewonnen dia")
            return
        end
    end
    
    for x = #field, -1, -1 do
        local dia2 = ''

        if x <= 6 then --anders kan er geen diagonaal zijn
            local pointer = x
            for y = 1, boardHeight, 1 do --hij gaat hier naar beneden
                if y ~= boardHeight and pointer > 0 then
                    print(pointer)
                    if pointer > 1 and pointer < 8 then dia2 = dia2 .. field[pointer][y] end
                    pointer = pointer + 1 
                end
            end
        end 
        
        if string.match(dia2, '1111') then
            print("blauw heeft gewonnen dia")
            return
        end
        if string.match(dia2, '2222') then
            print("rood heeft gewonnen dia")
            return
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