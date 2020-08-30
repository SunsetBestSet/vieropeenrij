Localgame = Game:extend()

function Localgame:new()
	screen = "localgame"
	self:setupBoard()
	self.turn = 1
end

function Localgame:keypressed(key)
	local x = tonumber(key)
	if x ~= nil and self.win == 0 then 
		for i = 6, 1, -1 do 
			if x > 0 and x < 8 then 
				if self.bord[x][i] == 0 then 
					self.bord[x][i] = self.turn

					if self.turn == 1 then 
						self.turn = 2 
					else 
						self.turn = 1 
					end 

					self:tieCheck()
					self:diaWin(self.bord)
					self:verticalWin(self.bord)
					self:horizontalWin(self.bord)


					return
				end 
			end
		end
	end

	if key == 'r' then

		self:setupBoard()

	end
end

