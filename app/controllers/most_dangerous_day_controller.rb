class MostDangerousDayController < ApplicationController
  def index
    most_dangerous_day
    dates_in_range
  end

  private
    def dates_in_range
      @start_date = Date.parse(params[:start_date])
      @end_date = Date.parse(params[:end_date])
    end

    def find_in_range
      (NASAAsteroids.new(params[:start_date], params[:end_date]).neos).flatten
    end

    def dangerous_asteroids
      find_in_range.map do |asteroid|
        a = []
        if asteroid.dangerous?
          a << asteroid
        end
      end.compact.flatten
    end

    def dates_by_danger
      dangerous_asteroids.sort_by { |asteroid| asteroid.approach_date }
    end

    def most_dangerous_day
      @asteroids = dates_by_danger.find_all { |asteroid| asteroid.approach_date == dates_by_danger.first.approach_date }
    end
end
