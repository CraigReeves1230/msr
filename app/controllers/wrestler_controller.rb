class WrestlerController < ApplicationController

  def new
    @wrestler = Result.new
  end

  def show
    @wrestler = Result.new
    @wrestler.name = params[:wrestler][:name]
    @wrestler.execution = execution_score
    @wrestler.layout = psych_score
    @wrestler.action = ability_score
    @wrestler.score = @wrestler.calculate_score(execution_score, 0.0, ability_score, psych_score, psych_score, false)
    @wrestler.star_rating = @wrestler.convert_to_star_rating(@wrestler.score)
    render 'wrestler/wrestler_score'
  end

  def psych_score
    shine = params[:wrestler][:shine].to_f
    heat = params[:wrestler][:heel_heat].to_f
    awareness = params[:wrestler][:ring_awareness].to_f
    comebacks = params[:wrestler][:comebacks].to_f
    selling = params[:wrestler][:facials_and_selling].to_f
    (shine + heat + awareness + comebacks + selling) / 5.0
  end

  def ability_score
    technical = params[:wrestler][:technical].to_f
    highfly = params[:wrestler][:high_fly].to_f
    durability = params[:wrestler][:durability].to_f
    reaction = params[:wrestler][:reaction_time].to_f
    conditioning = params[:wrestler][:conditioning].to_f
    power = params[:wrestler][:power].to_f
    basing = params[:wrestler][:basing].to_f
    (technical + highfly + durability + reaction + conditioning + power + basing) / 7.0
  end

  def execution_score
    strike = params[:wrestler][:striking].to_f
    sub = params[:wrestler][:submission].to_f
    mat = params[:wrestler][:matt_and_chain].to_f
    trans = params[:wrestler][:transition].to_f
    bump = params[:wrestler][:bumping].to_f
    selltime = params[:wrestler][:sell_timing].to_f
    settingup = params[:wrestler][:setting_up].to_f
    slams = params[:wrestler][:slams].to_f
    (strike + sub + mat + trans + bump + selltime + settingup + slams) / 8.0
  end

end
