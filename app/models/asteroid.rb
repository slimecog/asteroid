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

  def formatted_approach_date
    (Date.new(approach_date[0..3].to_i, approach_date[5..6].to_i, approach_date[8..9].to_i)).strftime("%B %e, %Y")
  end
end
