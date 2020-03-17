class Admins::GenresController < ApplicationController
	def index
		@genre = Genre.new
		@genres = Genre.all
	end
	def create
		@genre = Genre.new
		@genre.save
		redirect_back(fallback_location: genre_path(genre))

	end
	def edit
		@genre.find(params[:id])
	end
	def update
	end
	def genre_params
		params.require_params(:genre).permit(:name,:status)
	end

end
