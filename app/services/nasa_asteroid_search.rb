class NASAAsteroidSearch
  def initialize(start_date, end_date, id = nil)
    @start_date = start_date
    @end_date   = end_date
    @id         = id
  end

  def run
    get_json("/neo/rest/v1/feed?start_date=#{start_date}&end_date=#{end_date}&api_key=#{ENV["nasa_api_key"]}")
  end

  def by_id
    get_json("/neo/rest/v1/neo/#{id}?api_key=#{ENV["nasa_api_key"]}")
  end

  private
    attr_reader :start_date,
                :end_date,
                :id

    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new("https://api.nasa.gov")
    end
end
