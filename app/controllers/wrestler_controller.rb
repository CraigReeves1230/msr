class WrestlerController < ApplicationController

  include WrestlerHelper

  def new
    @wrestler = Wrestler.new
  end

  def show
    @wrestler = Wrestler.new

    # assign params to instance
    @wrestler.name = params[:wrestler][:name]
    @wrestler.striking = params[:wrestler][:striking]
    @wrestler.slams = params[:wrestler][:slams]
    @wrestler.submission = params[:wrestler][:submission]
    @wrestler.sell_timing = params[:wrestler][:sell_timing]
    @wrestler.mat_and_chain = params[:wrestler][:mat_and_chain]
    @wrestler.transition = params[:wrestler][:transition]
    @wrestler.setting_up = params[:wrestler][:setting_up]
    @wrestler.bumping = params[:wrestler][:bumping]

    @wrestler.technical = params[:wrestler][:technical]
    @wrestler.high_fly = params[:wrestler][:high_fly]
    @wrestler.power = params[:wrestler][:power]
    @wrestler.conditioning = params[:wrestler][:conditioning]
    @wrestler.durability = params[:wrestler][:durability]
    @wrestler.basing = params[:wrestler][:basing]
    @wrestler.reaction_time = params[:wrestler][:reaction_time]

    @wrestler.shine = params[:wrestler][:shine]
    @wrestler.heat = params[:wrestler][:heat]
    @wrestler.ring_awareness = params[:wrestler][:ring_awareness]
    @wrestler.selling = params[:wrestler][:selling]
    @wrestler.comebacks = params[:wrestler][:comebacks]

    @wrestler.execution = execution_score
    @wrestler.ability = ability_score
    @wrestler.psychology = psych_score

    # calculate match score
    @wrestler.score = @wrestler.calculate_score(execution_score, ability_score, psych_score)

    #store star rating
    @wrestler.star_rating = @wrestler.convert_to_star_rating(@wrestler.score)

    # send to results page
    render 'wrestler/wrestler_score'

  end

  def execution_score
    striking = @wrestler.striking
    slams = @wrestler.slams
    submission = @wrestler.submission
    sell_timing = @wrestler.sell_timing
    mat_and_chain = @wrestler.mat_and_chain
    transition = @wrestler.transition
    setting_up = @wrestler.setting_up
    bumping = @wrestler.bumping
    (striking + slams + submission + sell_timing + mat_and_chain + transition + setting_up + bumping) / 8.0
  end

  def ability_score
    technical = @wrestler.technical
    high_fly = @wrestler.high_fly
    power = @wrestler.power
    conditioning = @wrestler.conditioning
    durability = @wrestler.durability
    basing = @wrestler.basing
    reaction_time = @wrestler.reaction_time
    (technical + high_fly + power + conditioning + durability + basing + reaction_time) / 7.0
  end

  def psych_score
    shine = @wrestler.shine
    heat = @wrestler.heat
    selling = @wrestler.selling
    comebacks = @wrestler.comebacks
    ring_awareness = @wrestler.ring_awareness
    (shine + heat + selling + comebacks + ring_awareness) / 5.0
  end

end


