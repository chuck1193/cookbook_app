json.array! @recipes.each do |recipe|
  json.id recipe.id
  json.title recipe.title
  json.chef recipe.chef
  json.image_url recipe.image_url
  end
  

  json.formatted do #creates a nested hash
  json.ingredients recipe.ingredients_list
  json.directions recipe.directions_list 
  json.prep_time recipe.friendly_prep_time
  json.created_at recipe.friendly_created_at
end 