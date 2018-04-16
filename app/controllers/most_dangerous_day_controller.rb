class MostDangerousDayController < ApplicationController
  def index
    most_dangerous_day
    date_formatter
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

    def date_formatter
      @start_date = (Date.new(params[:start_date][0..3].to_i, params[:start_date][5..6].to_i, params[:start_date][8..9].to_i)).strftime("%B %e, %Y")
      @end_date = (Date.new(params[:end_date][0..3].to_i, params[:end_date][5..6].to_i, params[:end_date][8..9].to_i)).strftime("%B %e, %Y")
    end

end
