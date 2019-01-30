json.recipes do
    json.array! @recipes do |recipe|
        json.extract! recipe, :id, :title, :method, :image_url
    end
end
