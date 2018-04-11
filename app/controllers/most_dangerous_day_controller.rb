class MostDangerousDayController < ApplicationController
  def index
    most_dangerous_day
    @start_date = (Date.parse(params[:start_date])).to_s
    @end_date = (Date.parse(params[:end_date])).to_s
  end

  private
    def find_in_range
      (NASAAsteroids.new(params[:start_date], params[:end_date]).neos).flatten
    end

    def dangerous_asteroids
      #should be a reduce method but it was being buggy =(
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
