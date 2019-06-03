json.recipes do
    json.array! @recipes do |recipe|
        json.extract! recipe, :id, :title, :method, :image_url, :ingredients, :user_id
        json.user recipe.user
    end
end
