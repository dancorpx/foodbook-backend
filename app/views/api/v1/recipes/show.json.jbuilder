json.extract! @recipe, :id, :title, :method, :image_url, :ingredients, :user_id
    json.user @recipe.user, :avatar