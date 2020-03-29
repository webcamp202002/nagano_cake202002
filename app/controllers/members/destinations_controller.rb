class Members::DestinationsController < Members::BaseController
	before_action :authenticate_member!
	def index
		@destination = Destination.new
		@destinations = Destination.all
	end

	def create
		@destination = Destination.new(destination_params)
		@destination.member_id = current_member.id
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
			redirect_to members_destinations_path
		else
			redirect_to members_destinations_path
		end
    end
	def destroy
		@destination = Destination.find(params[:id])
		@destination.destroy
		redirect_to members_destinations_path 
	end


private

	def destination_params
		params.require(:destination).permit(:member_id, :address, :postcode, :name, :address)
	end
end
