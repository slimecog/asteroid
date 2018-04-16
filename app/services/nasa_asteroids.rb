class NASAAsteroids
  def initialize(start_date, end_date, id = nil)
    @start_date = start_date
    @end_date   = end_date
    @id         = id
  end

  def neos
    NASAAsteroidSearch.new(start_date, end_date, nil).run[:near_earth_objects].map do |raw_date|
      raw_date[1].map do |raw_asteroid|
        Asteroid.new(raw_asteroid)
      end
    end
  end

  def by_id
    raw_asteroid = NASAAsteroidSearch.new(nil, nil, id).by_id
    SingleAsteroid.new(raw_asteroid[:name], raw_asteroid[:neo_reference_id], raw_asteroid[:is_potentially_hazardous_asteroid])
  end

  private
    attr_reader :start_date,
                :end_date,
                :id
end
