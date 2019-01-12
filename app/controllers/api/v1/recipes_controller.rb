class Api::V1::StoriesController < Api::V1::BaseController
    def index
        @recipes = Recipe.all
        render json: @recipes
    end
end