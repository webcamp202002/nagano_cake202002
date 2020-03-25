class HomesController < ApplicationController
	layout 'member'
	def top
		@genres =Genre.where(status: "draft")

	end

end
