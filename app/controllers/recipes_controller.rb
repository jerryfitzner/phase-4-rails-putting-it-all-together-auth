class RecipesController < ApplicationController
  # before_action :authorize
  

  def index
    render json: Recipe.all
    # user = User.find_by(id: session[:user_id])
    # if user&.authenticate
  end

  def create
    recipe = @current_user.recipes.create!(recipe_params)
    render json: recipe, status: :created
  end

  private

  def recipe_params
    params.permit(:title, :instructions, :minutes_to_complete)
  end
end
