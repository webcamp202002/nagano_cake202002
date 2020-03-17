class Admin::GenresController < ApplicationController
	def index
		@genre = Genre.new
		@genres = Genre.all
	end
	def create
		@genre = Genre.new
		@genre.save

	end
	def edit
		@genre.
	end
	def update
	end

end
