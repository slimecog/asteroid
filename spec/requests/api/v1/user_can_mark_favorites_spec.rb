require "rails_helper"

describe "as a registered user" do
  context "when i visit '/api/v1/user/favorites'" do
    it "shows all the asteroid i just favorited" do
      user = create(:user)
      user.create_api_key(value: "abc123")
      user.favorites.create(neo_reference_id: "2153306")
      json_response = File.open("./spec/fixtures/new_favorite.json")
      stub_request(:get, "https://api.nasa.gov/neo/rest/v1/neo/2021277?api_key=#{ENV["nasa_api_key"]}")
        .to_return(status: 200, body: json_response)

      post "/api/v1/user/favorites?api_key=#{user.api_key.value}&neo_reference_id=2021277"

      results = JSON.parse(response.body, symbolize_names: true)

      expect(results).to be_a(Hash)
      expect(results[:id]).to eq(2)
      expect(results[:neo_reference_id]).to eq("2021277")
      expect(results[:user_id]).to eq(1)
      expect(results[:asteroid][:name]).to eq("21277 (1996 TO5)")
      expect(results[:asteroid][:is_potentially_hazardous_asteroid]).to eq(false)
    end
  end
end
# ```{
#   "id":2,
#   "neo_reference_id": "2021277",
#   "user_id": 1,
#   "asteroid": {
#     "name": "21277 (1996 TO5)",
#     "is_potentially_hazardous_asteroid": false,
#   }
# }```
