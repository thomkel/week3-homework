class DiceController < ApplicationController

	def show_rules
		render 'rules'
	end

	def roll_dice		
		@goal = params["goal"].to_i


		@die1 = rand(1..6)
		@die2 = rand(1..6)

		@image1 = find_image(@die1)
		@image2 = find_image(@die2)

		@dice =  @die1 + @die2

		if @goal == 0 || @goal == nil then

			if @dice == 7 || @dice == 11 then
				@message = "You win!"
			elsif @dice == 2 || @dice == 3 || @dice == 12 then
				@message = "You lose"
			else
				@goal = @dice
				@message = "Your goal is now #{@goal}"
			end

		else
			if @dice == 7 then
				@message = "You lose"
				@goal = nil
			elsif @dice == @goal
				@message = "You win!"
				@goal = nil
			else
				@message = "Keep trying to roll #{@goal}"
			end
		end

		render 'rolldice'
	end

	def find_image (dienum)
		return "https://uchicago.s3.amazonaws.com/d0#{dienum}.png"
	end		

end