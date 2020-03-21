class Members::DestinationsController < Members::BaseController
	def index
		@destination = Destination.new
		@destinations = Destination.all
	end

	def create
		@destination = Destinstion.new(destination_params)
		@destinatipn.memnber.id = current_member.id
		if @destination.save
			redirect_back(fallback_location: members_destinations_path)
		else
			redirect_back(fallback_location: members_destinations_path)
		end
	end

	def edit
		@destination = Destination.find(params[:id])
	end

	def update
		@destination = Destination.find(params[:id])
		if @destination.update(destination_params)
			redirect to members_destinations_path
		else
			redirect to members_destinations_path
		end

	def destroy
		@destination = Destination.find(params[:id])
		@destination.destroy
		redirect_back(fallback_location: members_destinations_path)
	end
end

private

	def destination_params
		params.require(:destination).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :address, :postcode, :phone_number, :email, :name)
	end
end
