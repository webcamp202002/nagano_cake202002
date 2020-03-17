class Admins::MembersController < Admins::BaseController
	def index
		@menbers = Member.all
	end

	def show
		@member = Member.find(params[:id])
	end

	def edit
		@member = Member.find(params[:id])
	end

	def update
		@member = Member.find(params[:id])
	end

end
