class Api::V1::RecipesController < Api::V1::BaseController
    protect_from_forgery with: :null_session
    before_action :set_recipe, only: [ :show, :update ]
    
    def index
        @recipes = Recipe.all  
    end

    def show
    end

    def update
        if @recipe.update(recipe_params)
            render :show
        else
            render_error
        end
    end

    private
    def set_recipe
        @recipe = Recipe.find(params[:id])
        # render json: @recipe
    end

    def recipe_params
        params.require(:recipe).permit(:title, :method)
    end

    def render_error
        render json: { errors: @recipe.errors.full_messages }, status: :unprocessable_entity
    end
end