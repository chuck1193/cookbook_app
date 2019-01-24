class Api::RecipesController < ApplicationController
 def index
   @recipes = Recipe.all 
  render 'index.json.jbuilder'
  end

  def create
    @recipe = Recipe.new(
                          title: params[:title],
                          chef: params[:chef],
                          ingredients: params[:ingredients],
                          directions: params[:direcrtions],
                          prep_time: params[:prep_time]
                        )
    @recipe.save
    render 'show.json.jbuilder'
  end

  def show
    recipe_id = Recipe.find(params[:id])
    @recipe = Recipe.find(:recipe_id)
    render 'show.json.jbuilder'
  end

  def update
    @recipe = Recipe.find(params[:id])

    @recipe.title = params[:title] || @recipe.title
    @recipe.chef = params[:chef] || @recipe.chef
    @recipe.ingredients = params[:ingedrient] || @recipe.ingredients
    @recipe.directions = params[:direction] || @recipe.directions
    @recipe.prep_time = params[:prep_time] || @recipe.prep_time
    @recipe.image_url = params[:image_url] || @recipe.image_url

  recipe.save
  render 'show.json.jbuilder'
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    render json: {message: "Successfully removed recipe."}
  end
end