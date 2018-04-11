require "rails_helper"

feature "user can see most dangerous day" do
  context "with valid start and end dates" do
    it "shows most dangerous day" do
      json_response = File.open("./spec/fixtures/asteroids.json")
      stub_request(:get, "https://api.nasa.gov/neo/rest/v1/feed?start_date=2018-01-01&end_date=2018-01-07&api_key=#{ENV["nasa_api_key"]}")
        .to_return(status: 200, body: json_response)

      visit "/"

      fill_in "start_date", with: "2018-01-01"
      fill_in "end_date", with: "2018-01-07"
      click_on "Determine Most Dangerous Day"

      expect(current_path).to eq('/most_dangerous_day')
      expect(page).to have_content('Most Dangerous Day')

    end
  end
end


# Feature: A guest user visits the root page and enters a start date and end date. The resulting page will display the most dangerous day in that range based on which day has the most `is_potentially_dangerous_asteroid` set to `true`. Given the scenario below, it should be January 1, 2018 with 3 potentially dangerous asteroids.
#
# And I should see "January 1, 2018 - January 7, 2018"
# And I should see a heading for the most dangerous day in that range "January 1, 2018"
# And I should see 3 asteroids in that list
#
# And I should see "Name: (2014 KT76)"
# And I should see "NEO Reference ID: 3672906"
#
# And I should see "Name: (2001 LD)"
# And I should see "NEO Reference ID: 3078262"
#
# And I should see "Name: (2017 YR1)"
# And I should see "NEO Reference ID: 3794979"
