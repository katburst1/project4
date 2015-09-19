class RecipesController < ApplicationController
	before_action :find_recipe, only: [:show, :edit, :update, :destroy]

	def index
		@recipes = Recipe.all.order("created_at DESC")
	end

	def show
		@recipe = Recipe.find(params[:id])
	end

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.new(recipe_params)

		if @recipe.save
			redirect_to root_path
		else 
			render 'new'
		end
	end

	def edit
		
	end

	def update
		if @recipe.update(recipe_params)
			redirect_to recipe_path(@recipe)
		else
			render 'edit'
		end
	end

	def destroy
		@recipe.destroy
		redirect_to root_path
	end


	private

		def recipe_params
			params.require(:recipe).permit(:name, :description, :user)
		end

		def find_recipe
			@recipe = Recipe.find(params[:id])
		end

end
