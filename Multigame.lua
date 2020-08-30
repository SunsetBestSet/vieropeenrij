Multigame = Game:extend()

function Localgame:new(gameType)
	screen = "localgame"
	self:setupBoard()
	self.turn = 1
	self.colour = gameType
	if self.colour == 1 then
		self.myTurn = true
	elseif self.colour == 2 then
		self.myTurn = false
	end
end

function Localgame:keypressed(key)
	local x = tonumber(key)
	if x ~= nil and self.win == 0 and self.myTurn then 
		for i = #self.bord, 1, -1 do 
			if x > 0 and x < 8 then 
				if self.bord[x][i] == 0 then 
					self.bord[x][i] = self.colour

					self:tieCheck()
					self:diaWin(self.bord)
					self:verticalWin(self.bord)
					self:horizontalWin(self.bord)

					self.myTurn = false

					if self.colour == 1 then
						lobby.host.server:sendToAll("yourTurn", true)
					elseif self.colour == 2 then
						lobby.join.client:send("yourTurn", true)
					end

					return
				end 
			end
		end
	end

	if key == 'r' then

		self:setupBoard()

	end
end

function Multigame:draw()
	self:drawBoard()
	self:drawWin()
	self:drawTurn()
	local txt
	if self.myTurn then
		txt = "It's your turn!"
	else
		txt = "Waiting for other player..."
	end
	love.graphics.print(txt, 0,0)
end

function Multigame:update()
end