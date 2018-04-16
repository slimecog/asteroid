class FavoritesSerializer < ActiveModel::Serializer
  attributes :id,
             :neo_reference_id,
             :user_id,
             :asteroid

  def asteroid
    asteroid = NASAAsteroids.new(nil, nil, object.neo_reference_id).by_id
    {
      "name": asteroid.name,
      "is_potentially_hazardous_asteroid": asteroid.danger
    }
  end
end
