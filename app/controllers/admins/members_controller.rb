class Admins::MembersController < Admins::BaseController
	before_action :authenticate_admin!
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
		if @member.update(member_params)
			redirect_to admins_member_path(@member)
		else
			redirect_to edit_admins_member_path(@member)
		end
	end

private
def member_params
	params.require(:member).permit(:last_name,:first_name,:kana_last_name,:kana_first_name,:phone_number,:postcode,:address,:is_withdrow)
end
end
