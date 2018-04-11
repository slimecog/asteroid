require "rails_helper"

describe "as a registered user" do
  describe "when i send a get request to the favorites endpoint with my api key" do
    it "returns my favorite asteroid as a json object" do
      user = create(:user)
      user.create_api_key(value: "abc123")
      user.favorites.create(neo_reference_id: "2153306")

      get "/api/v1/user/favorites?api_key=#{user.api_key}"

    end
  end
end




# Then I should receive a JSON response as follows:```
#
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
