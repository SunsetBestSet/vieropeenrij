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