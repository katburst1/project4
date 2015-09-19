class RecipesController < ApplicationController
	before_action :find_recipe, only: [:show, :edit, :update, :destroy]

	def index
		@recipes = Recipe.all.order("created_at DESC")
	end

	def show
	end

	def new
		@recipe = current_user.recipes.build
		@categories = Category.all.map{ |f| [f.name, f.id]}
	end

	def create
		@recipe = current_user.recipes.build(recipe_params)
		@recipe.category_id = params[:category_id]
		if @recipe.save
			redirect_to root_path
		else 
			render 'new'
		end
	end

	def edit
		@categories = Category.all.map{ |c| [c.name, c.id] }
	end

	def update
		@recipe.category_id = params[:category_id]
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
			params.require(:recipe).permit(:name, :description, :author, :category_id)
		end

		def find_recipe
			@recipe = Recipe.find(params[:id])
		end

end
