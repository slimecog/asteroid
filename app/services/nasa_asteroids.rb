class NASAAsteroids
  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  def neos
    NASAAsteroidSearch.new(start_date, end_date).run[:near_earth_objects].map do |raw_date|
      raw_date[1].map do |raw_asteroid|
        Asteroid.new(raw_asteroid)
      end
    end
  end

  private
    attr_reader :start_date,
                :end_date
end
