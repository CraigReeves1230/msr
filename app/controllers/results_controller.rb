class ResultsController < ApplicationController

  def new
    @match = Result.new
  end

  def home
   render '/home'
  end

  def create
    @match = Result.new(match_params)
    @match.star_rating = @match.calculate(match_params[:execution],
                                    match_params[:heat], match_params[:action], match_params[:layout],
                                    match_params[:selling], match_params[:factoring_heat].to_boolean)

    @match.score = @match.calculate_score(match_params[:execution],
                                    match_params[:heat], match_params[:action], match_params[:layout],
                                    match_params[:selling], match_params[:factoring_heat].to_boolean)
    render 'results/results'
  end

  def match_params
    params.require(:result).permit(:name, :execution, :heat, :action, :layout, :selling, :factoring_heat)
  end

end
