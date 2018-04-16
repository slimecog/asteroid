require "rails_helper"

describe "as a registered user" do
  describe "when i send a get request to the favorites endpoint with my api key" do
    it "returns my favorite asteroid as a json object" do
      user = create(:user)
      user.create_api_key(value: "abc123")
      user.favorites.create(neo_reference_id: "2153306")
      json_response = File.open("./spec/fixtures/asteroid_by_id.json")
      stub_request(:get, "https://api.nasa.gov/neo/rest/v1/neo/2153306?api_key=#{ENV["nasa_api_key"]}")
        .to_return(status: 200, body: json_response)


      get "/api/v1/user/favorites?api_key=#{user.api_key.value}"

      results = JSON.parse(response.body, symbolize_names: true)

      expect(results).to be_a(Array)
      expect(results[0]).to be_a(Hash)
      expect(results[0][:id]).to eq(1)
      expect(results[0][:neo_reference_id]).to eq("2153306")
      expect(results[0][:user_id]).to eq(1)
      expect(results[0][:asteroid][:name]).to eq("153306 (2001 JL1)")
      expect(results[0][:asteroid][:is_potentially_hazardous_asteroid]).to eq(false)
    end
  end
end
# ```[
#   {
#     "id":1,
#     "neo_reference_id": "2153306",
#     "user_id": 1,
#     "asteroid": {
#       "name": "153306 (2001 JL1)",
#       "is_potentially_hazardous_asteroid": false,
#     }
#   }
# ]```
