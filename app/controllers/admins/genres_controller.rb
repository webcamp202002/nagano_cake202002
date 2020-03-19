class Admins::GenresController < Admins::BaseController
	def index
		@genre = Genre.new
		@genres = Genre.all
	end

	def create

		@genre = Genre.new(genre_params)
		@genre.save
		redirect_back(fallback_location: admins_genres_path(@genre))
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def update
		@genre = Genre.find(params[:id])
		if @genre.update(genre_params)
			redirect_to admins_genres_path
		else
			redirect_to edit_admins_genres_path
		end
	end

	private
	def genre_params
		params.require(:genre).permit(:name,:status)
	end

end
