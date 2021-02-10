Game = Object:extend()

function Game:new(p)
	self:setupBoard()
	self.turn = 1
	screen = "game"
	if p == 1 then 
		self.ai = true
	else
		self.ai = false
	end
	self.canMove = true
end

function Game:setupBoard()

	self.bord = {
		{0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0},
	}

	self.win = 0

end

function Game:draw()
	self:drawBoard()
	self:drawWin()
	self:drawTurn()
end

function Game:drawWin()
	love.graphics.setColor(0, 0, 0)
	love.graphics.rectangle("fill", 530, 200, 250, 50)
	love.graphics.setColor(1, 1, 1)
	if self.win == 1 then
		love.graphics.print("blauw wint", winFont, 550, 200)
	elseif self.win == 2 then
		love.graphics.print("rood wint", winFont, 550, 200)
	elseif self.win == 3 then
		love.graphics.print( "gelijkspel", winFont, 550, 200)
	end
end
function Game:drawTurn()
	love.graphics.setColor(0, 0, 0)
	love.graphics.rectangle("fill", 530, 280, 250, 50)
	love.graphics.setColor(1, 1, 1)
	if self.turn == 1 then
		love.graphics.print("blauw", winFont, 550, 280)
	else
		love.graphics.print("rood", winFont, 550, 280)
	end
end

function Game:drawBoard()
	for x, v in pairs(self.bord or {}) do 
		for y, w in pairs(self.bord[x]) do 
			if w == 1 then love.graphics.setColor(0, 0, 1) end
			if w == 2 then love.graphics.setColor(1, 0, 0) end
			if w == 0 then love.graphics.setColor(1, 1, 1, 1) end
			love.graphics.rectangle('fill', x * 60, y * 60, 50, 50)
		end
	end
end

function Game:tieCheck()
	for x, v in pairs(self.bord) do 
		for y, w in pairs(self.bord[x]) do 
			if w == 0 then return end
		end
	end
	self.win = 3
end

function Game:keypressed(key)
	if self.ai == false then 
		local x = tonumber(key)
		if x ~= nil and self.win == 0 then 
			for i = 6, 1, -1 do 
				if x > 0 and x < 8 and self.canMove then 
					if self.bord[x][i] == 0 then 
						self.bord[x][i] = self.turn

						if self.turn == 1 then 
							self.turn = 2 
						elseif self.turn == 2 then
							self.turn = 1 
						end 

						self:checkWin(self.bord)

						if self.ai then 
							self:AITurn()
						end

						return
					end 
				end
			end
		end
	end

	if key == 'r' then

		self:setupBoard()

	end
end

function Game:AITurn()

end

function Game:minimax(node, depth, maximizingPlayer)
	--[[
		if depth = 0 or node is a terminal node then
        	return the heuristic value of node
   		if maximizingPlayer then
        	value := −∞
        	for each child of node do
            	value := max(value, minimax(child, depth − 1, FALSE))
       		return value
    	else (* minimizing player *)
        	value := +∞
	        for each child of node do
	            value := min(value, minimax(child, depth − 1, TRUE))
	        return value
	        ]]
	if depth == 0 or node.isTerminal then
		return node.value
	end

	if maximizingPlayer then 
		node.value = math.inf

	else -- minimizing player

	end
end