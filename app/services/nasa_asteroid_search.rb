class NASAAsteroidSearch
  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  def run
    get_json("/neo/rest/v1/feed?start_date=#{start_date}&end_date=#{end_date}&api_key=#{ENV["nasa_api_key"]}")
  end

  private
    attr_reader :start_date,
                :end_date

    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new("https://api.nasa.gov")
    end
end
