function Game:checkWin(field)
    self:tieCheck()
    self:diaWin(field)
    self:verticalWin(field)
    self:horizontalWin(field)
end


function Game:diaWin(field) 
    local boardHeight = 7
    for x = 2, #field + 2, 1 do
        local dia1 = ''

        if x >= 2 then --anders kan er geen diagonaal zijn
            local pointer = x
            for y = 1, boardHeight, 1 do --hij gaat hier naar beneden
                if y ~= boardHeight and pointer > 0 then
                    if pointer < 8 then dia1 = dia1 .. field[pointer][y] end
                    pointer = pointer - 1 -- 1 naar links
                end
            end
        end 
        
        if string.match(dia1, '1111') then
            self.win = 1
            return
        end
        if string.match(dia1, '2222') then
            self.win = 2
            return
        end
    end
    
    for x = #field, -4, -1 do
        local dia2 = ''

        if x <= 6 then --anders kan er geen diagonaal zijn
            local pointer = x
            for y = 1, boardHeight, 1 do --hij gaat hier naar beneden
                if y < boardHeight and pointer > 0 and pointer < 8 then
                    dia2 = dia2 .. field[pointer][y] 
                end
                pointer = pointer + 1 
            end
        end 
        
        if string.match(dia2, '1111') then
            self.win = 1
            return
        end
        if string.match(dia2, '2222') then
            self.win = 2
            return
        end
    end

end

function Game:verticalWin(field) 
    local previousPosition = 0
    local boardLenght = 8
    local boardHeight = 7
    local verticalWinCounterRed = 0
    local verticalWinCounterBlue = 0
    for y = 1, boardLenght, 1 do
        for x = 1, boardHeight, 1 do
            if field[x][y] == 2 then
                if previousPosition == field[x][y] then
                    verticalWinCounterRed = verticalWinCounterRed + 1
                    if verticalWinCounterRed == 3 then
                        self.win = 2
                    end
                end
                previousPosition = 2
                verticalWinCounterBlue = 0
            elseif field[x][y] == 1 then
                if previousPosition == field[x][y] then
                    verticalWinCounterBlue = verticalWinCounterBlue + 1
                    if verticalWinCounterBlue == 3 then
                        self.win = 1
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

function Game:horizontalWin(field) 
    local previousPosition = 0
    local boardLenght = 8
    local boardHeight = 7
    local horizontalWinCounterRed = 0
    local horizontalWinCounterBlue = 0
    for x = 1, boardHeight, 1 do
        for y = 1, boardLenght, 1 do
            if field[x][y] == 2 then
                if previousPosition == field[x][y] then
                    horizontalWinCounterRed = horizontalWinCounterRed + 1 
                    if horizontalWinCounterRed == 3 then
                        self.win = 2
                    end
                end
                previousPosition = 2
                horizontalWinCounterBlue = 0
            elseif field[x][y] == 1 then
                if previousPosition == field[x][y] then
                    horizontalWinCounterBlue = horizontalWinCounterBlue + 1
                    if horizontalWinCounterBlue == 3 then
                        self.win = 1
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