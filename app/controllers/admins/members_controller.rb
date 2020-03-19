class Admins::MembersController < Admins::BaseController
	def index
		@members = Member.all
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

private
def member_params
	prams.require(:member).permit(:last_name,:first_name,:kana_last_name,:kana_first_name,:phone_number,:postcode,:address,:is_withdrow)
end
end
