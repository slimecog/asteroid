class SingleAsteroid
  attr_reader :name,
              :reference,
              :danger
  def initialize(name, reference, danger)
    @name      = name
    @reference = reference
    @danger    = danger
  end
end
