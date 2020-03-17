class Admins::membersController < Admins::BaseController
	def index
		@menber = Members.all
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
