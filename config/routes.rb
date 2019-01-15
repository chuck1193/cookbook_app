Rails.application.routes.draw do
  namespace :api do
    get '/api/one_recipe_url' => 'recipe#one_recipe_action'
  end
end
