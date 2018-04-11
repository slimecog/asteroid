class Asteroid
  attr_reader :name,
              :reference,
              :danger

  def initialize(attrs = {})
    @name = attrs[:name]
    @reference = attrs[:neo_reference_id]
    @danger = attrs[:is_potentially_hazardous_asteroid]
  end
end
