class Members::MembersController < Members::BaseController
	before_action :authenticate_member!



	def show
		@member = Member.find(params[:id])
		unless current_member.nil? || current_member.id == current_member.id
			flash[:warning] = "アクセス権がありません"
			redirect_to member_path(current_member)
		end
	end



	def edit
		@member = Member.find(params[:id])
		unless current_member.nil? || current_member.id == current_member.id
			flash[:warning] = "アクセス権がありません"
			redirect_to member_path(current_member)
		end
	end




	def update
		if current_member.update(member_params)
			flash[:success] =  "更新に成功しました"
			redirect_to members_member_path(current_member)
		else
			flash[:warning] = "入力内容を確認してください"
			render :edit
		end
	end




	def change

		current_member.update(is_withdrow: true)
		reset_session
		redirect_to root_path
	end

    def destroy
    end





	private


	def ensure_correct_member
		if current_member.id !=  params[:id].to_i
		end
	end



		def member_params
			params.require(:member).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :address, :postcode, :phone_number, :email)
		end

	end
