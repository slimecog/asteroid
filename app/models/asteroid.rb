class Asteroid
  attr_reader :name,
              :reference,
              :approach_date,
              :danger

  def initialize(attrs = {})
    @name          = attrs[:name]
    @reference     = attrs[:neo_reference_id]
    @approach_date = attrs[:close_approach_data].first[:close_approach_date]
    @danger        = attrs[:is_potentially_hazardous_asteroid]
  end

  def dangerous?
    @danger == true
  end
end
